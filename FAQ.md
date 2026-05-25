# Frequently Asked Questions

## General

### Is Echobox open source?

No. Echobox is proprietary software developed by [One Man Band Studios](https://ombs.io). This GitHub repository is a community hub for bug reports, feature requests, and discussion. The source code is not publicly available.

### When will Echobox be available?

Echobox is currently in alpha. Sign up at [ombs.io](https://ombs.io) to be notified when the beta launches.

### Is Echobox free?

Pricing details will be announced closer to launch. Visit [ombs.io](https://ombs.io) for the latest information.

### Does Echobox collect any data?

No in-app analytics and no advertising. Optional opt-in crash reporting via Sentry can be enabled in Settings → Diagnostics — it's off by default, and you control whether to turn it on. When enabled, crash reports are stripped of PII and URL credentials before upload. Your music stays on your device. Network features (SoundTouch, UPnP, Chromecast, internet radio) operate over your local network only.

---

## Audio & Formats

### What audio formats are supported?

FLAC (up to 384kHz/32-bit), DSD64/128/256 (DSF & DFF), ALAC, WAV, AIFF, AAC, OGG Vorbis, Opus, MP3, WavPack, and APE (Monkey's Audio). All formats are decoded to 32-bit float with automatic sample rate conversion when needed.

### Does it support DSD natively?

Echobox decodes DSD (DSF and DFF containers) up to DSD256 using a high-quality digital filter for DSD-to-PCM conversion. The full DSP chain is then available on the converted signal.

### What is bit-perfect mode?

Bit-perfect mode bypasses the entire DSP chain and sends the decoded audio directly to your USB DAC at its native sample rate. This means no EQ, no ReplayGain, no volume processing — just the pure signal from your files.

### Will it work with my USB DAC?

Echobox supports USB audio class devices on Android. It negotiates native sample rates with your DAC automatically. Most USB DACs that work with Android should be compatible. If you have issues, please file an [Audio Quality Issue](https://github.com/OMBS-IO/echobox/issues/new?template=audio_quality_issue.yml).

---

## Playback & Features

### Does it support gapless playback?

Yes. Gapless playback works across all supported formats with seamless track transitions.

### How does multi-room work?

Echobox can coordinate playback across mixed device types: Bose SoundTouch (hardware-level zone sync), Chromecast, UPnP/DLNA renderers, and the phone itself. You can create output groups combining any of these. The sync engine monitors drift and applies corrections automatically.

### What is the audio quality analysis?

Echobox can decode and analyze your entire library, measuring: LUFS loudness, true peak levels, dynamic range, clipping artifacts, spectral bandwidth, and hi-res confidence (detecting files that may be upsampled rather than genuine hi-res).

### What is release comparison?

If you own multiple versions of the same album (e.g., original CD rip vs. remaster vs. hi-res download), Echobox groups them and compares quality across 6 dimensions so you can identify the best-mastered version.

### Can Echobox find duplicate files in my library?

Yes. Echobox uses multiple detection strategies: exact content hashing for byte-identical copies and metadata fuzzy matching for same-track-different-encoding duplicates. It automatically recommends which copy to keep based on audio quality (lossless preferred, higher bit depth, higher sample rate). Resolution is safe — files are moved to your system trash, never permanently deleted, and playlist references are cleaned up automatically.

### Can I bulk-download lyrics for my library?

Yes. The Lyrics add-on includes a library-wide scanner that queries LRCLIB for synced lyrics across every track, writing results to both the in-app cache and `.lrc` sidecar files next to your audio for portability. Scanning is parallel, cancellable, and resumable across app restarts — you can configure concurrency, skip already-tagged tracks, and retry only previously failed lookups.

### Does Echobox have a fullscreen karaoke lyrics view?

Yes. The Lyrics add-on includes a Spotify-style fullscreen view with word-by-word highlighting synced to playback, dominant-color theming derived from the current track's artwork, and deep-link support so external launchers can jump straight into the lyrics view.

### What is the Room Designer add-on?

The Room Designer is a predict-based DIY room treatment optimizer that complements the measurement-based Room Correction wizard. It walks you through a 5-step room setup (dimensions, materials, listening position, speakers, treatment goals), models acoustic behavior (modal response, image-source method, RT60), and recommends treatment placements from a vendor-neutral generic catalog. A 3D viewer shows your room and proposed treatments, and you can export a min-phase FIR for use in the convolution engine.

### Does Echobox surface artwork from sidecar files?

Yes. In addition to embedded artwork, Echobox reads cover.jpg, folder.jpg, and Cover Front.jpg sidecars next to your audio files. You can configure a priority order in settings (embedded vs. filename-based vs. any image), with the first available match winning. When no artwork is found, Echobox renders a deterministic CD-style placeholder so your library never shows blank tiles.

### Can I customize the home page?

Yes. Sections can be reordered, hidden, or pinned, and each section has list/compact display variants and a configurable item count. A "Feeling Lucky" surface offers random-but-quality-weighted picks from your library.

---

## How is Echobox different?

### vs. Poweramp

Echobox features a purpose-built realtime audio engine, built-in audio quality analysis with fake hi-res detection, multi-room coordination, room correction, release comparison, and full signal path diagnostics.

### vs. USB Audio Player Pro (UAPP)

Echobox adds a complete DSP chain alongside bit-perfect mode, multi-room support, audio analysis, library intelligence, and a modern, responsive UI. UAPP focuses primarily on USB DAC bit-perfect output.

### vs. Neutron

Echobox differentiates with its purpose-built realtime audio engine, multi-room coordination, audio quality analysis, room correction wizard, and library intelligence features. Both offer professional-grade DSP and surround virtualization.

---

## Platform

### Is Echobox available on iOS or desktop?

Echobox is being built Android-first. The current alpha trial runs on Android only. Windows desktop is next (functional, currently in QA), followed by macOS, then iOS. CarPlay support is pending Apple approval. Check the [roadmap](https://ombs.io/roadmap) for live status.

### Does it work with Android Auto?

Yes. Echobox integrates with Android Auto for in-car browsing and playback control via MediaBrowserService. CarPlay support is planned for a future release.

---

## Support

### Where do I report a bug?

[Open an issue](https://github.com/OMBS-IO/echobox/issues/new/choose) using the appropriate template, or start a thread in [GitHub Discussions](https://github.com/OMBS-IO/echobox/discussions).

### How can I share diagnostic info if something goes wrong?

Echobox includes a one-tap "Share Diagnostics" action that generates a structured text report — device info, app version, recent crash log, engine state, signal path snapshot, library stats, and internal logs. Paste it into a GitHub issue and we'll have everything we need to reproduce the problem. Diagnostics are generated only when you tap the action and never leave your device automatically.

### Where do I request a feature?

[Open a feature request](https://github.com/OMBS-IO/echobox/issues/new?template=feature_request.yml) or start a discussion in [Feature Ideas](https://github.com/OMBS-IO/echobox/discussions).
