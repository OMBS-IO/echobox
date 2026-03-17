#!/usr/bin/env bash
# One-time setup script for GitHub repo settings, labels, and milestones.
# Requires: gh CLI authenticated with access to OMBS-IO/echobox
#
# Usage: bash scripts/setup-github.sh

set -euo pipefail

REPO="OMBS-IO/echobox"

echo "==> Setting repo description and homepage..."
gh repo edit "$REPO" \
  --description "Audiophile-grade Android music player — bit-perfect USB DAC, hi-res audio (384kHz FLAC, DSD256), 9-stage DSP chain, multi-room sync, audio quality analysis. Flutter + Rust + Zig." \
  --homepage "https://ombs.io"

echo "==> Setting repo topics..."
echo '{"names":["music-player","android-music-player","audiophile","audio-player","hi-res-audio","hifi","dsp","flutter","rust","zig","usb-dac","equalizer","flac","dsd","multi-room-audio","android","bit-perfect","replaygain","dlna","chromecast"]}' \
  | gh api -X PUT "repos/$REPO/topics" --input -

echo "==> Deleting default labels..."
for label in "bug" "documentation" "duplicate" "enhancement" "good first issue" "help wanted" "invalid" "question" "wontfix"; do
  gh label delete "$label" --repo "$REPO" --yes 2>/dev/null || true
done

echo "==> Creating label taxonomy..."

# Type labels
gh label create "bug"             --repo "$REPO" --color "d73a4a" --description "Something isn't working"
gh label create "enhancement"     --repo "$REPO" --color "a2eeef" --description "New feature or improvement"
gh label create "audio-quality"   --repo "$REPO" --color "e4e669" --description "Audio artifacts, distortion, quality issues"
gh label create "feedback"        --repo "$REPO" --color "c5def5" --description "General feedback or question"
gh label create "documentation"   --repo "$REPO" --color "0075ca" --description "Documentation improvements"

# Status labels
gh label create "needs-triage"    --repo "$REPO" --color "fbca04" --description "Awaiting initial review"
gh label create "confirmed"       --repo "$REPO" --color "0e8a16" --description "Verified and accepted"
gh label create "in-progress"     --repo "$REPO" --color "1d76db" --description "Currently being worked on"
gh label create "planned"         --repo "$REPO" --color "bfd4f2" --description "Scheduled for a future release"
gh label create "wontfix"         --repo "$REPO" --color "ffffff" --description "Will not be addressed"
gh label create "duplicate"       --repo "$REPO" --color "cfd3d7" --description "Duplicate of another issue"
gh label create "needs-info"      --repo "$REPO" --color "d876e3" --description "More information needed from reporter"
gh label create "stale"           --repo "$REPO" --color "ededed" --description "Inactive issue pending closure"

# Area labels
gh label create "area/playback"   --repo "$REPO" --color "0e8a16" --description "Playback engine & audio pipeline"
gh label create "area/dsp"        --repo "$REPO" --color "1b7c30" --description "DSP chain, EQ, effects"
gh label create "area/library"    --repo "$REPO" --color "28a745" --description "Library management & metadata"
gh label create "area/ui"         --repo "$REPO" --color "34d058" --description "User interface & experience"
gh label create "area/multiroom"  --repo "$REPO" --color "85e89d" --description "Multi-room, Chromecast, DLNA"
gh label create "area/analysis"   --repo "$REPO" --color "69d025" --description "Audio quality analysis"
gh label create "area/auto"       --repo "$REPO" --color "2cbe4e" --description "Android Auto"
gh label create "area/addons"     --repo "$REPO" --color "a3d977" --description "Add-on ecosystem"
gh label create "area/radio"      --repo "$REPO" --color "b8e986" --description "Internet radio"
gh label create "area/usb-dac"    --repo "$REPO" --color "44cc11" --description "USB DAC & bit-perfect"
gh label create "area/formats"    --repo "$REPO" --color "77dd77" --description "Format support & decoding"

# Priority labels
gh label create "priority/critical" --repo "$REPO" --color "b60205" --description "Crash, data loss, or security issue"
gh label create "priority/high"     --repo "$REPO" --color "d93f0b" --description "Major functionality broken"
gh label create "priority/medium"   --repo "$REPO" --color "fbca04" --description "Important but has workaround"
gh label create "priority/low"      --repo "$REPO" --color "c2e0c6" --description "Nice to have"

# Platform labels
gh label create "platform/android"      --repo "$REPO" --color "3ddc84" --description "Android-specific"
gh label create "platform/android-auto" --repo "$REPO" --color "3ddc84" --description "Android Auto"

# Special labels
gh label create "good first issue" --repo "$REPO" --color "7057ff" --description "Good for newcomers"
gh label create "help wanted"      --repo "$REPO" --color "008672" --description "Community help welcome"

echo "==> Creating milestones..."
gh api -X POST "repos/$REPO/milestones" -f title="Alpha" -f description="Initial alpha release with core features" -f state="open" 2>/dev/null || true
gh api -X POST "repos/$REPO/milestones" -f title="Beta" -f description="Public beta launch" -f state="open" 2>/dev/null || true
gh api -X POST "repos/$REPO/milestones" -f title="v1.0" -f description="First stable release" -f state="open" 2>/dev/null || true

echo "==> Enabling discussions..."
# Note: GitHub Discussions must be enabled via the web UI (Settings > Features > Discussions)
# or via the GraphQL API. The REST API does not support this directly.
echo "    ⚠  Enable Discussions manually: Settings > Features > Discussions"
echo "    Suggested categories: Announcements, Feature Ideas, Q&A, Audio Setup Showcase, Show & Tell"

echo ""
echo "==> Done! Repo settings configured."
echo ""
echo "Remaining manual steps:"
echo "  1. Set Social Preview image: Settings > General > Social Preview (upload assets/icon-512.png or a custom banner)"
echo "  2. Enable Discussions: Settings > Features > Discussions"
echo "  3. Create Discussion categories: Announcements, Feature Ideas, Q&A, Audio Setup Showcase, Show & Tell"
