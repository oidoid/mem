## To-do

- Fix up all the fonts. Only 5x6 has been used lately and the rest need
  maintenance.
- Validate the sheets are usable in-game. For example, power of 2 sizes.
- Make monospace font characters occupy 4px wide where possible.
- Why did I consider but not use
  `inkscape -z --verb SelectionTrace  -l foo.svg ../png/_3_4.png` instead of
  potrace?
- Add more demos.
- Add font to oddoid.com with aseprite-atlas.
- Read through the FontForge docs.
- The font metrics JSON is being clobbered by the sprite sheets from Aseprite
  due to a naming conflict. Reevaluate the name of the JSON which seems to have
  mostly font dimensional information.
- Kerning from non-alphanumerical character to non-alphanumerical character like
  `//` is not being set correctly in FontForge. Setting kerning for `/a` works
  correctly but not `/^`.
- Clean up these crufty build files.
- The font sizes are split across TTF files instead of being in one. Can this be
  fixed?

