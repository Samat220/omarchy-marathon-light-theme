# omarchy-marathon-light-theme

An Omarchy light theme inspired by Bungie's **Marathon (2026)** — the branded marketing aesthetic (Runner posters, marathonthegame.com) rendered as a system theme.

Warm cream paper, Runner signal magenta as primary accent, near-black ink. The sibling of [`omarchy-marathon-theme`](https://github.com/samatramazan/omarchy-marathon-theme) (the dark in-game variant).

> Looking for the dark variant? → [**omarchy-marathon-theme**](https://github.com/samatramazan/omarchy-marathon-theme)
> Acid yellow-green on void black — the in-game Marathon look.

## Palette

| Role | Hex | Description |
|------|-----|-------------|
| Accent | `#EA027E` | Runner signal magenta — **primary** in light mode |
| Background | `#EFEAD8` | Warm cream / printed paper |
| Foreground | `#0D1017` | Near-black ink |
| Green (secondary) | `#6B9000` | Darkened acid — secondary success signal |
| Violet | `#2A01C8` | Darkened corporate violet |
| Cyan | `#008B8B` | Darkened scan readout |
| Orange | `#D14400` | Burnt orange warning |

Full ANSI palette in [`colors.toml`](./colors.toml).

> **Note:** Magenta `#EA027E` is identical in both Marathon themes — it's the brand-defining color, shared by dark and light.

## Install

```bash
omarchy theme install https://github.com/samatramazan/omarchy-marathon-light-theme.git
omarchy theme set marathon-light
```

Applying this theme automatically sets GNOME to `prefer-light` and switches to the Adwaita GTK theme (via the included `light.mode` marker).

## Using with Claude Code & other TUI apps

This is a **light** terminal theme. Apps that ship their own light/dark UI theme (independent of the terminal) must be switched to light/auto, or their text will render in near-white and disappear on the light background.

**Claude Code:** run `/theme` and pick **Auto (match terminal)** — it then follows whichever Marathon theme is active (dark UI on `marathon`, light UI on `marathon-light`). If you skip this, diffs and secondary text show up "white on white." This is not a defect in the terminal palette — it's the app drawing its own colors.

Same applies to any TUI with an internal theme (lazygit, btop's own theme, bat/delta, etc.) — set them to a light variant when running this theme.

## Font (recommended)

Omarchy treats the system monospace font as a global setting, not theme-scoped — installing this theme does **not** change your font. Run the helper script once after applying the theme to get a Marathon-feeling mono:

```bash
~/.config/omarchy/themes/marathon-light/apply-marathon-font.sh
```

The helper walks a preference list and applies the first font you have installed:

1. **PP Fraktion Mono** — the authentic Marathon mono. Pangram Pangram offers a [free personal-use tier](https://pangrampangram.com/products/fraktion-mono) with the same Regular/Bold/Italic weights. You install it yourself; it's never bundled with this theme.
2. **Fraktion Mono** — commercial version of the same font, in case fc-list names it differently.
3. **Departure Mono** — [free, SIL OFL](https://departuremono.com), strongest free-license vibe match.
4. **JetBrains Mono / Commit Mono / Iosevka** — free fallbacks, widely installed.

### Why fonts aren't bundled

Both PP Fraktion's free-personal-use EULA and the commercial Marathon fonts (Shapiro, KH Interference, Ivy Presto) explicitly prohibit redistribution — even for free / open-source projects. "Personal use" in font licensing means *you* installed it on *your* machine; it doesn't mean *this repo* can ship it for anyone to download. So this theme detects what you've already installed; it never carries font files itself.

Marathon also uses **Shapiro** (display), **KH Interference**, and **Ivy Presto Display** in its UI. These are commercial display fonts; Omarchy has no system slot for a display font, so they aren't applied by this theme — listed here for brand context only.

## Why a light Marathon theme?

Bungie's Marathon (2026) has two visual moods:

1. **In-game / void** — acid yellow-green on void black. Captured by the [dark theme](https://github.com/samatramazan/omarchy-marathon-theme).
2. **Branded marketing** — cream paper, magenta-on-cream typographic statements, Swiss-grid editorial layouts. The Runner faction posters and marathonthegame.com site. Captured by **this theme**.

The two themes aren't a light/dark version of the same palette — they're two sides of the same brand. Magenta `#EA027E` is the only color identical in both.

## Art direction

- **Joseph Cross** (Art Director): "Graphic Realism" — simplified design language, strong graphic statements, limited materials.
- **Brian Vinton** (Senior Art Director): "Graphic Retro Futurism" — retro roots, oddball cool, modern tech, digital dithering, lattice structures.
- **Influences:** WipEout, Ghost in the Shell, Alberto Mielgo / Into the Spider-Verse, Swiss/German graphic design, Formula 1 livery design.

## What's included

| File | Purpose |
|------|---------|
| `colors.toml` | Terminal palette |
| `light.mode` | Marker — triggers GNOME `prefer-light` + Adwaita GTK |
| `btop.theme` | btop2 system monitor colors |
| `neovim.lua` | LazyVim spec: tokyonight-day base + Marathon Light palette overrides |
| `vscode.json` | Recommends Bearded Theme Vivid Light as closest match |
| `hyprland.conf` | Magenta active window borders |
| `chromium.theme` | Browser frame color |
| `icons.theme` | `Yaru-magenta` GTK icon variant |
| `keyboard.rgb` | `ea027e` for openrgb keyboard backlight |
| `backgrounds/` | 5 original wallpapers (Runner-poster aesthetic) |
| `unlock.png` | Plymouth boot banner (800×188) |
| `preview-unlock.png` | Lock screen preview shown in theme picker |
| `apply-marathon-font.sh` | Opt-in helper to apply a Marathon-feeling mono font |

## Credits

- Design and palette: inspired by Bungie's *Marathon (2026)*. Fan tribute, not affiliated with or endorsed by Bungie.
- Theme structure follows the [Omarchy](https://github.com/basecamp/omarchy) convention.

## License

MIT for the theme files. Wallpapers are original generated artwork — free to use, modify, and redistribute.
