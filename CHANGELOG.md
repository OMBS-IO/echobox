# Changelog

All notable changes to Echobox will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/).

---

## [Unreleased]

### Current Alpha Features
- Tri-stack audio engine (Flutter + Rust + Zig)
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
- Add-on ecosystem: Audiophile, SoundTouch, Audiobooks, Ideas Recorder, Lyrics, Smart Playlists, Subsonic, Scrobbling, Library Analytics
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
- Library analytics: collection-wide quality metrics, format distributions, metadata health, duplicate detection
- Zero telemetry, zero cloud dependency

---

For the full roadmap, see [ombs.io/roadmap](https://ombs.io/roadmap).
