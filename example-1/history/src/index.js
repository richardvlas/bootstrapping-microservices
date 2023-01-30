const express = require("express");

//
// Setup event handlers.
//
function setupHandlers(app) {
    // ... THIS IS A STUB MICROSERVICE: SETUP YOUR HTTP ROUTES HERE ...
}

//
// Start the HTTP server.
//
function startHttpServer() {
    return new Promise(resolve => { // Wrap in a promise so we can be notified when the server has started.
        const app = express();
        setupHandlers(app);
        
        const port = process.env.PORT && parseInt(process.env.PORT) || 3000;
        app.listen(port, () => {
            resolve(); // HTTP server is listening, resolve the promise.
        });
    });
}

//
// Application entry point.
//
function main() {
    console.log("Hello world!");
    
    return startHttpServer();
}

main()
    .then(() => console.log("Microservice online."))
    .catch(err => {
        console.error("Microservice failed to start.");
        console.error(err && err.stack || err);
    });

// Promises are a great way to handle asynchronous operations in JavaScript. 
// They are a standard feature of the language, and are supported by all modern 
// browsers and Node.js.
// So I can run other code while the HTTP server is starting up, and I can 
// handle errors in a single place after and only after the promise has been
// resolved that is after the HTTP server has started (or failed to start).
console.log('Starting other tasks while the server is starting...');