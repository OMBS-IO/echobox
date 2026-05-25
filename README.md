<p align="center">
  <img src="assets/echobox-logo.svg" alt="Echobox" width="320" />
</p>

<p align="center">
  <em>Your music. Nothing added, nothing lost.</em>
</p>

<p align="center">
  <a href="https://ombs.io"><img src="https://img.shields.io/badge/Platform-Android-3ddc84?logo=android&logoColor=white" alt="Platform: Android" /></a>
  <a href="https://ombs.io"><img src="https://img.shields.io/badge/Audio-Up_to_384kHz_/_DSD256-4F6EF7" alt="Audio: Up to 384kHz / DSD256" /></a>
  <a href="https://ombs.io"><img src="https://img.shields.io/badge/Status-Alpha-yellow" alt="Status: Alpha" /></a>
  <a href="https://ombs.io"><img src="https://img.shields.io/badge/Website-ombs.io-blue" alt="Website" /></a>
</p>

---

**Echobox** is an audiophile-grade music player — currently in alpha on Android, with Windows, macOS, iOS, and CarPlay on the roadmap. It delivers bit-perfect playback through USB DACs, supports hi-res formats up to 384kHz FLAC and DSD256, and features a professional 9-stage DSP chain. With multi-room coordination, audio quality analysis, room correction, and library intelligence, Echobox brings studio-grade listening to your devices.

> **Status:** Echobox is currently in **alpha**. [Sign up for early access](https://ombs.io) to be notified when the beta launches.

---

## Highlights

- **Bit-Perfect Playback** — Direct USB DAC output with zero processing when you want pure signal
- **Hi-Res Audio** — Native support for 384kHz/32-bit FLAC, DSD64/128/256 (DSF & DFF)
- **9-Stage DSP Chain** — ReplayGain, parametric EQ, crossfeed, graphic EQ, limiter, dither, and more
- **Convolution Engine** — Load impulse responses for headphone correction or room correction
- **Multi-Room Sync** — Coordinate playback across SoundTouch, Chromecast, and UPnP/DLNA devices
- **Audio Quality Analysis** — LUFS metering, true peak detection, dynamic range, fake hi-res detection
- **Library Intelligence** — Compare releases, detect upsampled files, smart quality collections
- **Customizable Home Page** — Reorder, hide, or pin sections; per-section list/compact variants and "Feeling Lucky" surface
- **Folder Artwork Sources** — Reads cover.jpg, folder.jpg, and Cover Front.jpg sidecars in addition to embedded artwork, with a configurable priority order
- **Duplicate Detection** — Multi-strategy duplicate finder with quality-based recommendations and safe trash-based resolution
- **Fast Library Scanning** — Parallel metadata extraction for 2-5x faster imports on large libraries
- **Room Correction** — Built-in measurement wizard with automatic PEQ correction
- **DIY Room Treatment Designer** — Predict-based optimizer with 5-step wizard, 3D room viewer, and FIR export to the convolution engine. Complements the measurement-based room correction
- **Signal Path Diagnostics** — Real-time inspection of every stage from source to output
- **No Analytics, No Ads, No Account** — Zero in-app analytics, no advertising, no account required for the free tier. Optional opt-in crash reporting (off by default) is the only telemetry path and is fully under your control
- **Gapless / Crossfade Toggle** — Choose between sample-accurate gapless or smooth crossfade transitions
- **Output Dithering** — Professional TPDF dither for bit-depth conversion
- **24-bit Integer Output** — Capability-probed S24 output path for compatible DACs and Android backends, with automatic fallback to f32 when unsupported
- **Live Spectrum Analyzer** — Real-time 64-bin FFT visualization of your audio output
- **AutoEQ Database** — Browse ~6,000 headphone EQ presets and apply in one tap
- **PEQ Visual Editor** — Interactive frequency response chart for parametric EQ
- **Internet Radio** — 40,000+ stations via Radio-Browser API
- **Synced Lyrics** — Embedded, sidecar .lrc, and online lyrics with auto-scroll
- **Karaoke Lyrics View** — Fullscreen synced-lyrics view with word-by-word highlighting, dominant-color theming, and deep-link support
- **Bulk Lyrics Scanner** — Mass-download synced lyrics from LRCLIB across your entire library, with `.lrc` sidecar files for portability
- **Smart Playlists** — Rule-based dynamic playlists with 22 filter fields and M3U/PLS import
- **Subsonic/Navidrome** — Stream from self-hosted music servers with offline cache
- **Scrobbling** — Track listening history via Last.fm and ListenBrainz
- **Playback Profiles** — Named DSP profiles (Auto, Bit-Perfect, Audiophile, Immersive, Compatibility) with route-class auto-switching
- **HRTF Spatialization** — Binaural rendering with early reflections and venue simulation presets
- **Surround Virtualization** — Virtual 5.1/7.1 surround from stereo sources with three speaker layouts and content-aware presets

---

## DSP Chain

Nine processing stages running in the realtime engine, plus a dedicated convolution engine:

```
Input → ReplayGain → Preamp → Parametric EQ → Crossfeed → Volume → Graphic EQ → Limiter → Dither → Output
                                                                              ↑
                                                                    Convolution Engine
```

| Stage | Description |
|-------|-------------|
| **ReplayGain** | Track/album loudness normalization with clipping prevention |
| **Preamp** | Adjustable gain with automatic headroom management |
| **Parametric EQ** | Up to 20 fully configurable filter bands |
| **Crossfeed** | Bauer-style headphone crossfeed with inter-aural time delay and head-shadow filtering (3 presets) |
| **Volume** | User volume with optional perceptual curve for natural loudness feel |
| **Graphic EQ** | 10-band octave-spaced equalizer |
| **Limiter** | Lookahead limiter with zero-overshoot guarantee (64-frame predictive detection) |
| **Dither** | TPDF output dithering for 16/20/24-bit output devices |
| **Convolution** | Impulse response processing for headphone and room correction |

Glitch-free parameter changes — no clicks, no pops, no interruptions.

---

## Format Support

| Format | Max Sample Rate | Max Bit Depth | Gapless | Notes |
|--------|----------------|---------------|---------|-------|
| **FLAC** | 384 kHz | 32-bit | Yes | Lossless reference format |
| **DSD** (DSF/DFF) | DSD256 (11.2 MHz) | 1-bit | Yes | High-quality DSD → PCM conversion |
| **ALAC** | 192 kHz | 32-bit | Yes | Apple Lossless in MP4 |
| **WAV** | 384 kHz | 32-bit | Yes | Uncompressed PCM |
| **AIFF** | 192 kHz | 32-bit | Yes | Apple/Mac standard |
| **OGG Vorbis** | 48 kHz | — | Yes | Open lossy format |
| **Opus** | 48 kHz | — | Yes | Modern efficient codec |
| **AAC** | 48 kHz | — | Yes | In MP4 container |
| **MP3** | 48 kHz | — | Yes | Universal compatibility |
| **WavPack** | — | Lossless | Yes | WavPack lossless via libwavpack |
| **APE** | — | Lossless | Yes | Monkey's Audio (all compression levels) |

All formats are decoded and optimized for high-fidelity stereo output.

---

## Multi-Room & Streaming

Echobox coordinates playback across multiple output types simultaneously:

- **Bose SoundTouch** — Native zone grouping with hardware-level sync (~5ms). Cloud-free LAN control via WebSocket
- **Google Chromecast** — Media loading and transport control via Cast protocol
- **UPnP/DLNA** — Universal renderer support with capability detection and smart transcoding
- **Phone Speaker / Wired / Bluetooth** — Full DSP chain on local output
- **USB DAC** — Native sample rate negotiation, optional bit-perfect bypass
- **Output Groups** — Mix any combination of the above into a synchronized group

**Sync engine** features:
- Automatic drift detection and correction across all device types
- Per-device latency profiles that improve over time

**Internet Radio** — 40,000+ stations via Radio-Browser API with HTTP and HLS stream support.

---

## Audio Quality Analysis

Echobox decodes and analyzes your entire library to surface mastering quality:

- **LUFS** — Industry-standard integrated loudness measurement
- **True Peak** — Inter-sample true peak detection
- **Dynamic Range** — Per-track and per-album DR measurement
- **Clipping Detection** — Identifies hard clipping artifacts
- **Spectral Bandwidth** — FFT-based frequency content analysis
- **Hi-Res Confidence** — Detects likely upsampled files vs. genuine hi-res content

### Release Comparison

Own multiple versions of the same album? Echobox groups them automatically and compares across 6 dimensions:

- Dynamic range, loudness, clipping, peak headroom, hi-res plausibility, consistency
- Color-coded recommendations (better / worse / similar)
- Confidence classes: Strong, Moderate, Weak, Inconclusive

### Smart Collections

Query-backed browsing that surfaces quality insights:

- **Suspicious Hi-Res** — Likely upsampled tracks
- **High Clipping Risk** — Heavily clipped albums
- **Most Dynamic** — Best-mastered releases
- **Inconsistent Albums** — Track-level quality variation

---

## Room Correction

Built-in measurement and correction system:

1. **Measure** — Built-in test signal generation and mic capture (1, 3, or 5 positions)
2. **Analyze** — Frequency response visualization with room mode detection
3. **Correct** — Automatic multi-band PEQ correction with before/after chart
4. **Compare** — A/B toggle for instant corrected vs uncorrected comparison during playback
5. **Targets** — Flat, Harman Room, HouseCurve, or custom target curves
6. **Optional IR** — Higher-resolution correction via the convolution engine

---

## Add-on Ecosystem

Echobox uses a modular add-on system — enable only what you need:

| Add-on | Capabilities |
|--------|-------------|
| **Audiophile** | Parametric EQ with visual editor, crossfeed, convolution, headphone profiles, AutoEQ database (~6,000 models), audio analysis, room correction with A/B comparison and multi-point measurement, output dithering, perceptual volume curve, live spectrum analyzer, HRTF spatialization, surround virtualization, artwork backfill |
| **SoundTouch** | Bose speaker control, zone grouping, preset management, TuneIn integration |
| **Audiobooks** | Chapter tracking, bookmarks, per-book speed persistence, variable speed playback |
| **Ideas Recorder** | Voice memos and audio recording (feeds room correction measurements) |
| **Gallery** | Surface image attachments (cover.jpg, folder.jpg, embedded artwork, sidecar images) with role-filter chips, fullscreen viewer, Save-to-Photos, and per-album drill-in |
| **Lyrics** | Synced lyrics display from embedded tags, sidecar .lrc files, and LRCLib online, plus library-wide bulk scanner and fullscreen karaoke view with word-by-word highlighting |
| **Room Designer** | Predict-based DIY room treatment optimizer with 5-step wizard, 3D viewer, generic absorber/diffuser catalog (vendor-neutral), and min-phase FIR export to the convolution engine |
| **Smart Playlists** | Rule-based dynamic playlists (22 fields, 11 operators) with M3U/PLS import |
| **Subsonic** | Browse, stream, and cache music from Subsonic/Navidrome servers |
| **Scrobbling** | Last.fm and ListenBrainz listening history with offline queue |
| **Library Analytics** | Collection-wide quality metrics, format distributions, metadata health, duplicate detection |

---

## Signal Path Diagnostics

Real-time transparency into exactly what Echobox is doing to your audio:

- Source metadata (codec, sample rate, bit depth)
- Active DSP stages with per-stage gain values
- Output device, route class, and format
- Transcode decisions with reasoning
- Headroom calculation and limiter engagement risk
- Bit-perfect status with disqualification reasons
- Group sync health (per-member drift, corrections applied)
- Renderer capability profiles (advertised + learned)
- Runtime Governor card (background-work throttling state under thermal, battery, and lifecycle constraints)
- Live spectrum analyzer (64-bin real-time FFT)

---

## Adaptive Route Policy

Echobox automatically optimizes DSP and quality settings based on your output device:

| Route | DSP Mode | Bit-Perfect | Notes |
|-------|----------|-------------|-------|
| Phone Speaker / Wired | Full DSP | Available | All processing active |
| Bluetooth | Full DSP | Disabled | Lossy codec makes bit-perfect meaningless |
| USB DAC | Full DSP or Bypass | Available | User choice: quality processing or pure signal |
| SoundTouch / Cast / UPnP | Renderer-only | N/A | Device handles playback; smart transcoding decisions |

Every decision is explained with machine-readable reason codes and human-readable text in the signal path view.

---

## How Echobox Compares

| Feature | Echobox | Poweramp | UAPP | Neutron |
|---------|:-------:|:--------:|:----:|:-------:|
| **DSD Playback** | DSD256 | DSD128 | Native DSD | DSD128 |
| **Parametric EQ** | 20 bands | No | Plugin | 20 bands |
| **Room Correction** | Built-in | No | No | No |
| **Multi-Room** | Yes | No | No | No |
| **Audio Analysis** | Full suite | No | No | Spectrum only |
| **Fake Hi-Res Detection** | Yes | No | No | No |
| **Synced Lyrics** | Yes | Plugin | No | No |
| **Subsonic/Navidrome** | Yes | No | No | No |
| **Scrobbling** | Last.fm + LB | No | No | No |
| **HRTF Spatialization** | Yes | No | No | No |
| **Surround Virtualization** | Yes | No | No | Yes |

Echobox sits across three categories of audio products. See the detailed comparisons for each:

- [Android player comparison](docs/comparison.md) — vs. Poweramp, UAPP, Neutron
- [Hardware streamer & platform comparison](docs/comparison-hardware.md) — vs. Roon, Eversolo, WiiM
- [Streaming service comparison](docs/comparison-streaming.md) — vs. Spotify, Apple Music, Qobuz, TIDAL

Also: [Detailed format support](docs/format-support.md) | [Why Echobox?](docs/why-echobox.md)

---

## Platform & Roadmap

**Current status:** Android alpha (sign up at [ombs.io](https://ombs.io) to trial)

**Platform release order:**

1. Android — currently in alpha trial
2. Windows desktop — functional, in QA
3. macOS desktop — in development
4. iOS — in development
5. CarPlay — pending Apple approval

Echobox is being built by [One Man Band Studios](https://ombs.io).

For the full roadmap, see **[ombs.io/roadmap](https://ombs.io/roadmap)**.

---

## Get Echobox

<p align="center">
  <a href="https://ombs.io"><strong>Sign up for early access at ombs.io</strong></a>
</p>

Echobox is currently in alpha. Join the waitlist to be among the first to experience audiophile-grade playback on Android.

---

## Community

We'd love to hear from you — whether it's a bug report, feature idea, or just to say hello. If you find Echobox interesting, consider giving this repo a star — it helps others discover the project.

| Channel | Link |
|---------|------|
| **Issues** | [Report bugs & request features](https://github.com/OMBS-IO/echobox/issues) |
| **Discussions** | [Ask questions & share setups](https://github.com/OMBS-IO/echobox/discussions) |
| **Reddit** | [r/echobox](https://reddit.com/r/echobox) |
| **X / Twitter** | [@ombs_io](https://x.com/ombs_io) |
| **YouTube** | [@ombs_io](https://youtube.com/@ombs_io) |
| **Instagram** | [@ombs_io](https://instagram.com/ombs_io) |

---

## FAQ

<details>
<summary><strong>Is Echobox open source?</strong></summary>

No. Echobox is proprietary software developed by One Man Band Studios. This GitHub repository exists for **community interaction** — bug reports, feature requests, discussions, and the public roadmap. The source code is not available in this repo.
</details>

<details>
<summary><strong>What audio formats are supported?</strong></summary>

FLAC (up to 384kHz/32-bit), DSD64/128/256 (DSF & DFF), ALAC, WAV, AIFF, AAC, OGG Vorbis, Opus, MP3, WavPack, and APE (Monkey's Audio). All formats are decoded to 32-bit float with automatic sample rate conversion when needed.
</details>

<details>
<summary><strong>Will it work with my USB DAC?</strong></summary>

Echobox supports USB audio class devices on Android. It negotiates native sample rates with your DAC and can operate in bit-perfect mode (bypassing all DSP) for a pure signal path. Most USB DACs that work with Android should be compatible.
</details>

<details>
<summary><strong>How is Echobox different from Poweramp, UAPP, or Neutron?</strong></summary>

Echobox is built around a purpose-built, zero-allocation realtime audio engine with a lock-free signal path — designed for uncompromising fidelity. On top of that, it adds full audio quality analysis with fake hi-res detection, multi-room coordination across mixed device types, a built-in room correction wizard, and release comparison intelligence.
</details>

<details>
<summary><strong>When will iOS or desktop be available?</strong></summary>

Echobox is being built Android-first. The current alpha trial runs on Android only. Windows desktop is next (functional, currently in QA), followed by macOS, then iOS. CarPlay support is pending Apple approval. Check the [roadmap](https://ombs.io/roadmap) for live status.
</details>

<details>
<summary><strong>Does Echobox collect any data?</strong></summary>

No in-app analytics and no advertising. Optional opt-in crash reporting via Sentry can be enabled in Settings → Diagnostics — it's off by default and you control whether to turn it on. Your music stays on your device. Network features (SoundTouch, UPnP, Chromecast, internet radio) operate over your local network only.
</details>

---

## License

Echobox is proprietary software. Copyright &copy; 2025-2026 [One Man Band Studios](https://ombs.io). All rights reserved.

This repository is used for issue tracking, community discussion, and public documentation. It does not contain the Echobox source code.

---

<p align="center">
  <sub>Built with obsessive attention to audio fidelity by <a href="https://ombs.io">One Man Band Studios</a></sub>
</p>
