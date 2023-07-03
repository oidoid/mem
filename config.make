# Debug with `V=1 make --jobs=1`.

# Report unitialized variable usage. Pass as a CLI flag to catch everything; see
# https://savannah.gnu.org/bugs/?9060.
MAKEFLAGS += --warn-undefined-variables

# Only use the rules and variables supplied.
MAKEFLAGS += --no-builtin-rules --no-builtin-variables

# Parallelize by default. Everything should have correct dependencies. This also
# allows multiple watch tasks to execute in parallel without `xargs -P`.
MAKEFLAGS += --jobs

# Use spaces instead of tabs for recipes.
empty :=
space := $(empty) $(empty)
.RECIPEPREFIX := $(space)

# Execute each recipe in one shell and fail on first error and undefined
# variable usage within the recipe.
.ONESHELL:
.SHELLFLAGS := -euc

# Don't echo recipes.
ifndef V
.SILENT:
endif

# If a recipe fails, delete the target.
.DELETE_ON_ERROR:

# Preserve intermediate targets.
# This breaks shell autocomplete. See
# https://github.com/scop/bash-completion/issues/215.
.SECONDARY:

# to-do: move outside of ooz.
aseprite := aseprite --batch

# Preserve all and overwrite.
cp := cp --archive --force

# Only report warnings and errors.
# https://github.com/denoland/deno/issues/10558
# https://github.com/denoland/deno/issues/15828
# https://github.com/denoland/deno/issues/8890
deno := deno $(if $(value V),,--quiet)

# https://github.com/denoland/deno/issues/16395.
deno_config ?= deno.json

# Overwrite destination.
ln := ln --force

# Create directory hierarchies.
mkdir := mkdir --parents

# Overwrite destination.
mv := mv --force

# Delete hierarchy if present.
rm := rm --force --recursive

# to-do: find Deno alternative.
# https://github.com/denoland/deno/issues/16321
# esbuild doesn't support a Deno config (Deno-ism) or import maps (requires
# package management) and didn't seem to live reload.
# https://esbuild.github.io/api/#live-reload
# esbuild_watch := deno run --allow-all https://deno.land/x/esbuild@v0.17.0/mod.js --watch
# tail -f /dev/null | $(esbuild_watch) --servedir='$(dist_dir)'
live-server := npx live-server --no-browser

# Silence sub-makes.
make = $(MAKE) $(if $(value V),,--quiet)
