StrongHelp Manuals
==================

This project contains the source files for StrongHelp manuals [hosted on riscos.info](http://www.riscos.info/downloads/stronghelp/manuals/).

The source files can be assembled in a Linux environment using the BindHelp tool from [OSLib](https://ro-oslib.sourceforge.io/) and the Zip tool from the GCCSDK.


Conventions
-----------

The source files are stored within the `src/` folder, in sub-folders which match the names of the completed StrongHelp manuals.

Filenames contain the same characters as used in the finished manual, except that `/` in a RISC OS filename is mapped to `.`. Filetypes should always be explicitly included on the ends of filenames using the conventional `,xxx` extension format -- for example `!Root,fff` or `!Root,ffd`. The names of directories appear in exactly the same format as the finished manual, and have no trailing filetype specifier.

The contents of files should be exactly as they will appear on RISC OS: no Unicode characters, RISC OS (or Linux) line endings, and so on. No translation is carried out on the files' contents, so *take care when editing files on non-RISC OS platforms* to ensure that encodings remain as Latin-1.


Building on Linux
-----------------

To build the manuals in a Linux environment, ensure that the Makefile is configured correctly.

The Build Tools variables need to point to suitable executables on the host platform; in particular `@(BINDHELP)` and `@(ZIP)`. The former should point to a copy of BindHelp which is aware of the `-r`, `-f` and `-m` option flags. The latter should point to a version of Zip which is aware of RISC OS filetypes and recognises ,xxx filename extensions, such as the version supplied in the GCCSDK cross compiler environment.

The `@(MANUALS)` variable should contain a list of the names of the manuals in the `src/` folder, using the same format and capitalisation as the source folders themselves.

To build the manuals, use

	make manuals

which will result in StrongHelp files corresponding to the folders from `src/` being generated in `build/`. To build and package the manuals for release, use

	make release

and Zip archives will also be assembled within `out/` -- again, one for each manual.

To tidy up the environment,

	make clean

will delete the contents of the `build/` and `out/` folders.


Contact
-------

Initial work on this project was carried out by Steve Fryatt -- info@stevefryatt.org.uk