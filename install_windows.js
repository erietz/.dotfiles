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

function spawnAsync(cmd, argv) {
    console.log("Running", cmd, argv);
    const cp = child_process.spawn(cmd, argv)

    cp.stdout.on("data", (data) => {
        console.log(cmd, "stdout:", data.toString());
    });

    cp.stderr.on("data", (data) => {
        console.error(cmd, "stderr:", data.toString());
    })
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
    spawnAsync(NPM, argv);
}

function nuget_install(packages) {
    const argv = ["tool", "install", "--global"];
    argv.push(packages)
    spawnAsync("dotnet", argv);
}

main();
