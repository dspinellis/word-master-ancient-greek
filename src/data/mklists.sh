#!/bin/sh
#
# Create lists of candidate answers and allowed word list.
# Diomidis Spinellis, January 2022
#

if ! [ -d Classics.nbk ] ; then
  https://www.perseus.tufts.edu/hopper/opensource/downloads/texts/hopper-texts-GreekRoman.tar.gz |
    tar xzf -
  mv Classics Classics.nbk
fi

find Classics.nbk -name \*_gk.xml |
  grep -v HistAugust |
  while read f ; do
    sed '1,/<text[^>]*>/d
      # Remove e.g. Latin text blocks
      /<foreign[^>]*>[^<]*$/,/<\/foreign/d
      # Remove e.g. Latin text in lines
      s/<foreign[^>]*>[^<]*//
      # Remove notes
      s/<note>.*<\/note>//g;
      # Remove other tags
      s/<[^>]*>//g
      # Remove entities
      s/&[^;]*;//g
      # Remove stresses
      s/[|/\\=()+]//g
      # Convert uppercase to Greek
      y/ABCDEFGHIKLMNOPQRSTUWXYZ/ΑΒΞΔΕΦΓΗΙΚΛΜΝΟΠΘΡΣΤΥΩΧΨΖ/
      # Convert lowercase to Greek
      y/abcdefghiklmnopqrstuwxyz/ΑΒΞΔΕΦΓΗΙΚΛΜΝΟΠΘΡΣΤΥΩΧΨΖ/
      # Remove words with omitted characters
      s/[ΑΒΓΔΕΖΗΘΙΚΛΜΝΞΟΠΡΣΤΥΦΧΨΩ]*'\''//g
      # Remove other signs
      s/[*"]//g
      # One Greek word per line; remove all else
      s/[^ΑΒΓΔΕΖΗΘΙΚΛΜΝΞΟΠΡΣΤΥΦΧΨΩ]/\n/g
      ' "$f"
  done |
  # Keep only 5-character Greek words
  egrep '^[ΑΒΓΔΕΖΗΘΙΚΛΜΝΞΟΠΡΣΤΥΦΧΨΩ]{5}$' |
  sort |
  uniq -c |
  sort -rn |
  awk '{print $2}' >all-words.txt

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
' <all-words.txt > words.js

# Create possible answers from frequent correct words
# Get most frequent ones (same number as English)
head -n 2080 all-words.txt |
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

rm all-words.txt
