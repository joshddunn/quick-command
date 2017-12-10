# Quick Command (qc)

**Note that this tool is a work in progress.**

qc is a tool to define project-specific aliases of terminal commands.

Currently, qc is only supported using the fish shell, but will be made more general in the future.

## Install

Clone this repository.

    git clone https://github.com/joshddunn/quick-command ~/.local/share/qc

Run the install script.

    fish ~/.local/share/qc/install.fish

Now qc is installed!

## Usage

To use qc, we have to initialize it by typing

    qc cli init

This creates a file in your current directory called `quick-command.json`. It has the form

```json
{
  "command": {
    "test": "echo 'qc has been installed properly and is ready to use.'"
  }
}
```

and will allow the command `qc test` to be run. You can redefine this if you want.

You can setup a file watcher by having 

```json
{
  "watch": {
    "install": {
      "file": "install.sh",
      "action": "echo 'hello'"
    }
  }
}
```

in your `quick-command.json` file. The watcher is run by the command `qc watch a`.

We can also remove the quick commands file by typing

    qc cli destroy

You can see all your defined commands by typing

    qc cli list

You can edit the qc presets file by typing

    qc cli presets

This command will default to the mvim text editor. You can change it by updating your quick-command.json file.

```json
{
  "editor": "mvim"
}
```

You can turn movies into gifs by using the command

    qc cli gif PATH_TO_MOVIE PATH_TO_GIF

or you can do

    qc cli gif PATH_TO_MOVIE

which will assume the gif path is the same as the movie.

### Presets

When you install qc, a file called `quick-command-presets.json` will be install to your `~/.config/fish/functions` directory. Here, you can define presets you may wish to bring into a new initialization of qc. For example, if your `quick-command-presets.json` looks like this

```json
{
  "presets": {
    "dockerrails": {
      "rw": "docker-compose run web",
      "ub": "docker-compose up --build",
      "dbc": "docker-compose run web rake db:create",
      "u": "docker-compose up",
      "d": "docker-compose down",
      "s": "rm tmp/pids/server.pid; docker-compose up"
    },
    "git": {
      "ga": "git add -A",
      "gc": "git commit -m"
    }
  }
}
```

You can bring them into your current project by typing

    qc cli init dockerrails git

Currently, there is no check to see if commands have been reused. So be mindful of that.

## Examples

If your `quick-command.json` file looks like this

```json
{
  "command": {
    "rw": "docker-compose run web",
    "ub": "docker-compose up --build"
  }
}
```

You can run both

    qc rw rake db:create

and 

    qc rw rails test

from the command line with no issues.
