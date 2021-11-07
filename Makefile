# Copyright 2021, Stephen Fryatt (info@stevefryatt.org.uk)
#
# This file is part of the StrongHelp Manuals:
#
#   https://github.com/riscos-dot-info/stronghelp-manuals

# This file really needs to be run by GNUMake. It is intended for use on
# Linux, to assemble the manuals using the BindHelp utility.
#
# Ensure that the build tools all point to valid executables, in
# particular @(BINDHELP) and @(ZIP). The latter must be aware of
# RISC OS filetypes and recognise ,xxx filename extensions -- such as
# the version supplied in the GCCSDK cross compiler environment.

# The manual collections included in the build.
# These should match the list of submodules pulled into the repo.

COLLECTIONS :=	reference-inetsocket	\
		reference-inetswis	\
		reference-miscswis	\
		reference-os		\
		reference-vdu		\
		reference-wimp		\
		sh-refman		\
		sh-style		\
		toolbox

# Set up the various build directories.

SRCDIR := src
BUILDDIR := build
OUTDIR := out

# Build Tools

ECHO := echo
PRINTF := printf
MKDIR := mkdir -p
CD := cd
RM := rm -f

# Set up escape sequences for colouring terminal output.

COLOUR_ACTION := \033[1;34m
COLOUR_END := \033[0m

# Provide a means of reporting progress.

show-stage = $(PRINTF) "$(COLOUR_ACTION)*%18s: %s$(COLOUR_END)\n" "$(1)" "$(2)"

# Inform the user what we're about to do.

$(info *** Building StrongHelp Manuals ***)

# Build the manuals.

COLLECTIONFOLDERS := $(addprefix $(SRCDIR)/, $(COLLECTIONS))

.PHONY: clean release collections $(COLLECTIONFOLDERS)

release: collections

collections: $(COLLECTIONFOLDERS)

$(COLLECTIONFOLDERS):
	@$(call show-stage,COLLECTION,$(@))
	@$(MAKE) -C $(@) $(MAKECMDGOALS)

# Clean targets

clean::
	@$(call show-stage,CLEANING,$(BUILDDIR))
	@$(RM) $(BUILDDIR)/*
	@$(call show-stage,CLEANING,$(OUTDIR))
	@$(RM) $(OUTDIR)/*
