include ../oidlib/config.make

dist_dir := dist
char_dir := $(dist_dir)/char
sheet_dir := $(dist_dir)
src_dir := src

aseprite_files := $(wildcard $(src_dir)/*.aseprite)
src_metafont_files := $(aseprite_files:%.aseprite=%.json)
dist_metafont_files := $(src_metafont_files:$(src_dir)/%=$(dist_dir)/%)
sfd_files := \
  $(aseprite_files:$(src_dir)/%.aseprite=$(dist_dir)/%.sfd) \
  $(aseprite_files:$(src_dir)/%.aseprite=$(dist_dir)/%-aseprite.sfd)
ttf_files := $(sfd_files:%.sfd=%.ttf)
ttfdump_files := $(sfd_files:%.sfd=%.ttfdump)
sheet_png_files := $(aseprite_files:$(src_dir)/%.aseprite=$(dist_dir)/%-sheet.png)
sheet_json_files := $(sheet_png_files:%.png=%.json)
10x_sheet_png_files := $(aseprite_files:$(src_dir)/%.aseprite=$(dist_dir)/%-10x-sheet.png)
10x_sheet_json_files := $(10x_sheet_png_files:%.png=%.json)

# Generate a sequence from 0 through 127 in zero padded hex (00 - 7f).
units := 0 1 2 3 4 5 6 7 8 9 a b c d e f
sixteens := 0 1 2 3 4 5 6 7
sequence := $(foreach sixteen,$(sixteens),$(foreach unit,$(units),$(sixteen)$(unit)))
# $1 font stem like mem-prop-5x6
# $2 extension like bmp or svg
get_char_files = $(sequence:%=$(char_dir)/$(1)-%-10x.$(2))
fonts := $(aseprite_files:$(src_dir)/%.aseprite=%)

.PHONY: build
build: \
  bundle \
  $(ttf_files) \
  $(ttfdump_files) \
  $(sfd_files) \
  $(sheet_png_files) \
  $(sheet_json_files) \
  $(10x_sheet_png_files) \
  $(10x_sheet_json_files) \
  $(dist_metafont_files)

.PHONY: bundle
bundle: | $(dist_dir)/
  $(deno) bundle --config='$(deno_config)' mod.ts '$(dist_dir)/mem.js'

.PHONY: watch\:build
watch\:build:; watchexec --ignore='*/dist/*' '$(make) build'

.PHONY: watch
watch: watch\:build serve

.PHONY: serve
serve: | $(dist_dir)/; $(live-server)

.PHONY: test
test: test\:format test\:lint build

.PHONY: test\:format
test\:format:; $(deno) fmt --check --config='$(deno_config)'

.PHONY: test\:lint
test\:lint:; $(deno) lint --config='$(deno_config)' $(if $(value v),,--quiet)

# Generate a TrueType font.
# $1 font
define ttf_template =
$$(dist_dir)/$(1).ttf: $$(dist_dir)/$(1).sfd | $$(dist_dir)/
  fontforge -quiet -c "
  font = fontforge.open('$$<')
  font.generate('$$@', flags=('opentype', 'winkern', 'old-kern'))
  " 2> /dev/null
endef
$(foreach font,$(fonts),$(eval $(call ttf_template,$(font))))
$(foreach font,$(fonts),$(eval $(call ttf_template,$(font)-aseprite)))

$(dist_dir)/%.ttfdump: $(dist_dir)/%.ttf | $(dist_dir)/
  ttfdump -o '$@' '$<'

# to-do: consolidate with Aseprite template below.
# Generate a FontForge font from the SVGs.
# $1 font
define sfd_template =
$$(dist_dir)/$(1).sfd: $$(call get_char_files,$(1),svg) package.json | $$(dist_dir)/
  bin/fontforge-import \
    '$$@' \
    '$$(src_dir)/$(1).json' \
    False \
    $$(call get_char_files,$(1),svg) 2> /dev/null

  # Strip the creation and modification times for repeatable builds.
  sed -ri 's%(Creation|Modification)Time: [0-9]+%\1Time: 0%' '$$@'
endef
$(foreach font,$(fonts),$(eval $(call sfd_template,$(font))))

# $1 font
define sfd_aseprite_template =
$$(dist_dir)/$(1)-aseprite.sfd: $$(call get_char_files,$(1),svg) package.json | $$(dist_dir)/
  bin/fontforge-import \
    '$$@' \
    '$$(src_dir)/$(1).json' \
    True \
    $$(call get_char_files,$(1),svg) 2> /dev/null
  sed -ri 's%(Creation|Modification)Time: [0-9]+%\1Time: 0%' '$$@'
endef
$(foreach font,$(fonts),$(eval $(call sfd_aseprite_template,$(font))))

# Copy the font metadata JSON files directly into the dist folder without
# alteration.
$(dist_dir)/%.json: $(src_dir)/%.json | $(dist_dir)/
  $(cp) '$<' '$@'

# Render a 1x spritesheet PNG and its Aseprite metadata JSON. Use an implicit
# rule to allow multiple outputs.
#
# - The sheets are for game use.
# - Sheet characters are in ASCII order and missing characters are represented.
# - Characters are each padded by 1 pixel.
$(sheet_dir)/%-sheet.png $(sheet_dir)/%-sheet.json&: $(src_dir)/%.aseprite | $(sheet_dir)/
  $(aseprite) \
    --list-tags \
    --inner-padding 1 \
    --sheet-pack \
    --sheet-type rows \
    --sheet '$(sheet_dir)/$*-sheet.png' \
    --data '$(sheet_dir)/$*-sheet.json' \
    --sheet-columns 16 \
    --sheet-rows 16 \
    '$<'

# Render a 10x spritesheet PNG and its Aseprite metadata JSON.
#
# - The sheets are 10x for the readme.
# - Sheet characters are in ASCII order and missing characters are represented.
# - All padding is 10x to match the rendering scale.
$(sheet_dir)/%-10x-sheet.png $(sheet_dir)/%-10x-sheet.json&: $(src_dir)/%.aseprite | $(sheet_dir)/
  $(aseprite) \
    --list-tags \
    --inner-padding 10 \
    --sheet-pack \
    --sheet-type rows \
    --sheet '$(sheet_dir)/$*-10x-sheet.png' \
    --data '$(sheet_dir)/$*-10x-sheet.json' \
    --sheet-columns 16 \
    --sheet-rows 16 \
    '$<' \
    --scale 10

# Convert each bmp to an SVG.
$(char_dir)/%.svg: $(char_dir)/%.bmp | $(char_dir)/
  potrace --svg --alphamax=0 --opttolerance=0 --output='$@' '$<'

# Render a 10x bmp for every character.
#
# - The characters are 10x for accurate tracing.
# - All padding is 10x to match the rendering scale.
# - Empty character frames are not output as this causes potrace to print a
#   warning. aseprite10x_sheet and aseprite10x_chars could be combined
#   otherwise.
# - The bmps use the index 0 background color (without transparency) so that
#   should be white for potrace.
#
# This is regrettably tricky. Given a font of mem-mono-4x4:
# - Output files from Aseprite by tag like
#   dist/char/mem-mono-4x4-MemMono4x4-3a-10x.bmp.
# - Glob for dist/char/mem-mono-4x4-*-10x.bmp.
# - Replace the tag prefix dist/char/mem-mono-4x4-MemMono4x4- with
#   dist/char/mem-mono-4x4.
# $1 font (eg, mem-prop-5x6)
define 10x_bmp_char_template =
$$(call get_char_files,$(1),bmp)&: $$(src_dir)/$(1).aseprite | $$(char_dir)/
  $$(aseprite) \
    --filename-format '$$(char_dir)/$(1)-{tag}-10x.bmp' \
    --inner-padding 10 \
    '$$<' \
    --scale 10 \
    --save-as /dev/null
  for file in $$(char_dir)/$(1)-*-10x.bmp; do
    $(mv) "$$$$file" "$$(char_dir)/$(1)$$$${file#$$(char_dir)/$(1)-Mem???????}"
  done
endef
$(foreach font,$(fonts),$(eval $(call 10x_bmp_char_template,$(font))))

$(dist_dir)/ $(char_dir)/:; $(mkdir) '$@'

.PHONY: clean
clean:; $(rm) '$(dist_dir)/'
