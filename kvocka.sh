#!/bin/bash
cat << END
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="sk" lang="sk">
 <head>
  <meta http-equiv="Content-type" content="text/html;charset=UTF-8" />
  <title>
   Bibliografia
  </title>
 </head>
<body>
END
yacite read data | yacite filter --notmyown 'year >=2011 and "voc2011" not in tags' > voc2012.yaml
yacite filter --notmyown '("wos" in tags or "sci" in tags or "scopus" in tags) and not "dautor" in tags' > voc2012.sci.no.dautor.yaml < voc2012.yaml
yacite filter --notmyown '("wos" in tags or "sci" in tags or "scopus" in tags) and "dautor" in tags' > voc2012.sci.dautor.yaml < voc2012.yaml
yacite render -e '{ title: "Citácie podľa SCI, multidisciplinárne ISI, SCOPUS – len zahraničný autor" }' kvocka.html < voc2012.sci.no.dautor.yaml|tee voc2012.sci.no.dautor.html
yacite render -e '{ title: "Citácie podľa SCI, multidisciplinárne ISI, SCOPUS – domáci autor" }' kvocka.html < voc2012.sci.dautor.yaml | tee voc2012.sci.dautor.html
cat <<END
</body>
</html>
END


