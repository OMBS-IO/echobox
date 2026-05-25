# Why Echobox?

There are several excellent music players for Android. Here's why we built another one — and who it's for.

---

## The Problem

Most Android music players fall into one of two camps:

1. **Simple players** that look good but treat audio as an afterthought — limited format support, basic EQ, no advanced features.
2. **Technical players** that support hi-res formats and USB DACs but stop there — no analysis, no multi-room, no room correction, and often dated interfaces.

Neither camp gives audiophiles and serious music listeners everything they need in one app.

---

## What Makes Echobox Different

### A purpose-built audio engine

Echobox isn't built on top of Android's media framework or a generic off-the-shelf audio library. It uses a purpose-built, zero-allocation realtime audio engine with a lock-free signal path — designed from day one for professional-grade audio processing with zero compromises.

The result: a 9-stage DSP chain that runs with zero allocations in the audio callback, ensuring glitch-free playback even under heavy processing load.

### Know your library

Most players can tell you the format and bitrate of a file. Echobox goes further:

- **Is your "hi-res" file actually hi-res?** Echobox analyzes spectral content to detect files that have been upsampled from standard resolution.
- **Which mastering is better?** If you own multiple versions of the same album, Echobox compares them across quality dimensions and shows you which one has better dynamic range, less clipping, and more consistent mastering.
- **Smart collections** automatically surface the best-mastered albums in your library — and flag the problematic ones.

No other mobile player offers this level of library intelligence.

### Multi-room without the cloud

Echobox can coordinate playback across Bose SoundTouch speakers, Chromecast devices, UPnP/DLNA renderers, and the phone itself — all in sync, all from one app. Mix and match device types in a single group.

Everything runs over your local network. No cloud account required, no internet dependency.

### Room correction in your pocket

Echobox includes a built-in room correction wizard. Generate a test signal, capture the response with a microphone, and Echobox automatically creates a correction profile tailored to your listening environment. No external software, no laptop required.

### Full transparency

The signal path diagnostics view shows exactly what Echobox is doing to your audio at every stage — from the source file format through each DSP stage to the output device. Every processing decision is explained. Nothing is hidden.

---

## Who Is Echobox For?

**Audiophiles and hi-fi enthusiasts** who want professional-grade DSP, bit-perfect USB DAC support, and the ability to critically evaluate their music library.

**Music collectors** with large libraries who want intelligent organization, quality analysis, and the ability to compare different masterings of the same album.

**Multi-room audio enthusiasts** who want to control playback across mixed device types from a single app without cloud dependencies.

**Privacy-conscious users** who want a music player that doesn't track them. Echobox has no in-app analytics, no advertising, no account requirement, and only opt-in crash reporting (off by default).

---

## What Echobox Doesn't Do

We believe in being upfront:

- **No commercial streaming services** — Echobox plays your local music library, internet radio, and self-hosted Subsonic/Navidrome servers. It does not integrate with Spotify, Tidal, Apple Music, or other commercial streaming platforms.
- **No MQA** — Echobox does not support MQA decoding.
- **No native DSD output** — DSD files are converted to high-quality PCM. If raw DSD bitstream output to your DAC is critical, consider [USB Audio Player Pro](https://www.intentsoftware.com/usbaudioplayerpro/).
- **Android-first** — The current alpha trial runs on Android. Windows desktop is next (functional, in QA), then macOS, then iOS; CarPlay is pending Apple approval. Check the [roadmap](https://ombs.io/roadmap) for live status.

---

## Try Echobox

Echobox is currently in alpha. [Sign up at ombs.io](https://ombs.io) to get early access.

Have questions? Browse the [FAQ](../FAQ.md) or join the conversation in [GitHub Discussions](https://github.com/OMBS-IO/echobox/discussions).
