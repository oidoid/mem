<img style='image-rendering: pixelated;' width='400' src='doc/logo.png'
  alt='logo'>

# mem-font
4x4 monospaced pixel font

## Installing
```npm i -S mem-font```

## Character Map
<a href='build/mem.png'><img style='image-rendering: pixelated;' width='400'
  src='build/mem.png' alt='mem character map'></a>

## Building

### System Dependencies
- fontforge
- imagemagick
- potrace

### GIMP Layout
- ASCII only :[ Characters are positioned by code on a 16x16 grid
- Characters are each 6x6 but cropped to 4x4 when exported
- Characters are scaled by 10 when exported for accurate SVG tracing
- Exported filename convention is ```_xx_yy.svg``` where xx is row [0, 15]
  and yy is column [0, 15]

Initial guidelines were drawn using the
[Grid of Guides script](http://registry.gimp.org/node/12003)

## Changelog

### v1.1.4
- Update: crop 1px padding
- New: sprite sheet and .fnt character map

### v1.0.3
- Fix: exclude intermediate build files from NPM package

### v1.0.2
- Fix: include build folder in Git version commit

### v1.0.1
- Fix: include binary in NPM package

### v1.0.0
- New: initial release

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