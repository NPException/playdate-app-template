This is a small template/example project to build games
for the [Playdate](https://play.date) console with [Fennel](https://fennel-lang.org/)


## Requirements

The build uses [babashka](https://babashka.org/) ( `bb` in snippets here),
and requires the Fennel binary to be available in the shell/commandline
(since compile task calls out to `fennel`).  
Additionally you need the [PlaydateSDK](https://play.date/dev/) and its installation path set
in the `PLAYDATE_SDK_PATH` environment variable.


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


### Build config

Near the top of the `bb.edn` file is a config map, that is used to determine where the different
parts of the build process get their input and where they write their output. Here's a description
of each config key:

| Key                 | Description                                                                                                                                                                                                                                                                        |
|---------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `:sources`          | The directory where all your code and asset files are expected to be.                                                                                                                                                                                                              |
| `:fennel-macros`    | A path relative to the `:sources` directory where Fennel macro modules are kept.<br/>These are only used by Fennel during compilation, and will not be compiled themselves.                                                                                                        |
| `:compiled-sources` | The directory where the combination of compiled `.fnl` files and copies of<br/>all other files in the `:sources` directory will be put by the `compile` task.<br/>It is also the directory that is used as input for the Playdate compiler.                                        |
| `:main-file`        | A path relative from `:compiled-sources` to the Lua file with which the Playdate compiler<br/>will start compilation. This is usually the file which defines the `playdate.update()` function.<br/>(If your main Fennel file is `game.fnl`, then put `game.lua` as the main file.) |
| `:build-output`     | The directory where the PDX app built by the Playdate compiler will be put.<br/>                                                                                                                                                                                                   |


### Babashka tasks

The `build-and-sim` task is just a convenient predefined combination
of the tasks `build` and `start-sim`.

Other available tasks are:

| Task              | Description                                                                                                        |
|-------------------|--------------------------------------------------------------------------------------------------------------------|
| `clean-compiled`  | Deletes the directory generated via the `compile` task.                                                            |
| `compile`         | Compiles all Fennel files using `fennel` and copies<br/>all other files to the `:compiled-sources` directory.      |
| `clean`           | Removes the PDX build output directory                                                                             |
| `create-pdx`      | Builds all files in the `:compiled-sources` directory into a Playdate PDX app.                                     |
| `build`           | Compiles Fennel and builds everything into a Playdate PDX app.<br/>(i.e. calls `compile` and `create-pdx`)         |
| `copy-pdx-to-sim` | Copies the PDX app to the Playdate simulator's games directory,<br/>so it can be selected in the simulator's menu. |
| `start-sim`       | Starts the Playdate simulator with the PDX app in the build output directory                                       |
| `build-and-sim`   | Calls the `build` task and then starts the Playdate simulator.                                                     |
| `build-copy-sim`  | Calls the `build` and `copy-pdx-to-sim` tasks, then starts the Playdate Simulator.                                 |


You can get the list of all available tasks and what they do by running:

```bash
bb tasks
```
