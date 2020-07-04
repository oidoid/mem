## To-do

- Clean up the readme. Summarize what's actually available, what works, how
  (e.g., 7px tall in Aseprite but no kerning or Gimp 7px with kerning). Add that
  real precise font info.
- Fix up all the fonts. Only 5x6 has been used lately and the rest need
  maintenance.
- Make monospaced font characters occupy 4px wide where possible. The 5x6 font
  has shown many opportunities for 4px consistency.
- The font sizes are split across TTF files instead of being in one. Can this be
  fixed?
- Validate the sheets are usable in-game.
- Note code page 437 and many missing characters in the readme.
- Add font to oddoid.com with aseprite-atlas.
- Why did I consider but not use
  `inkscape -z --verb SelectionTrace -l foo.svg ../png/_3_4.png` instead of
  potrace?
- Read through the FontForge docs.
- The font sizes are split across TTF files instead of being in one. Can this be
  fixed?
- Review other font references such as those in the links and earth20 folder.
- Is the old makefile kaput? Why? It was challenging to work with commands that
  don't have 1:1 inputs and outputs, make is generally super limited and
  antiquated, shell and make are similar: 1) very old 2) lots of legacy 3) no
  modern affordances 4) lots of pitfalls 5) very limited 6) syntaxes are
  dangerously similar and dissimilar 7) make uses sh by default 8) make language
  is a superset of sh 9) tabbed recipes suck 10) kind of cryptic even after
  years of makefiles. What's the alternative for dependency-based building? Is
  anything practical? Quite promising, disappointing, and disheartening.
- Add a font that varies line width such as an X with uneven legs.
- Fix the terminology: sans light, font family versus typography, terms around
  stroke and tail and such.
