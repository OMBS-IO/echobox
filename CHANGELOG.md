# Changelog

All notable changes to Echobox will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/).

---

## [Unreleased]

### Current Alpha Features
- Tri-stack audio engine (Flutter + Rust + Zig)
- Full format support: FLAC (384kHz/32-bit), DSD64/128/256, ALAC, WAV, AIFF, AAC, OGG Vorbis, Opus, MP3
- 7-stage DSP chain: ReplayGain, Preamp, Parametric EQ (20 bands), Crossfeed, Volume, Graphic EQ (10 bands), Limiter
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
- Add-on ecosystem: Audiophile, SoundTouch, Audiobooks, Ideas Recorder
- Variable speed playback for audiobooks
- Variable speed playback for audiobooks
- Renderer intelligence with learned device profiles
- Gapless playback across all formats (partial for Opus)
- Artwork backfill (iTunes, MusicBrainz)
- Zero telemetry, zero cloud dependency

---

For the full roadmap, see [ombs.io/roadmap](https://ombs.io/roadmap).
