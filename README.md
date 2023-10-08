This is a small template/example project to build games
for the [Playdate](https://play.date) console with [Fennel](https://fennel-lang.org/)

## Requirements

The build uses [babashka](https://babashka.org/) ( `bb` in snippets here),
and requires the Fennel binary to be available in the shell/commandline
(since compile task calls out to `fennel`).  
Additionally you need the [PlaydateSDK](https://play.date/dev/) and its installation path set
in the `PLAYDATE_SDK_PATH` environment variable.

## Building

To compile the Fennel code in `src/fnl` to Lua, run the following command:

```bash
bb compile-fnl
```

To build the Lua files and assets into a PDX package ready for the Playdate:

```bash
bb build-pdx
```