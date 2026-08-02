---
name: dalamud-plugin-build
description: Build, package, and prepare Dalamud plugins for this repository's API13-compatible distribution flow.
---

# Dalamud plugin build workflow

Use this skill when you need to build a Dalamud plugin from source, package it for distribution, or verify that a release asset is suitable for this repository.

## When to use this skill
- The task involves compiling a plugin DLL from a source repository.
- You need to package a plugin into a ZIP for release or testing.
- You need to verify that a plugin is compatible with the Taiwan/API13 distribution flow used by this repository.

## Prerequisites
- Install .NET SDK (the current SamplePlugin template expects a .NET SDK that can build the solution; the template used in the upstream docs targets .NET 8-compatible tooling).
- Install or update XIVLauncher, FINAL FANTASY XIV, and Dalamud, then launch the game once with Dalamud enabled so the Dev Plugin environment exists.
- On Windows, use a Windows-targeted build environment; many plugin projects target `netX.0-windows`.
- If the repo uses a custom Dalamud dev path, make sure the `DALAMUD_HOME` environment variable points to the correct directory.

## Typical project layout
- A solution file such as `*.sln`.
- A plugin project file such as `*.csproj`.
- A plugin manifest such as `*.json` next to the compiled DLL.
- Optional data assets, images, or config files copied to the output directory.

## Build commands
The most common commands are:

```powershell
dotnet build MyPlugin.sln -c Release
dotnet build MyPlugin/MyPlugin.csproj -c Release
```

If the project is a template-based plugin, the build output is usually under a folder like:
- `bin/x64/Debug/`
- `bin/x64/Release/`

The compiled plugin DLL is typically named after the project and should be paired with a manifest JSON file.

## Packaging for release
A release-ready plugin package should include at least:
- `YourPlugin.dll`
- `YourPlugin.json` (or the manifest filename used by the plugin)
- Any required data files or runtime assets copied by the build

For this repository, package the artifacts into a ZIP file and place it under `plugins/` before publishing a release. The repository also includes a helper script to package plugin directories into ZIPs:

```powershell
pwsh -File .\scripts\package-plugins.ps1
```

## Repository-specific notes
- This repository is a distribution manifest repository, not the upstream plugin source repository.
- The main manifest is `repo.json`, which points to release assets and to the upstream or fork repository via `RepoUrl`.
- The distribution in this repo targets Dalamud API13 for Taiwan-compatible builds.
- The release metadata in this repository expects API13 manifest values and release asset URLs that match the published package versions.
- The GitHub release workflow validates `repo.json` and uploads local `plugins/*.zip` assets. See `.github/RELEASE_PROCESS.md` for the end-to-end flow.

## Validation checklist
- The solution or project builds successfully.
- The DLL and manifest JSON are emitted to the output directory.
- The manifest contains the expected metadata (author, name, description, applicable version, tags, etc.).
- The packaged ZIP contains the DLL and manifest and any required assets.
- The package version and release URLs in `repo.json` match the built artifact.
