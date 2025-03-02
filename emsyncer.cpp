#include "emsyncer.h"
#ifdef Q_OS_WASM
#include <emscripten.h>
#endif



EmSyncer::EmSyncer(QObject *parent) : QObject(parent) {}

void EmSyncer::call_EM_Sync()
{
#ifdef Q_OS_WASM
    EM_ASM(
        FS.syncfs(
            function(err) {
                if(err) {
                    console.log("Something has gone wrong while syncing: " + err);
                } else {
                    console.log("Running FS.syncfs");
                }});
        );

#endif

}
