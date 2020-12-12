## Changelog

### v6.1.0 (unreleased)

- \[demo\] Add Dracula example
- \[mem prop 5x6\]\[mem prop 5x5\]\[mem prop 3x5\] straighten semicolon, lower colon and semicolon
- \[docs\] Improve download link specificity
- \[mem prop 5x6\]\[mem prop 5x5\]\[mem prop 3x5\] straighten comma
- \[build\] Export TypeScript definitions
- \[build\] Add copyright to font for deterministic builds
- \[build\] Revise TypeScript config
- \[test\]\[build\] Upgrade TypeScript
- \[demo\] Reduce horizontal page margin to match top
- \[docs\] Add explicit license

### v6.0.4

- \[build\] Upgrade dependencies
- \[mem prop 5x6\]\[update\] reduce kerning for "s,"
- \[mem prop 5x6\]\[update\] reduce kerning for "T.", "r,", and "r."
- \[dev\] upgrade dependencies
- \[dev\] move the dashboard below the header
- \[dev\] disable demo's sticky header on mobile

### v6.0.3

- \[fix\] workaround Aseprite kerning

### v6.0.2

- \[mem prop 5x6\]\[update\] extend W and M
- \[mem mono 3x3\]\[update\] center ., :, and ~; widen c; raise n; smooth N
- \[update\] rename all monospaced fonts
- \[mem prop 5x6\]\[update\] reduce all , kerning; trim & descender
- \[update\] rename all proportional fonts
- \[dev\] drop empty glyph ranges from demo
- \[dev\] fix favicon for dark backgrounds
- \[mem prop 5x6\]\[update\] drop code page 437; make 9 a rotated 6; make W a
  flipped M; descend &
- \[mem prop 3x5\]\[update\] improve parity with 5x6

### v6.0.1

- \[docs\]\[fix\] Changelog link

### v6.0.0

- \[dev\]\[fix\] Chrome font rendering in demo
- \[dev\] overhaul demo
- \[mem prop 5x6\]\[update\] smooth / and \
- \[dev\]\[fix\] NPM keywords
- \[dev\] add GitHub banner
- \[mem prop 5x6\]\[update\] add CP437 glyphs; raise serif on 1; add leg to R;
  smooth b, d, i, j, q; improve x's proportions
- \[mem prop 5x6\]\[update\] smooth V, h, j, p, and v
- \[mem prop 5x6\]\[update\] shrink uppercase to 3px wide (A, B, C, D, E, F, G,
  H, J, K, L, N, O, P, Q, R, S, T, U, V, X, Y, and Z); make 0 angular
- \[dev\] format with Prettier
- \[mem prop 5x6\]\[update\] smooth smileys and most caps (&, A, B, C, G, J, N,
  O, P, Q, S, T, U, and Y); widen r
- \[docs\] update website
- \[build\]\[dev\] upgrade to Aseprite v1.2.20-x64
- \[dev\] revise demo to be more presentable
- \[mem prop 5x6\]\[update\] emphasize % bowls
- \[dev\]\[fix\] increase live-server watch debounce duration
- \[mem prop 5x6\]\[update\] shrink ?
- \[dev\] add start script
- \[dev\] add CNAME record
- \[dev\] move demo.html to index.html
- \[update\] shrink V's width
- \[mem prop 5x6\]\[docs\] add design principles
- \[update\] smooth c
- \[update\] favor smoothing to rounding for M, W, m, n, u, w; drop serif on T;
  round U; drop y. and \_f kerning
- \[update\] round G, M, W, m, n, w; lighten J, j; raise W's tie; fix blurry
  favicon
- \[dev\]\[fix\] non-deterministic builds
- \[dev\] add capital pangram to demo
- \[docs\] note power of two sprite sheet size issue
- \[update\] reduce kerning between s and j
- \[fix\] font PostScript name
- \[dev\] add ttfdumps
- \[update\] round c; add definition to &
- \[dev\] add favicon to demo
- \[update\] round C and Y; smooth M and W
  - Reduce N from five to four pixels wide.
  - Increase T, Y, and Z from three to four pixels wide.
- \[update\] improve capital width consistency
  - Build: lots of miscellaneous improvements
  - Fix: output missing character cels in 10x spritesheet
  - Fix: non-alphanumeric kerning
  - Update: bump out most 5x6 capitals to four pixels wide
  - Breaking: add -sheet suffix to Aseprite metadata JSON
- \[breaking\]\[fix\]\[update\]\[dev\]\[build\] revise build scripts
- \[dev\] add more examples to demo
- \[dev\] test JSON types
- \[fix\] use line height in demo
- \[update\] include kern table for compatibility
- \[breaking\] drop dashes in name

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

- \[breaking\](partial) implementation of Code Page 437

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

- \[new\] initial release
