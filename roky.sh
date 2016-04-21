#!/bin/bash
FROM=$1
TO=$2
SUFF=html
cat << END
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="sk" lang="sk">
 <head>
  <meta http-equiv="Content-type" content="text/html;charset=UTF-8" />
  <style>
  .tag {
  	color:blue;
  }
  </style>
  <title>
   VOC $FROM -- $TO
  </title>
 </head>
<body>
END
yacite read pubcit | 
	yacite filter "year>=$FROM and year<=$TO and myown" | yacite sort -k year > vocroky.myown.yaml
yacite filter '"cc" in tags' < vocroky.myown.yaml | 
	yacite render -e '{ title: "Karentované (Current Contents) časopisy zahraničné aj domáce" }' kvocka_moje.${SUFF}
yacite filter '"scopus" in tags and "cc" not in tags' < vocroky.myown.yaml | 
	yacite render -e '{ title: "Časopisy zahraničné aj domáce evidované v databáze SCOPUS" }' kvocka_moje.${SUFF}
yacite read pubcit | 
	yacite filter --notmyown "year>=$FROM and year<=$TO " |
	yacite sort -k year > vocroky.yaml
yacite filter --notmyown '("wos" in tags or "sci" in tags or "scopus" in tags) and not "dautor" in tags' > vocroky.sci.no.dautor.yaml < vocroky.yaml
yacite filter --notmyown '("wos" in tags or "sci" in tags or "scopus" in tags) and "dautor" in tags' > vocroky.sci.dautor.yaml < vocroky.yaml
yacite render -e '{ title: "Citácie podľa SCI, multidisciplinárne ISI, SCOPUS – len zahraničný autor" }' kvocka.${SUFF} < vocroky.sci.no.dautor.yaml|tee vocroky.sci.no.dautor.${SUFF}
yacite render -e '{ title: "Citácie podľa SCI, multidisciplinárne ISI, SCOPUS – domáci autor" }' kvocka.${SUFF} < vocroky.sci.dautor.yaml | tee vocroky.sci.dautor.${SUFF}
cat <<END
</body>
</html>
END

