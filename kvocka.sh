#!/bin/bash
SUFF=html
if test -n "$1" ; then
	SUFF=$1
fi
if test "$SUFF" == html; then
cat << END
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="sk" lang="sk">
 <head>
  <meta http-equiv="Content-type" content="text/html;charset=UTF-8" />
  <title>
   VOC 2013
  </title>
 </head>
<body>
END
fi
yacite read pubcit | 
	yacite filter 'year==2013 and myown' > voc2013.myown.yaml
yacite filter '"cc" in tags' < voc2013.myown.yaml | 
	yacite render -e '{ title: "Karentované (Current Contents) časopisy zahraničné aj domáce" }' kvocka_moje.${SUFF}
yacite filter '"scopus" in tags and "cc" not in tags' < voc2013.myown.yaml | 
	yacite render -e '{ title: "Časopisy zahraničné aj domáce evidované v databáze SCOPUS" }' kvocka_moje.${SUFF}
yacite read pubcit | 
	yacite filter --notmyown 'year in [2012,2013] and "voc2012" not in tags' > voc2013.yaml
yacite filter --notmyown '("wos" in tags or "sci" in tags or "scopus" in tags) and not "dautor" in tags' > voc2013.sci.no.dautor.yaml < voc2013.yaml
yacite filter --notmyown '("wos" in tags or "sci" in tags or "scopus" in tags) and "dautor" in tags' > voc2013.sci.dautor.yaml < voc2013.yaml
yacite render -e '{ title: "Citácie podľa SCI, multidisciplinárne ISI, SCOPUS – len zahraničný autor" }' kvocka.${SUFF} < voc2013.sci.no.dautor.yaml|tee voc2013.sci.no.dautor.${SUFF}
yacite render -e '{ title: "Citácie podľa SCI, multidisciplinárne ISI, SCOPUS – domáci autor" }' kvocka.${SUFF} < voc2013.sci.dautor.yaml | tee voc2013.sci.dautor.${SUFF}
if test "$SUFF" == html; then
cat <<END
</body>
</html>
END
fi

