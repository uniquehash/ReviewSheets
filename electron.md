# notes on the electron framework

* what is [electron](https://en.wikipedia.org/wiki/Electron_(software_framework))?
    * allows for the development of desktop GUI applications using front and back end components originally developed for web applications 
    * uses Node.js runtime for the backend and Chromium for the frontend
    * basic structure
        * consists of three files
            * package.json
                * for metadata
                * most important file
                    * keeps information about packages
            * main.js
                * for code
            * index.html
                * for GUI / markup
    * framework is provided by the electron executable file
        * Windows
            * electron.exe
        * macOS
            * electron.app
        * Linux
            * electron
        * to add branding and custom icon 
            * rename and/or edit the Electron executable file
    
* what does [electron say about electron](https://electronjs.org/docs/tutorial/about)?
    * electron does not follow semver
        * always reference a specific version of electron
    * there is no long term support
    * core philosophy
        * in order to keey electron small in terms of file size and sustainable in terms of api surface area the project limits the scope of the core project
            * uses just the rendering library from chromium
        * new features added to electron should primarily be native API's 
            * if a feature can be its own Node.js module it probably should be

* how does [electron handle versioning](https://electronjs.org/docs/tutorial/electron-versioning)?
    * does not follow semver
    * electron versioning
        * major
            * breaking changes in electron API
                * you will have to make changes to your app
        * minor
            * major chrome and minor Node upgrades, or significant electron changes
                * your app "should" still work but may experience difficulties
        * patch
            * new features and bug fixes
                * your app will work

* how to use [native node modules with electron](https://electronjs.org/docs/tutorial/using-native-node-modules)?
    * there are three ways
        * using npm
            * set environment variables to use npm to directly install modules
            * example of installing all dependencies for electron
            ```
                # Electron's version.
                export npm_config_target=1.2.3
                # The architecture of Electron, can be ia32 or x64.
                export npm_config_arch=x64
                export npm_config_target_arch=x64
                # Download headers for Electron.
                export npm_config_disturl=https://atom.io/download/electron
                # Tell node-pre-gyp that we are building for Electron.
                export npm_config_runtime=electron
                # Tell node-pre-gyp to build module from source code.
                export npm_config_build_from_source=true
                # Install all dependencies, and store cache to ~/.electron-gyp.
                HOME=~/.electron-gyp npm install
            ```
        * installing modules and rebuilding for electron
            * install modules like any other node project and then rebuild the modules using the `electron-rebuild` package
            * example
            ```
                npm install --save-dev electron-rebuild

                # Every time you run "npm install", run this:
                ./node_modules/.bin/electron-rebuild

                # On Windows if you have trouble, try:
                .\node_modules\.bin\electron-rebuild.cmd
            ```
        * manually building for electron
            * you can rebuild manually for electron using `node-gyp`
            * example
            ```
                cd /path-to-module/
                HOME=~/.electron-gyp node-gyp rebuild --target=1.2.3 --arch=x64 --dist-url=https://atom.io/download/electron
            ```

* 











