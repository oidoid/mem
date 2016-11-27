#!/bin/sh
exec make -f- --warn-undefined-variables "$@" << 'eof'

src_dir := src
out_dir := out
png_dir := $(out_dir)/png
svg_dir := $(out_dir)/svg

src_file := $(src_dir)/mem.xcf
out_file := $(subst $(src_dir),$(out_dir),$(src_file:%.xcf=%.sfd))

cols := 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15
rows := $(cols)
tbl := $(foreach row,$(rows),$(foreach col,$(cols),$(row)_$(col)))
png_files := $(tbl:%=$(png_dir)/_%.png)
svg_files := $(tbl:%=$(svg_dir)/_%.svg)

define export_pngs_scheme :=
  (let* (
      (image (car (gimp-image-list)))
      (drawable (car (gimp-image-get-active-drawable image)))
      (scale 10)
    )

    ; potrace doesn't trace tiny inputs well
    (gimp-context-set-interpolation INTERPOLATION-NONE)
    (gimp-image-scale
      image
      (* (car (gimp-image-width image)) scale)
      (* (car (gimp-image-height image)) scale))

    (python-fu-slice RUN-NONINTERACTIVE image 0 \"$(png_dir)\" \"index.htm\" \"\" \"png\" 0 \"\" 0 0 0)

    (gimp-quit TRUE)
  )
endef

.ONESHELL:
.SECONDARY:
.PHONY: all
all: $(out_file)

$(out_file): $(svg_files)
	touch '$@'

$(svg_dir)/%.svg: $(png_dir)/%.png | $(svg_dir)
	convert -flatten '$<' bmp:-|potrace -sa 0 -O 0 -o '$@'

$(subst .png,%png,$(png_files)): $(src_file) | $(out_dir)
	gimp -idfb "$(export_pngs_scheme)" '$<'

$(out_dir) $(svg_dir):; mkdir -p '$@'

.PHONY: clean
clean:; rm -rf $(out_dir)