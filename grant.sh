#!/bin/bash
GRANT="$1"
YEAR="$2"
cat << END
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="sk" lang="sk">
 <head>
  <meta http-equiv="Content-type" content="text/html;charset=UTF-8" />
  <title>
   $GRANT za rok $YEAR
  </title>
 </head>
<body>
END
yacite read pubcit | 
	yacite filter 'year>='"$YEAR"' and myown and "'$GRANT'" in grants' | yacite sort -k year > grant.myown.yaml
	yacite render -e '{title: Publikované články}' kvocka_moje.html < grant.myown.yaml
yacite read pubcit | 
	yacite filter --notmyown 'year >= '"$YEAR" | 
	yacite filter --myown '"'$GRANT'" in grants' |
	yacite sort -k year > grant.yaml
	yacite render -e '{title: Citácie}' kvocka.html < grant.yaml
cat <<END
</body>
</html>
END

