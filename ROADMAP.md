# Echobox Roadmap

The canonical roadmap lives at **[ombs.io/roadmap](https://ombs.io/roadmap)**.

This page provides a condensed view. For the most up-to-date information, check the website.

---

## Current Status

Echobox is built cross-platform from a single core. The public **alpha** is rolling out Android-first; Windows and Linux have working desktop builds and join the rollout as desktop UI polish completes, while iOS and macOS are in final bring-up. Sign up at [ombs.io](https://ombs.io) for early access on your platform.

## What's Built

- Purpose-built realtime audio engine with zero-allocation, lock-free signal path
- Full format support (FLAC, DSD, ALAC, WAV, AIFF, AAC, OGG, Opus, MP3, WavPack, APE)
- 9-stage DSP chain with parametric EQ, crossfeed, convolution, limiter, dither, and more
- Bit-perfect USB DAC playback
- Multi-room coordination (SoundTouch, Chromecast, UPnP/DLNA)
- Audio quality analysis (LUFS, true peak, dynamic range, fake hi-res detection)
- Release comparison and library intelligence
- Room correction with measurement wizard
- Signal path diagnostics
- HRTF binaural spatialization with early reflections and venue simulation
- Surround virtualization (virtual 5.1/7.1/Cinema from stereo via multi-speaker HRTF)
- Playback profiles with route-class auto-switching
- Synced lyrics (embedded, sidecar .lrc, LRCLib online)
- Smart playlists with rule-based filtering and M3U/PLS import
- Subsonic/Navidrome streaming client with offline cache
- Scrobbling to Last.fm and ListenBrainz
- Internet radio (40,000+ stations)
- Android Auto support
- Duplicate detection with quality-based recommendations and safe resolution
- Custom folder browser for Android (unrestricted directory selection)
- Parallel library scanning (2-5x faster imports)
- Unified volume routing across all output endpoints (local, SoundTouch, UPnP, Cast, groups)
- Shared-mixer visibility on Platform Audio page
- One-tap diagnostic bundle for GitHub issue reporting
- Bulk lyrics scanner with LRCLIB integration
- Spotify-style fullscreen karaoke lyrics view with word-by-word highlighting
- DIY Room Treatment Designer add-on (predict-based optimizer, 3D viewer, FIR export)
- Gallery add-on (image attachment surfacing, fullscreen viewer, Save-to-Photos)
- Customizable home page (reorder, hide, pin sections; list/compact variants)
- Folder sidecar artwork sources (cover.jpg / folder.jpg / Cover Front.jpg) with configurable priority
- Procedural placeholder artwork (deterministic CD-style fallback)
- 24-bit integer audio output with capability probe and f32 fallback
- Adaptive thermal / battery / lifecycle resource governor with Settings toggle
- DJ + smart-playlist metadata (BPM, key, energy, danceability, mood, dual-source rating)
- Classical-music metadata (composer, conductor, soloist, ensemble, work/movement, catalog number)
- Huge-library hardening (100k+ tracks: deferred analysis, mid-scan resume, OOM-resistant scanning)
- Opt-in crash reporting via Sentry (off by default; toggle in Settings → Diagnostics)
- Beam cross-device transfer (LAN discovery, PIN pairing, encrypted transfer, duplicate-aware, history with undo)
- Web Access (browser-based library manager and player with PIN login, trusted HTTPS, 6-digit connect code, upload)
- Restore Last Session (full-queue resume on relaunch, paused at saved position)
- Open with Echobox (OS file associations for instant playback without library import)
- Android homescreen widgets (three sizes, Material You theming)
- Alternate app icons (six launcher styles, Android)
- OS media-session integration (MPRIS on Linux, Windows taskbar + System Media Transport Controls, Android media-session hardening)
- Files add-on (browse booklets, cue sheets, and scans alongside your music)
- Add-on ecosystem (Audiophile, SoundTouch, Audiobooks, Ideas Recorder, Gallery, Files, Lyrics, Room Designer, Smart Playlists, Subsonic, Scrobbling, Library Analytics)

## Tracking Progress

- [GitHub Issues](https://github.com/OMBS-IO/echobox/issues) — Bug reports and feature requests
- [GitHub Discussions](https://github.com/OMBS-IO/echobox/discussions) — Community feature ideas and Q&A
- [GitHub Milestones](https://github.com/OMBS-IO/echobox/milestones) — Progress toward upcoming releases

---

For the full roadmap with timelines, visit **[ombs.io/roadmap](https://ombs.io/roadmap)**.
