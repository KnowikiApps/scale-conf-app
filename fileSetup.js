const filePrep = function() {
    console.log("Did this work");
    console.log("Preparing IDBFS");

    // Check if folder exists
    // App will fail to start if we try to make a dir that already exists
    // Qt LocalStorage is by default on the /home/web_user/.local/share/this.program/QML/OfflineStorage
    const dbPath = "/home";
    const result = FS.analyzePath(dbPath);
    if (!result.exists) {
        FS.mkdir(dbPath);
    }

    // At the time of writing Qt 6.7.3 doesn't support a version of wasm with autoPersist
    // Todo consider adding it in the future when available
    FS.mount(FS.filesystems.IDBFS, {}, dbPath);


    // Sync the filesystem. the true paremeter causes this to restore data from browser
    // TODO Handle failures
    FS.syncfs(true, function(err) {
        if (err) {
            console.error("Init syncing failure", err);
        } else {
            console.log("Init sync sucess!");
        }
    });
}


// Prerun contains a list of functions that are to be run before app start up.
if (typeof Module['preRun'] === 'undefined') {
    Module['preRun'] = [filePrep];
} else {
    Module['preRun'].push(filePrep);
}
