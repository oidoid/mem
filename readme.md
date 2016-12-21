![logo](doc/logo.png)

# mem-font
4x4 monospaced and proportional pixel fonts for
[Code Page 437](https://en.wikipedia.org/wiki/Code_page_437)

## Install
```npm i -S mem-font```

## Character Map
![mem character map](build/mem-10x.png)

## [Changelog](doc/changelog.md)

## [Todo](doc/todo.md)

## Build

### System Dependencies
- fontforge
- imagemagick
- potrace

### GIMP Layout
- Characters are positioned by CP437 code on a 16x16 grid
- Characters are each 6x6 but cropped to 4x4 when exported; for the proportional
  font, character widths are further cropped to their occupancy and may be
  kerned
- Characters are scaled by 10 when exported for accurate SVG tracing
- Exported filename convention is ```_yy_xx.svg``` where yy is row [0, 15]
  and xx is column [0, 15]

Initial GIMP guidelines were drawn using the
[Grid of Guides script](http://registry.gimp.org/node/12003)

### Image Diff

Image diffing in Git requires a custom configuration. One possible configuration
is to add a shell script to your path, `git-diff-img`:

```sh
#!/usr/bin/env sh
# $@ images
exec git difftool -x '
  compare "$LOCAL" "$REMOTE" png:- |
  montage -mode concatenate "$LOCAL" png:- "$REMOTE" png:- |
  display -title "$LOCAL: Local | Diff | Remote" png:-
' "$@"
```

Execute against images only: ```git diff-img **.png```

## Links

### Alternatives
- [creep](https://github.com/romeovs/creep)
- [Press Start 2P](https://fonts.google.com/specimen/Press+Start+2P)

### References
- [Creating a Pixel Font for Your Game](http://monsterfacegames.blogspot.com/2013/10/creating-pixel-font-for-your-game.html)
- [.fnt File Format](www.angelcode.com/products/bmfont/doc/file_format.html)
- [FontForge Documentation](https://fontforge.github.io/en-US/documentation/)
- [FontForge Python Scripting](https://fontforge.github.io/en-US/documentation/scripting/python/#Font)
- [FontForge Bitmap Strikes Documentation](https://fontforge.github.io/editexample8.html)

## License (GPLv3)
© 2016 Stephen Niedzielski

This program is free software: you can redistribute it and/or modify it
under the terms of the GNU General Public License as published by the
Free Software Foundation, version 3 of the License.

This program is distributed in the hope that it will be useful, but
WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General
Public License for more details.

You should have received a copy of the GNU General Public License along
with this program. If not, see <http://www.gnu.org/licenses/>.