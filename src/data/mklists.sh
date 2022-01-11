#!/bin/bash
#
# Create lists of candidate answers and allowed word list.
#

# Date of the Wikipedia dump to fetch
DUMPDATE=20220101

# Normalize a list of words to lowercase 5-character non-stress words
normalize()
{
  sed '
  # Remove lowercase stresses
  y/άέήίϊΐόύϋΰώς/αεηιιιουυυωσ/
  # Remove uppercase stresses
  y/ΆΈΉΊΪΌΎΫΏ/ΑΕΗΙΙΟΥΥΩ/
  # Map lowercase to uppercase
  y/αβγδεζηθικλμνξοπρστυφχψω/ΑΒΓΔΕΖΗΘΙΚΛΜΝΞΟΠΡΣΤΥΦΧΨΩ/
  # One Greek word per line; remove all else
  s/[^ΑΒΓΔΕΖΗΘΙΚΛΜΝΞΟΠΡΣΤΥΦΧΨΩ]/\n/g
  ' |
  # Keep only 5-character Greek words
  egrep '^[ΑΒΓΔΕΖΗΘΙΚΛΜΝΞΟΠΡΣΤΥΦΧΨΩ]{5}$'
}

# Create list of allowed words

# Convert the hunspell-el dictionary to UTF-8
iconv -f ISO-8859-7 -t UTF-8 /usr/share/myspell/el_GR.dic |
  # Remove proper nouns
  grep -v '^[Α-ΩΆΈΉΊΌΎΏ]' |
  normalize |
  # Keep for later use
  sort -u >allowed-words.txt

# Create JavaScript allowed word list
# Convert to JavaScript object
sed '1i\
const words = {
s/^/  /
s/$/: true,/
$a\
}\
\
export default words
' <allowed-words.txt > words.js

# Create possible answers from frequent correct Wikipedia words

# Obtain Greek Wikipedia dump
curl https://ftp.acc.umu.se/mirror/wikimedia.org/dumps/elwiki/$DUMPDATE/elwiki-$DUMPDATE-pages-articles.xml.bz2 |
  # Decompress
  bzip2 -dc |
  normalize |
  sort |
  # Count occurrences
  uniq -c |
  # Get only correct ones
  join -2 2 allowed-words.txt - |
  # Order by frequency
  sort -k2rn |
  # Get most frequent ones (same number as English)
  head -n 2079 |
  sort |
  # Convert to JavaScript array
  sed '1i\
const answers = [
# Remove frequency count
s/ .*//
s/^/  "/
s/$/",/
$a\
]\
\
export default answers
' >answers.js

rm allowed-words.txt
