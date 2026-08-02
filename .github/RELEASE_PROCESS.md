# Build and Release Process

This repository is a distribution manifest for Taiwan-compatible Dalamud API13 plugins. It does not contain most plugin source code, so the release workflow is split into two parts:

1. Upstream plugin build and package creation
2. Distribution manifest validation and GitHub release publishing

## 1. Build upstream plugin packages

For each plugin you publish here:

- Clone the upstream or fork repository referenced by `RepoUrl` in `repo.json`.
- Checkout the API13-compatible branch or tag for that plugin.
- Use the upstream project build instructions. Most Dalamud plugins are built with `dotnet build -c Release` and packaged as a `.zip` containing the plugin `.dll` and its `*.json` plugin manifest.
- Verify the plugin is compiled against a Taiwan-compatible Dalamud API13 runtime. The `plugins-api13` release uses yanmucorp Dalamud `13.0.0.6`.
- Name the package file according to the plugin and version, e.g. `Penumbra-1.5.1.26.zip`.

If a plugin repository provides its own packaging action or release artifact, use that artifact instead of rebuilding from scratch, but still verify the package contents.

## 2. Update the distribution repository

- Place locally built or downloaded `.zip` packages under `plugins/` if you want them to be available for release asset upload automation. Use `scripts/package-plugins.ps1` to create or refresh plugin ZIP packages from directories under `plugins/`.
- Update `repo.json` to add or modify plugin entries.
  - Keep the same `repo.json` shape for all entries.
  - Maintain `DalamudApiLevel: 13` and `TestingDalamudApiLevel: 13` for every plugin in this repository.
  - Update `DownloadLinkInstall`, `DownloadLinkTesting`, and `DownloadLinkUpdate` to point to the release asset URL for the tag you publish.
- If you add or change icons, place them in `icons/` and reference them using raw GitHub URLs in `IconUrl`.
- Update `README.md` if the visible plugin list, versions, or compatibility notes change.

## 3. Release workflow

This repository includes GitHub Actions to validate the manifest and publish release assets.

### Validation

- `.github/workflows/validate-distribution.yml` runs on pushes and pull requests that touch `repo.json`, `README.md`, `.github/**`, `icons/**`, or `plugins/**`.
- It checks:
  - `repo.json` is valid JSON
  - each entry contains the required fields
  - every plugin entry targets API13
  - local icon files referenced by raw GitHub URLs exist
  - local `plugins/*.zip` archives are valid ZIP files and include at least one `.dll` and one `.json` manifest file

### Release publishing

- `.github/workflows/release-assets.yml` runs when a GitHub release is created or published.
- It validates the repository and uploads any `.zip` files found under `plugins/` to the release as assets.

## Recommended release steps

1. Build or collect plugin package `.zip` files.
2. Add the packages to `plugins/` and commit them if desired.
3. Update `repo.json` entry versions and download URLs.
4. Create or update the GitHub release tag, ideally `plugins-api13` for the distribution bundle.
5. Publish the release.
6. Confirm the release workflow uploads the assets and the validation workflow passes.

## Notes

- This repo is not a full plugin source workspace. Upstream plugin compilation happens in external repositories.
- Keep the distribution manifest and the release assets in sync. The release automation helps by uploading local `plugins/` archives to the matching GitHub release.
