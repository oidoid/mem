## Changelog

### v6.0.0 (unreleased)
- \[breaking\] drop dashes in name
- \[update\] include kern table for compatibility
- \[fix\] use line height in demo
- \[dev\] test JSON types
- \[dev\] add more examples to demo
- \[breaking\]\[fix\]\[update\]\[dev\]\[build\] revise build scripts
  - Breaking: add -sheet suffix to Aseprite metadata JSON
  - Update: bump out most 5x6 capitals to four pixels wide
  - Fix: non-alphanumeric kerning
  - Fix: output missing character cels in 10x spritesheet
  - Build: lots of miscellaneous improvements
- \[update\] improve capital width consistency
  - Increase T, Y, and Z from three to four pixels wide.
  - Reduce N from five to four pixels wide.
- \[update\] round C and Y; smooth M and W
- \[dev\] add favicon to demo
- \[update\] round c; add definition to &
- \[dev\] add ttfdumps
- \[fix\] font PostScript name
- \[update\] reduce kerning between s and j
- \[docs\] note power of two sprite sheet size issue
- \[dev\] add capital pangram to demo
- \[dev\]\[fix\] non-deterministic builds
- \[update\] round G, M, W, m, n, w; lighten J, j; raise W's tie; fix blurry favicon
- \[update\] favor smoothing to rounding for M, W, m, n, u, w; drop serif on T; round U; drop y. and _f kerning
- \[update\] smooth c
- \[mem prop 5x6\]\[docs\] add design principles
- \[update\] shrink V's width
- \[dev\] move demo.html to index.html
- \[dev\] add CNAME record
- \[dev\] add start script
- \[mem prop 5x6\]\[update\] shrink ?
- \[dev\]\[fix\] increase live-server watch debounce duration
- \[mem prop 5x6\]\[update\] emphasize % bowls
- \[dev\] revise demo to be more presentable
- \[build\]\[dev\] upgrade to Aseprite v1.2.20-x64
- \[docs\] update website

### v5.0.0
- \[breaking\] switch to Aseprite.

### v4.0.0
- \[breaking\] fix font name in .ttf

### v3.1.3
- \[update\] increase height of m

### v3.1.2
- \[update\] redesign 4x4 q, s
- \[update\] lighten 4x4 Q

### v3.1.1
- \[update\] add and update 3x5 glyphs
- \[update\] 4x4 glyphs
  - Redesign: \*, 3, 6, @, E, K, M, S, W, e
  - Thicken: V, v
  - Lighten: 7, 9, B, C, Q, U, j, l, o, s, u, z, ~
- \[update\] 4x4 mono
  - Thicken 4, G, a
  - Lighten e, r

### v3.1.0
- New: experimental 3x2, 3x3, and 3x5px sizes (not exported)
- \[update\] r glyph

### v3.0.4
- \[update\] n and o glyphs

### v3.0.3
- \[update\] increase height of n to match u and m

### v3.0.2
- \[update\] kern L and l to T and t

### v3.0.1
- \[fix\] f geometry in proportional .fnt file
- \[update\] improve glyphs for @, B, D, R
- \[update\] recenter D, E, K, and guillemets («, »)

### v3.0.0
- \[breaking\] split font into mem mono and mem (proportional)
- \[fix\] character codes 240 - 246
- \[update\] improve glyphs for beamed eighth note (♫), one (1), lowercase f,
  uppercase G, uppercase J, uppercase M, lower and uppercase W

### v2.0.1
- \[fix\] add space character to FontForge and .ttf output

### v2.0.0
- \[breaking\] (partial) implementation of Code Page 437

### v1.1.0
- New: sprite sheet and .fnt character map
- \[update\] crop 1px padding
- \[update\] thicken right leg of w's and push grave accent (`) right one pixel

### v1.0.3
- \[fix\] exclude intermediate build files from NPM package

### v1.0.2
- \[fix\] include build folder in Git version commit

### v1.0.1
- \[fix\] include binary in NPM package

### v1.0.0
- New: initial release
