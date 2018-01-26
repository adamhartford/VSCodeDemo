# VSCodeDemo
Example using VS Code for Mono + XSP development on macOS

## How to use

1. Clone repository
2. Open root folder in VS Code
3. From integrated terminal: `nuget restore`
4. Cmd+Shift+B to build the project
5. Change the VS Code debug configuration to `Start Debugging`
6. After build finishes, press F5
7. Wait for browser to open and launch your application

Now the debugger is attached and will hit breakpoints in your C# code. Razor views will recompile when changed. Try modifying Home/Index.cshtml for example.

## Notes

### launch.js
Use to execute `startServer.sh`

### startServer.sh
1. Stops any XSP server running on port 5001 (the port I happened to choose for this project)
2. Starts XSP server
3. Sleeps for 2 seconds (I've found that this is needed for the debugger to attach reliably, but don't know why)
4. Launches http://127.0.0.1:5001

### launch.json and tasks.json
I'll assume you know a bit about configuring VS Code. I mostly use the `Start Debugging` launch configuration, which requires me to build the project first. There is a `Build & Start Debugging` configuration that will do both with a 10 second delay to wait for the build to finish. Currently, VS Code runs all compound configurations at once. It would be great if there was a way to have `Attach` wait for `Build & Launch` to complete. But, AFAIK the only way to accomplish this now is with a delay.

### Attaching
The vscode-mono-debug attach is finicky. I've generally found that you need to attach right away after starting XSP, and before you make any requests to the server. I've tried to time the tasks so that the attach is reliable, but if I notice the debugger failed to attach, I'll just stop and start again.

Hope this helps. Good luck!
