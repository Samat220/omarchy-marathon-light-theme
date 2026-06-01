#!/usr/bin/env bash
# Marathon theme — opt-in monospace font helper
#
# Omarchy treats the system monospace font as a global setting, not theme-scoped,
# so installing this theme does not change your font. Run this script once after
# installing the theme to apply a Marathon-feeling mono.
#
# The script prefers Marathon's actual fonts if you've installed them yourself
# (PP Fraktion's free-personal-use version, or the commercial Fraktion Mono).
# It falls back to Departure Mono, then to other free monospaces. It never sets
# a font you don't already have installed.
#
# We do NOT ship any of these font files in the theme repo — both PP Fraktion's
# free-personal-use EULA and KH Type's trial EULA forbid redistribution. The
# script just detects what you've already installed yourself.
#
# Download links:
#   PP Fraktion Mono (free personal use): https://pangrampangram.com/products/fraktion-mono
#   Fraktion Mono (commercial):           https://pangrampangram.com/products/fraktion-mono
#   Departure Mono (free, SIL OFL):       https://departuremono.com

set -euo pipefail

# Preferred order — the script picks the first one that's actually installed.
PREFERENCE_ORDER=(
    "PP Fraktion Mono"      # Marathon's actual mono (free personal-use tier)
    "Fraktion Mono"          # Commercial version of the same font, in case the name differs
    "Departure Mono"         # Free, SIL OFL, captures Marathon's retro-future mono vibe
    "JetBrains Mono"         # Free, geometric, widely installed
    "Commit Mono"            # Free, clean geometric
    "Iosevka"                # Free, highly customizable
)

bold()   { printf '\033[1m%s\033[0m\n' "$*"; }
green()  { printf '\033[1;32m%s\033[0m\n' "$*"; }
mag()    { printf '\033[1;35m%s\033[0m\n' "$*"; }
dim()    { printf '\033[2m%s\033[0m\n' "$*"; }

has_font() {
    # Capture first to avoid SIGPIPE on fc-list when grep -q exits early
    # (which would cause pipefail to mark the pipeline as failed).
    local installed
    installed="$(fc-list)"
    grep -iqF -- "$1" <<<"$installed"
}

apply() {
    local name="$1"
    if ! command -v omarchy >/dev/null 2>&1; then
        echo "Error: omarchy command not found in PATH." >&2
        exit 1
    fi
    bold "Applying font: $name"
    omarchy font set "$name"
    green "✓ Done. Open a new terminal / restart apps to see the change."
}

print_install_guidance() {
    bold "Marathon theme — font setup"
    echo
    mag "Recommended order (first match wins):"
    for name in "${PREFERENCE_ORDER[@]}"; do
        if has_font "$name"; then
            green "  ✓ $name  (installed — use this)"
        else
            dim   "  ✗ $name  (not installed)"
        fi
    done
    echo
    bold "Download links:"
    dim "  PP Fraktion Mono (free personal use, the authentic Marathon font):"
    dim "    https://pangrampangram.com/products/fraktion-mono"
    dim "  Departure Mono (free, SIL OFL, strongest free-license vibe match):"
    dim "    https://departuremono.com"
    echo
    bold "After downloading, install with:"
    dim "  unzip <archive>.zip -d /tmp/font"
    dim "  cp /tmp/font/**/*.otf /tmp/font/**/*.ttf ~/.local/share/fonts/"
    dim "  fc-cache -f"
    echo
    bold "Then re-run this script, or apply a specific font directly:"
    for alt in "${PREFERENCE_ORDER[@]}"; do
        printf '  omarchy font set "%s"\n' "$alt"
    done
    echo
    dim "List all installed monospace fonts: omarchy font list"
    dim "Show current font:                  omarchy font current"
}

# If user passed a specific font as an arg, use that
if [[ $# -gt 0 ]]; then
    requested="$*"
    if has_font "$requested"; then
        apply "$requested"
        exit 0
    else
        echo "Font '$requested' is not installed." >&2
        echo "Run: $0     (no args) for install guidance" >&2
        exit 1
    fi
fi

# No args — walk the preference list, apply the first installed match
for name in "${PREFERENCE_ORDER[@]}"; do
    if has_font "$name"; then
        apply "$name"
        exit 0
    fi
done

# Nothing in the preference list is installed — show guidance, exit cleanly
print_install_guidance
exit 0
