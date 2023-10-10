This is a small template/example project to build games for the [Playdate](https://play.date) console
with the [Fennel programming language](https://fennel-lang.org/), but it can be used to build
pure Lua Playdate projects too.

## Requirements

* [babashka](https://babashka.org/) ( `bb` in snippets here) is used to execute build tasks.
* The [PlaydateSDK](https://play.date/dev/) must be installed/downloaded and its path set in the `PLAYDATE_SDK_PATH` environment variable.
* If there are `.fnl` files in the project, the `fennel` binary is expected to be available on your `PATH` to compile them.

## Building

To run a full build and start the Playdate Simulator,
just run the `build-and-sim` Babashka task by executing:

```bash
bb build-and-sim
```

This will compile all Fennel `.fnl` files in the `src` directory to Lua, and copy the compiled Lua
files as well as any other files in the `src` directory into a `compiled-src` directory.
Then the Playdate compiler `pdc` will be called with the compiled sources as its input,
and creates the PDX app which is ready to be used in the Simulator. (Or to be zipped up for
sideloading on a real Playdate device.)  
If there are no `.fnl` files to compile, the copy step is skipped, and the Playdate compiler
will be called with the `src` directory as its input.

### Build config

Near the top of the `bb.edn` file is a config map, that is used to determine where the different
parts of the build process get their input and where they write their output. Here's a description
of each config key:

| Key                 | Description                                                                                                                                                                                                                                                                                                        |
|---------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `:sources`          | The directory where all your code and asset files are expected to be.                                                                                                                                                                                                                                              |
| `:fennel-macros`    | A path relative to the `:sources` directory where Fennel macro modules are kept.<br/>These are only used by Fennel during compilation, and will not be compiled themselves.<br/>Non-`.fnl` files will still be picked up by the Playdate compiler if present.                                                      |
| `:compiled-sources` | The directory where the combination of compiled `.fnl` files and copies of<br/>all other files in the `:sources` directory will be put by the `compile` task.<br/>It is also the directory that is used as input for the Playdate compiler.<br/>If there are no `.fnl` files to compile, this directory is unused. |
| `:main-file`        | A relative path to the Lua file with which the Playdate compiler<br/>will start compilation. This is usually the file which defines the `playdate.update()` function.<br/>(If your main Fennel file is `game.fnl`, then put `game.lua` as the main file.)                                                          |
| `:build-output`     | The directory where the PDX app built by the Playdate compiler will be put.<br/>                                                                                                                                                                                                                                   |

## Babashka tasks

The `build-and-sim` task is just a convenient predefined combination
of the tasks `build` and `start-sim`.

Other available tasks are:

| Task              | Description                                                                                                                                                                            |
|-------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `bump-build-nr`   | Increments the `buildNumber` in the pdxinfo file.                                                                                                                                      |
| `clean-compiled`  | Deletes the directory generated via the `compile` task.                                                                                                                                |
| `compile`         | Compiles all Fennel files using `fennel` and copies<br/>all other files to the `:compiled-sources` directory.<br/>Does nothing if there are no `.fnl` files in the project.            |
| `clean`           | Removes the PDX build output directory                                                                                                                                                 |
| `create-pdx`      | Builds all files in the `:compiled-sources` directory into a Playdate PDX app.                                                                                                         |
| `build`           | Increments the `buildNumber` in pdxinfo, compiles Fennel (if necessary)<br/>and builds everything into a Playdate PDX app.<br/>(i.e. calls `bump-build-nr` `compile` and `create-pdx`) |
| `copy-pdx-to-sim` | Copies the PDX app to the Playdate simulator's games directory,<br/>so it can be selected in the simulator's menu.                                                                     |
| `start-sim`       | Starts the Playdate simulator with the PDX app in the build output directory                                                                                                           |
| `build-and-sim`   | Calls the `build` task and then starts the Playdate simulator.                                                                                                                         |
| `build-copy-sim`  | Calls the `build` and `copy-pdx-to-sim` tasks, then starts the Playdate Simulator.                                                                                                     |

You can get the list of all available tasks and what they do by running:

```bash
bb tasks
```

## Questions?

If you have any questions feel free to contact me:

* Discord: [.npexception (formerly NPException#2597)](https://discordapp.com/users/107443773834797056)
* Twitter: [@NPException](https://twitter.com/NPException)