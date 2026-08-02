# Copilot Instructions

## Repository purpose
This repository is a Taiwan-specific Dalamud plugin distribution manifest and asset collection for FFXIV.
It is not a source code workspace for building plugins. The main runtime artifact is `repo.json`, which defines the Dalamud custom repository entries that the plugin installer consumes.

## Build, test, and lint
- No build, test, or lint scripts are present in this repository.
- There are no visible `dotnet`, `npm`, `make`, or other developer command manifests in the workspace.
- The repository is managed by editing metadata, release assets, icons, and documentation rather than compiling source here.
- The `plugins-api13` release is a prebuilt binary bundle published as GitHub release assets, and it states the builds were verified against yanmucorp Dalamud `13.0.0.6`.

## High-level architecture
- `repo.json`: the central Dalamud repository manifest. Each plugin entry includes metadata such as `Author`, `Name`, `InternalName`, `AssemblyVersion`, `DalamudApiLevel`, `DownloadLinkInstall`, `DownloadLinkTesting`, `DownloadLinkUpdate`, and `IconUrl`.
- `icons/`: icon assets referenced by `repo.json` and served through raw GitHub URLs.
- `plugins/`: packaged plugin artifacts. This repository currently contains a local `PlayerWatchlist.zip` package and the extracted `PlayerWatchlist` package contents.
- `README.md`: user-facing documentation that explains the repository's API13 compatibility, Taiwan client fixes, and plugin compatibility guidance.

## Key conventions
- This repository is distribution-focused. Do not assume it contains plugin source code or build tooling.
- All listed plugins are targeted at Dalamud API level 13 for Taiwan compatibility.
- `repo.json` entries should remain consistent in shape and semantics; the installer expects the standard Dalamud repository manifest fields.
- Plugin metadata often points to upstream/fork source branches via `RepoUrl`, while download links point to GitHub release assets.
- Icons are stored under `icons/` and should be referenced through raw GitHub URLs in `IconUrl`.
- Local plugin packages may coexist in `plugins/`, but the manifest can still reference release assets hosted elsewhere.
- Avoid mixing API14-or-newer binaries with this API13 repository; the README explicitly warns against mixing upstream API14 DLLs with these packages.
- The repository includes GitHub Actions under `.github/workflows` to validate `repo.json` and publish local `plugins/*.zip` assets to a GitHub release.
- A packaging helper script is available at `scripts/package-plugins.ps1` to generate `.zip` archives from directories under `plugins/`.
- The release process is documented in `.github/RELEASE_PROCESS.md`.
- A reusable build/playbook is available at `.github/skills/dalamud-plugin-build/skill.md` for compiling, packaging, and validating Dalamud plugins for this repository.
