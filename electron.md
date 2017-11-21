#   notes on the electron framework

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

* what are the [implications and responsibilities of using electron](https://electronjs.org/docs/tutorial/security)?
    * electron javascript isn't safe in a sandbox
        * your js can be used to touch the file system and wreck havoc
    * reporting security issues
        * [info on properly disclosing an electron vulnerability](https://github.com/electron/electron/blob/master/SECURITY.md)
        * chromium security issues and upgrades
            * electron will often lag behind the latest version of chromium by either days or weeks
    * node integration
        * a security issue exists whenever you receive code from a remote destination and execute it locally
            * if an attacker somehow manages to change the content they will be able to execute native code on the user's machine
        * under no circumstance should you load and execute remote code with node integration enabled
            * use only local files packaged together with your application to execute node code
            * to display remote content use the `webview` tag and make sure to diable the `nodeIntegration`
        * checklist
            * only display secure (https) content
            * diable node integration in all renderers that display remote content 
                * setting `nodeIntegration` to `false` in `webPreferences`
            * enable context isolation in all renderers that display remote content
                * setting `contextIsolation` to `true`in `webPreferences`
            * use `ses.setPermissionRequestHandler()` in all sessions that load remote content
            * do not disable `webSecurity`
                * disabling will disable same-origin policy
            * define a `Content-Security-policy` and use restrictive rules i.e. `script-src 'self'`
            * override and disable `eval` which allows strings to be executed as code
            * do not set `allowRunningInsecureContent` to `true`
            * do not enable `experimentalFeatures` or `experimentalCanvasFeatures` unless you know what you're doing
            * do not use `blinkFeatures` unless you know what you're doing
            * WebViews
                * do not add the `nodeIntegration` attribute
                * do not use `disablewebsecurity`
                * do not use `allowpopups`
                * do not use `insertCSS` or `executeJavaScript` with remote CSS/JS
                * verify the options and params of all `<webview>` tags before they get attached using the `will-attach-webview` event
                
* what are [electron basics](https://electronjs.org/docs/tutorial/quick-start)?
    * main process
        * the process that runs `package.json`'s `main` script
        * can display a GUI by creating web pages
    * renderer process
        * electron uses chromium for displaying web pages 
        * chromiums multi-process architecture is also used
            * each web page in electron runs in its own process
            * this is called the renderer process
    * difference between main process and renderer process
        * main process
            * creates web pages by creating `BrowserWindow` instances
                * `BrowserWindow` instance runs the web page in its own renderer process
                    * when a `BrowserWindow` instance is destroyed the corresponding renderer process is also terminated
            * manages all web pages and their corresponding renderer processes 
                * each renderer process is isolated and only cares about the web page running it
        * in web pages
            * calling native GUI related APIs is not allowed
                * managing native GUI resources in web pages is very dangerous and it is easy to leak resources
            * to perform GUI operations in a web page the renderer process of the web page must communicate with the main process to request that the main process perform those operations
    * several ways to communicate between main process and renderer processes
        * ipcRenderer module
            * send synchronous and asynchronous messages from the render process to the main process
            * receive replies from the main process
            * instance of the EventEmitter class
        * ipcMain module
            * handles asynchronous and synchronous messages sent from a renderer process
            * messages sent from a renderer will be emitted to this module
        * remote module
            * a simple way to do inter-process communication between the renderer process and the main process
            * you can invoke methods of the main process object without explicitly sending inter-process messages 








      

    









