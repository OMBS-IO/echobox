# Changelog

All notable changes to Echobox will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/).

---

## [Unreleased]

### Current Alpha Features
- Purpose-built realtime audio engine with zero-allocation, lock-free signal path
- Full format support: FLAC (384kHz/32-bit), DSD64/128/256, ALAC, WAV, AIFF, AAC, OGG Vorbis, Opus, MP3, WavPack, APE
- 9-stage DSP chain: ReplayGain, Preamp, Parametric EQ (20 bands, visual editor), Crossfeed (Bauer with ITD), Volume (perceptual curve option), Graphic EQ (10 bands), Limiter (lookahead), Dither (TPDF)
- Convolution engine for headphone and room correction
- Bit-perfect USB DAC playback with native sample rate negotiation
- Multi-room coordination: SoundTouch zones, Chromecast, UPnP/DLNA
- Output groups with drift monitoring and sync correction
- Audio quality analysis: LUFS, True Peak, Dynamic Range, Clipping, Spectral, Hi-Res Confidence
- Release comparison across 6 quality dimensions
- Smart collections (Suspicious Hi-Res, High Clipping Risk, Most Dynamic, Inconsistent Albums)
- Room correction with measurement wizard (log sweep, PEQ fitting, target curves)
- Signal path diagnostics with full transparency
- Adaptive route policy engine
- Internet radio (40,000+ stations via Radio-Browser)
- Android Auto integration
- Add-on ecosystem: Audiophile, SoundTouch, Audiobooks, Ideas Recorder, Gallery, Lyrics, Room Designer, Smart Playlists, Subsonic, Scrobbling, Library Analytics
- Variable speed playback for audiobooks
- Renderer intelligence with learned device profiles
- Gapless playback across all formats
- Artwork backfill (iTunes, MusicBrainz)
- TPDF output dithering (16/20/24-bit target)
- Perceptual volume curve (cubic)
- Lookahead limiter with zero-overshoot guarantee
- True Bauer crossfeed with inter-aural time delay and head-shadow filtering
- Live spectrum analyzer (64-bin real-time FFT)
- AutoEQ headphone database (~3000 models, one-click import)
- PEQ visual editor with frequency response chart
- Room correction A/B comparison toggle
- Multi-point room measurement (1/3/5 positions with power-domain averaging)
- DR14-compatible per-channel dynamic range measurement
- Bit-perfect convolution bypass and exclusive mode sample rate lock
- Gapless/Crossfade selectable track transitions
- Synced lyrics display (embedded tags, sidecar .lrc, LRCLib online API)
- Smart playlists with rule engine (17 filter fields, 11 operators, 6 presets) and M3U/PLS import
- Subsonic/Navidrome streaming client with offline cache and download
- Scrobbling to Last.fm and ListenBrainz with offline queue
- Playback profiles (Auto, Bit-Perfect, Audiophile, Immersive, Compatibility) with route-class auto-switching
- HRTF binaural spatialization with early reflections and venue simulation (4 presets)
- DSP category architecture (Technical/Experiential/AlwaysActive with independent bypass)
- Intent-aware playback engine with per-device profile binding
- Surround virtualization: virtual 5.1/7.1/Cinema surround from stereo sources (3 layouts, 3 upmix presets: Music/Movie/Gaming)
- Library analytics: collection-wide quality metrics, format distributions, metadata health, duplicate detection
- Multi-strategy duplicate detection (exact content hash, metadata fuzzy matching) with quality-based keep recommendations and safe trash-based resolution
- Custom in-app folder browser for Android (unrestricted directory selection, replaces SAF picker limitations)
- Parallel metadata extraction for 2-5x faster library scanning on multi-core devices
- Unified volume routing: hardware keys, lock-screen, notification widget, and in-app sliders all control the active output endpoint (local, SoundTouch, UPnP, Cast, or output group) with bidirectional sync
- Shared-mixer visibility on Platform Audio: see count and usage breakdown of other apps actively mixing audio
- One-tap diagnostic bundle: structured device/state/log report for GitHub issue submission
- Bulk lyrics scanner: mass-download synced lyrics from LRCLIB with `.lrc` sidecar files; parallel, cancellable, and resumable across app restarts
- Spotify-style fullscreen lyrics view with word-by-word karaoke highlighting, dominant-color theming, and deep-link routing
- DIY Room Treatment Designer add-on: predict-based room optimizer with 5-step wizard, 3D viewer, vendor-neutral catalog, and min-phase FIR export to the convolution engine
- 24-bit integer audio output with capability probe and f32 fallback on incompatible devices
- Gallery add-on: surfaces image attachments (covers, sidecar images, embedded artwork) with role-filter chips, fullscreen viewer, Save-to-Photos, and per-album drill-in
- Customizable home page: reorder, show/hide, and pin sections; per-section list/compact variants and "Feeling Lucky" surface
- Folder sidecar artwork: reads cover.jpg, folder.jpg, and Cover Front.jpg with configurable priority order alongside embedded artwork
- Procedural placeholder artwork: deterministic CD-style fallback rendered when no embedded or sidecar artwork is available
- Adaptive thermal / battery / lifecycle governor: throttles background work (analysis, watch-folder scanning, artwork backfill) when the device gets hot, battery is low, or the app is backgrounded, with a Runtime Governor card in Signal Path and a Settings toggle
- Smart-playlist DJ metadata: six new fields (BPM, key, energy, danceability, mood, dual-source rating) usable as smart-playlist rules and visible in track details
- Classical-music metadata: typed columns for composer, conductor, soloist, ensemble, performer credits, work/movement, and catalog number lifted from tags rather than overflowed into key-value storage
- Library scaling: huge-library hardening for 100k+ track libraries (deferred analysis policy, mid-scan resume, OOM-resistant scan service); streaming discovery and deferred artwork extraction for faster cold scans
- Opt-in crash reporting: Sentry-based crash and error telemetry, off by default with a toggle in Settings → Diagnostics; PII scrubbing and URL-credential redaction when enabled
- No in-app analytics, no advertising, no account required for the free tier

---

For the full roadmap, see [ombs.io/roadmap](https://ombs.io/roadmap).
