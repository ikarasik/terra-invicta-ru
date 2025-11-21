# Repo-specific Copilot Instructions

Purpose: help AI coding agents be immediately productive in this repository (Russian localization for Terra Invicta).

Key facts
- This repository is a collection of localization/template files for Terra Invicta. It contains many `.rus` files (UI and game text) and a JSON template `TILocalizationTemplate.json` used by the game.
- There is no build system, tests, or compilation step in this repo. Changes are validated by placing files into the game install folders (see Testing/Validation below).

Important files and patterns (use these as examples)
- `TILocalizationTemplate.json` — master localization template that the game reads from `StreamingAssets/Templates`.
- `TILocalizationTemplate.rus` — repository-local copy of the template (match fields/IDs with JSON).
- `TI*Template.rus` — many game object templates (e.g., `TIGunTemplate.rus`, `TITechTemplate.rus`). These are per-asset translations and must keep the same identifier keys.
- `UI*.rus` — UI text modules (e.g., `UISpace.rus`, `UIStartScreen.rus`) — these contain dialog/labels for the game's UI.

Conventions & constraints the agent must follow
- Never change identifier keys or IDs. Translators and the game rely on exact identifiers across `.rus` and the JSON template. Keep key names, sections, and ordering intact unless explicitly instructed.
- Preserve placeholder tokens and markup exactly. Do not alter percent/placeholders like `%s`, `{0}`, or any custom tags used by the game UI.
- Do not rename files unless the user asks. The game expects particular filenames (the README shows `.rus` files are copied directly into the game's `Localization/rus` folder).
- Keep file extensions unchanged (`.rus`, `.json`).

Editing guidance and examples
- When adding or updating a localized string, update the corresponding `.rus` file and, if applicable, ensure the key exists in `TILocalizationTemplate.json`.
- Example references:
  - `TILocalizationTemplate.json` — used by the game and must be placed in `StreamingAssets/Templates` to enable the language (see README).
  - `UISpace.rus` / `UIStartScreen.rus` — use these when updating UI labels or screens.

Testing / validation steps (how to see changes in-game)
- Follow the repository README: copy `.rus` files into the game installation `StreamingAssets/Localization/rus/` and the `TILocalizationTemplate.json` into `StreamingAssets/Templates/`.
- For Steam: copy files into `\\Steam\\steamapps\\common\\Terra Invicta\\TerraInvicta_Data\\StreamingAssets\\Localization\\rus\\` (create `rus` folder if missing).
- For GOG: similar path under `\\GOG Games\\Terra Invicta\\TerraInvicta_Data\\StreamingAssets\\Localization\\rus\\` and enable the template in `TILocalizationTemplate.json` by setting `active: true` if needed (README instructions).

Repository-specific pitfalls
- There are many similarly-named `TI*Template.rus` files. When changing language-critical tokens look across all `TI*Template.rus` files to avoid inconsistent translations.
- No CI is present: rely on manual in-game verification described above.

Search and navigation hints for agents
- Look for UI changes in files named `UI*.rus`.
- Look for content/asset templates in files beginning with `TI` (e.g., `TITechTemplate.rus`).
- Use `TILocalizationTemplate.json` as the authoritative list of keys that the game reads.

When to ask the human maintainer
- If a change requires renaming an ID, re-structuring templates, or adding new top-level keys in `TILocalizationTemplate.json`, ask before proceeding.
- If you need to know encoding expectations (UTF-8 vs other encodings) or game-version compatibility, ask—this repo has no scripts that confirm encoding.

If anything here is unclear or you'd like additional examples (token formats, a small PR checklist, or preferred commit message format), ask and I will update this file.
