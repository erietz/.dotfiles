const child_process = require("child_process");

const NPM = "C:\\Program Files\\nodejs\\npm.cmd"

function main() {
    npm_install([
        "typescript",
        "ts-node",
        "typescript-language-server"
    ]);
    npm_install("pyright");
    npm_install("vscode-langservers-extracted");
    nuget_install("csharp-ls");
}

function npm_install(packages) {
    const argv = ["install", "-g"];
    if (packages instanceof Array) {
        for (let arg of packages) {
            argv.push(arg);
        }
    } else {
        argv.push(packages)
    }

    console.log("Running npm ", argv);
    const cp = child_process.spawn(NPM, argv)

    cp.stdout.on("data", (data) => {
        console.log("npm stdout:", data.toString());
    });

    cp.stderr.on("data", (data) => {
        console.error("npm stderr", data.toString());
    })
}

function nuget_install(packages) {
    const argv = ["tool", "install", "--global"];
    argv.push(packages)

    console.log("Running dotnet ", argv);
    const cp = child_process.spawn("dotnet", argv)

    cp.stdout.on("data", (data) => {
        console.log("dotnet stdout:", data.toString());
    });

    cp.stderr.on("data", (data) => {
        console.error("dotnet stderr:", data.toString());
    })
}

main();
