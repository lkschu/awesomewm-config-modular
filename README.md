# Awesome AwesomeWM RC

Xephyr (and awmtt) can be used to develop and debug awesome wm.

Run a standalone xorg server in a window by running: 

    Xephyr :1 -ac -br -noreset -screen 1920x1080 &

Now by specifying the used display variable programs can be executed inside Xephyr: 

    DISPLAY=:1 awesome -c ~/.config/awesome/rc.lua

----

## TODO

 - taglist must be rewritten so svg stylesheets are applied and per tag font selection is possible
 - systray is on the wrong screen, is possible to fix be restructuring wibar setup but more elegant solution might be possible

----

This is the default **[awesome-git](https://awesomewm.org/apidoc/)** `rc.lua`,
but structured for better customization and modularity. Initially, i did
it for myself, because i needed something to start with, and i decided to
share because i didn't find anything similar. None of the logic was touched,
but everything was reformatted to match the code style that i like.

Please note that this is for **[awesome-git](https://awesomewm.org/apidoc/)**
and will not work with the stable release.

## Structure

The main `rc.lua` file only load the modules it was split into.
Each module can have its own submodules, and they are all loaded from `init.lua`.

module | description
-------- | -----------
`bindings` | mouse and key bindings
`config` | various variables for apps/tags etc...
`modules` | third-party libraries (e.g. [bling](https://github.com/BlingCorp/bling), [lain](https://github.com/lcpz/lain))
`rules` | client rules
`signals` | all signals are connected here
`widgets` | all widgets are defined here


## Credits

[This config](https://git.linuxit.us/spider/awesome/src/commit/921c5019df6a03915e09efcb1336bbca518a4401) was used as a base.

[Modules created in this repo](https://github.com/suconakh/awesome-awesome-rc)
