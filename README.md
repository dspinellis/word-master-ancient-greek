# Word Master — Ancient Greek version

🔗 https://dspinellis.github.io/word-master-ancient-greek/

Heavily inspired by [Wordle](https://www.powerlanguage.co.uk/wordle/), Word Master is a word guessing game similar to Mastermind.
This Ancient Greek word version is almost completely based on the
[original English word version](https://github.com/octokatherine/word-master),
which can be played [here](https://octokatherine.github.io/word-master/).

The original author of Word Master,
[Katherine Peterson](https://github.com/octokatherine),
created it because she loved Wordle,
but the once a day limit left her wanting more.
I forked her version and converted it to use
first [Greek words](https://github.com/dspinellis/word-master)
and here Ancient Greek words,
because I love the Greek language,
and have been writing software to support Greek for the past 40 years.

I created the lists of acceptable and candidate words by processing the
classic ancient Greek texts of the
[Perseus Project digital library](http://www.perseus.tufts.edu/hopper/)
to remove SGML markup, English and Latin text,
convert the Greek characters from Beta code into Unicode,
and keep words that exactly five characters long.
The Unix shell script for creating the two lists is
available
[here](https://github.com/dspinellis/word-master-ancient-greek/blob/main/src/data/mklists.sh).
The translations of all texts were kindly provided by
[helmadik](https://github.com/helmadik) of the
[ΛΟΓΕΙΟΝ](https://logeion.uchicago.edu/lexidium) project,
which you can use to look up words.

## Rules

You have 6 guesses to guess the correct word.
Each guess can be any valid word.

After submitting a guess, the letters will turn gray, green, or yellow.

- Green: The letter is correct, in the correct position.
- Yellow: The letter is correct, but in the wrong position.
- Gray: The letter is incorrect.

## Contributing

Feel free to open an issue for any bugs or feature requests.

To contribute to the code, see [CONTRIBUTING.md](https://github.com/dspinellis/word-master-ancient-greek/blob/main/CONTRIBUTING.md)

## See also

The [Wordles of the world](https://rwmpelstilzchen.gitlab.io/wordles/) list
contains a comprehensive collection of Wordle-like games in diverse languages.
