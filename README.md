<p align="center">
  <img src="assets/echobox-logo.svg" alt="Echobox" width="80" />
</p>

<h1 align="center">Echobox</h1>

<p align="center">
  <em>Your music. Nothing added, nothing lost.</em>
</p>

<p align="center">
  <a href="https://ombs.io"><img src="https://img.shields.io/badge/Platform-Android-3ddc84?logo=android&logoColor=white" alt="Platform: Android" /></a>
  <a href="https://ombs.io"><img src="https://img.shields.io/badge/Audio-Up_to_384kHz_/_DSD256-4F6EF7" alt="Audio: Up to 384kHz / DSD256" /></a>
  <a href="#architecture"><img src="https://img.shields.io/badge/Architecture-Flutter_+_Rust_+_Zig-orange" alt="Architecture: Flutter + Rust + Zig" /></a>
  <a href="#architecture"><img src="https://img.shields.io/badge/Tests-1,900+-brightgreen" alt="Tests: 1,700+" /></a>
  <a href="https://ombs.io"><img src="https://img.shields.io/badge/Website-ombs.io-blue" alt="Website" /></a>
  <a href="https://discord.gg/XZ3WEFu7"><img src="https://img.shields.io/badge/Discord-Join-5865F2?logo=discord&logoColor=white" alt="Discord" /></a>
</p>

---

**Echobox** is an audiophile-grade Android music player built on a tri-stack architecture: **Flutter** for the UI, **Rust** for the core engine, and **Zig** for the realtime audio path. It delivers bit-perfect playback through USB DACs, supports hi-res formats up to 384kHz FLAC and DSD256, and features a professional 7-stage DSP chain. With multi-room coordination, audio quality analysis, room correction, and library intelligence, Echobox brings studio-grade listening to your pocket.

> **Status:** Echobox is currently in **alpha**. [Sign up for early access](https://ombs.io) to be notified when the beta launches.

---

## Highlights

- **Bit-Perfect Playback** — Direct USB DAC output with zero processing when you want pure signal
- **Hi-Res Audio** — Native support for 384kHz/32-bit FLAC, DSD64/128/256 (DSF & DFF)
- **7-Stage DSP Chain** — ReplayGain, parametric EQ, crossfeed, graphic EQ, limiter, and more
- **Convolution Engine** — Load impulse responses for headphone correction or room correction
- **Multi-Room Sync** — Coordinate playback across SoundTouch, Chromecast, and UPnP/DLNA devices
- **Audio Quality Analysis** — LUFS metering, true peak detection, dynamic range, fake hi-res detection
- **Library Intelligence** — Compare releases, detect upsampled files, smart quality collections
- **Room Correction** — Built-in measurement wizard with automatic PEQ correction
- **Signal Path Diagnostics** — Real-time inspection of every stage from source to output
- **Zero Cloud Dependency** — No telemetry, no analytics, no account required
- **Gapless Playback** — Seamless transitions across all supported formats
- **Internet Radio** — 40,000+ stations via Radio-Browser API

---

## Architecture

Echobox uses a **tri-stack architecture** designed for professional audio quality on mobile:

```
┌─────────────────────────────────────────────┐
│              Flutter (Dart)                  │
│         UI  ·  Navigation  ·  Theming       │
├─────────────────────────────────────────────┤
│               Rust Core                     │
│  Library  ·  Decoding  ·  State Machine     │
│  Analysis  ·  Networking  ·  Convolution    │
├─────────────────────────────────────────────┤
│           Zig Audio Engine                  │
│   Realtime DSP  ·  Zero Allocation          │
│   Platform Audio APIs  ·  Lock-Free I/O     │
└─────────────────────────────────────────────┘
```

**Why this matters:**
- The **Zig audio callback** runs with zero allocations and no locks — it always produces audio, never drops frames
- **Rust** handles the complex orchestration: format decoding (via Symphonia), library management (SQLite), network protocols (SoundTouch, UPnP, Cast), and the convolution engine
- **Flutter** provides a responsive, cross-platform UI that never touches the audio path directly
- Communication between layers uses lock-free ring buffers and atomic operations
- The entire stack is covered by **1,900+ tests** across Zig, Rust, and Flutter

---

## DSP Chain

Seven processing stages running in the Zig realtime engine, plus convolution in the Rust fill thread:

```
Input → ReplayGain → Preamp → Parametric EQ → Crossfeed → Volume → Graphic EQ → Limiter → Output
                                                                              ↑
                                                                    Convolution Engine
                                                                    (Rust fill thread)
```

| Stage | Description |
|-------|-------------|
| **ReplayGain** | Track/album loudness normalization with clipping prevention |
| **Preamp** | User gain control (-12 to +12 dB) with headroom management |
| **Parametric EQ** | 20-band biquad filters — peak, notch, shelves, pass, bandpass, allpass |
| **Crossfeed** | Headphone spatialization (blend + low-pass crossfeed, 3 intensity presets) |
| **Volume** | User volume with precision control |
| **Graphic EQ** | 10-band octave-spaced equalizer |
| **Limiter** | Prevents digital clipping (~0.1ms attack, 50ms release) |
| **Convolution** | FFT-based impulse response processing for headphone/room correction |

All DSP parameters update atomically — no clicks, no pops, no interruptions.

---

## Format Support

| Format | Max Sample Rate | Max Bit Depth | Gapless | Notes |
|--------|----------------|---------------|---------|-------|
| **FLAC** | 384 kHz | 32-bit | Yes | Lossless reference format |
| **DSD** (DSF/DFF) | DSD256 (11.2 MHz) | 1-bit | Yes | Native DSD → PCM via Kaiser FIR |
| **ALAC** | 192 kHz | 32-bit | Yes | Apple Lossless in MP4 |
| **WAV** | 384 kHz | 32-bit | Yes | Uncompressed PCM |
| **AIFF** | 192 kHz | 32-bit | Yes | Apple/Mac standard |
| **OGG Vorbis** | 48 kHz | — | Yes | Open lossy format |
| **Opus** | 48 kHz | — | Partial | Modern efficient codec |
| **AAC** | 48 kHz | — | Yes | In MP4 container |
| **MP3** | 48 kHz | — | Yes | Universal compatibility |

All formats decode to interleaved 32-bit float stereo. Mono is upmixed, multi-channel is downmixed (ITU-R BS.775).

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
- Timeline-anchored coordination with drift monitoring
- Per-device latency profiles (learned over time)
- Automatic correction via seek nudges with anti-flapping
- Transport mode selection: Native (SoundTouch), EB2-Coordinated (mixed network), or LinkedPlayback (Bluetooth)

**Internet Radio** — 40,000+ stations via Radio-Browser API with HTTP and HLS stream support.

---

## Audio Quality Analysis

Echobox decodes and analyzes your entire library to surface mastering quality:

- **LUFS** — Integrated loudness measurement (ITU-R BS.1770, K-weighted, dual-gated)
- **True Peak** — 4x oversampled inter-sample peak detection
- **Dynamic Range** — Block-based DR measurement per track and album
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

1. **Measure** — Generate a log sweep, capture the mic response
2. **Analyze** — Deconvolution, frequency response smoothing, RT60 estimation, room mode detection
3. **Correct** — Greedy iterative PEQ band fitting (up to 18 bands)
4. **Targets** — Flat, Harman Room, HouseCurve, or custom target curves
5. **Optional IR** — Minimum-phase FIR for higher-resolution correction via the convolution engine

---

## Add-on Ecosystem

Echobox uses a modular add-on system — enable only what you need:

| Add-on | Capabilities |
|--------|-------------|
| **Audiophile** | Parametric EQ, crossfeed, convolution, headphone profiles, audio analysis, room correction, artwork backfill |
| **SoundTouch** | Bose speaker control, zone grouping, preset management, TuneIn integration |
| **Audiobooks** | Chapter tracking, bookmarks, per-book speed persistence, WSOLA tempo control |
| **Ideas Recorder** | Voice memos and audio recording (feeds room correction measurements) |

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

## Platform & Roadmap

**Current status:** Android alpha

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
| **Discord** | [Join the community](https://discord.gg/XZ3WEFu7) |
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

FLAC (up to 384kHz/32-bit), DSD64/128/256 (DSF & DFF), ALAC, WAV, AIFF, AAC, OGG Vorbis, Opus, and MP3. All formats are decoded to 32-bit float with automatic sample rate conversion when needed.
</details>

<details>
<summary><strong>Will it work with my USB DAC?</strong></summary>

Echobox supports USB audio class devices on Android. It negotiates native sample rates with your DAC and can operate in bit-perfect mode (bypassing all DSP) for a pure signal path. Most USB DACs that work with Android should be compatible.
</details>

<details>
<summary><strong>How is Echobox different from Poweramp, UAPP, or Neutron?</strong></summary>

Echobox is built from the ground up with a Rust + Zig audio engine (no Java/C++ audio path), features full audio quality analysis with fake hi-res detection, multi-room coordination across mixed device types, a built-in room correction wizard, and release comparison intelligence. The zero-allocation Zig realtime engine and lock-free architecture are designed for uncompromising audio fidelity.
</details>

<details>
<summary><strong>When will iOS or desktop be available?</strong></summary>

Echobox is currently Android only. Check the [roadmap](https://ombs.io/roadmap) for platform expansion plans.
</details>

<details>
<summary><strong>Does Echobox collect any data?</strong></summary>

No. Echobox has zero telemetry, zero analytics, no cloud dependency, and no account requirement. Your music stays on your device. Network features (SoundTouch, UPnP, Chromecast, internet radio) operate over your local network only.
</details>

---

## License

Echobox is proprietary software. Copyright &copy; 2026 [One Man Band Studios](https://ombs.io). All rights reserved.

This repository is used for issue tracking, community discussion, and public documentation. It does not contain the Echobox source code.

---

<p align="center">
  <sub>Built with obsessive attention to audio fidelity by <a href="https://ombs.io">One Man Band Studios</a></sub>
</p>
