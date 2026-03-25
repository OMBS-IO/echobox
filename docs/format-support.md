# Echobox Format Support

Echobox supports a wide range of audio formats, from lossless hi-res to standard compressed formats. This page provides detailed information about format capabilities, output handling, and device compatibility.

---

## Supported Audio Formats

| Format | Extensions | Type | Max Sample Rate | Max Bit Depth | Gapless | Metadata | Notes |
|--------|-----------|------|----------------|---------------|---------|----------|-------|
| **FLAC** | `.flac` | Lossless | 384 kHz | 32-bit | Yes | Vorbis comments + ReplayGain | Reference lossless format |
| **DSD** | `.dsf`, `.dff` | DSD | DSD256 (11.2 MHz) | 1-bit | Yes | DSF/DFF tags | Converted to high-quality PCM for processing |
| **ALAC** | `.m4a` | Lossless | 192 kHz | 32-bit | Yes | MP4 atoms | Apple Lossless in MP4 container |
| **WAV** | `.wav` | Uncompressed | 384 kHz | 32-bit | Yes | Minimal | Any bit depth supported |
| **AIFF** | `.aiff`, `.aif` | Uncompressed | 192 kHz | 32-bit | Yes | Partial | Apple/Mac standard |
| **OGG Vorbis** | `.ogg` | Lossy | 48 kHz | — | Yes | Vorbis comments | Open format |
| **Opus** | `.opus` | Lossy | 48 kHz | — | Yes | Vorbis comments + R128 gain | Efficient modern codec |
| **AAC** | `.m4a`, `.mp4` | Lossy | 48 kHz | — | Yes | MP4 atoms | In MP4 container |
| **MP3** | `.mp3` | Lossy | 48 kHz | — | Yes | ID3v2/v1 + ReplayGain | Universal compatibility |
| **WavPack** | `.wv` | Lossless | 384 kHz | 32-bit | Yes | APEv2 + ReplayGain | WavPack lossless via libwavpack |
| **APE** | `.ape` | Lossless | — | 32-bit | Yes | APEv2 + ID3v2 | Monkey's Audio, all compression levels |

---

## Hi-Res Audio

Echobox is designed for hi-res audio playback:

- **FLAC** up to 384kHz / 32-bit
- **WAV** up to 384kHz / 32-bit
- **ALAC** up to 192kHz / 32-bit
- **AIFF** up to 192kHz / 32-bit
- **DSD** up to DSD256 (11.2 MHz)

When playing hi-res content through a USB DAC, Echobox negotiates the native sample rate with your DAC automatically. If your DAC supports the source sample rate, no resampling occurs.

---

## DSD Playback

Echobox supports DSD playback from both DSF and DFF containers:

| DSD Rate | Sample Rate | Supported |
|----------|------------|-----------|
| DSD64 | 2.8 MHz | Yes |
| DSD128 | 5.6 MHz | Yes |
| DSD256 | 11.2 MHz | Yes |

DSD content is converted to high-quality PCM for processing through the DSP chain. This enables full access to EQ, crossfeed, ReplayGain, and all other DSP features on DSD files.

---

## Bit-Perfect Playback

Bit-perfect mode sends decoded audio directly to your USB DAC with zero processing:

- All DSP stages are bypassed (no EQ, no ReplayGain, no volume processing)
- The native sample rate of the source file is sent to the DAC
- Available on USB DAC output only
- Can be toggled on/off per session

Bit-perfect mode is ideal when your DAC or amplifier handles volume control and you want the purest possible signal path.

---

## Bluetooth Codec Detection

When connected to Bluetooth audio devices, Echobox detects the active codec:

- SBC
- AAC
- aptX
- aptX HD
- aptX Adaptive
- LDAC

The full DSP chain remains active over Bluetooth. Bit-perfect mode is disabled since Bluetooth codecs are inherently lossy.

---

## Output Devices

| Output | DSP | Bit-Perfect | Sample Rate |
|--------|-----|-------------|-------------|
| Phone speaker | Full | No | Device default |
| Wired headphones (3.5mm) | Full | No | Device default |
| Bluetooth | Full | No | Codec-dependent |
| USB DAC | Full or Bypass | Yes | Negotiated with DAC |
| Bose SoundTouch | Renderer handles | N/A | Device-dependent |
| Google Chromecast | Renderer handles | N/A | Device-dependent |
| UPnP/DLNA | Renderer handles | N/A | Capability-dependent |

---

## ReplayGain

Echobox supports ReplayGain for automatic loudness normalization:

- **Track mode** — Normalizes each track independently
- **Album mode** — Preserves relative loudness within an album
- Reads ReplayGain tags from FLAC (Vorbis comments), MP3 (ID3v2), Opus (R128 + standard), and other supported formats
- Includes clipping prevention to avoid distortion on loud tracks

---

## Metadata Support

| Format | Tags | Embedded Artwork | ReplayGain Tags |
|--------|------|-----------------|----------------|
| FLAC | Vorbis comments | PICTURE block | Yes |
| MP3 | ID3v2 / ID3v1 | ID3v2 APIC | Yes |
| AAC/ALAC | MP4 atoms | covr atom | No |
| OGG Vorbis | Vorbis comments | PICTURE | Yes |
| Opus | Vorbis comments | PICTURE | Yes (RG + R128) |
| WAV | Minimal | No | No |
| AIFF | Partial | No | No |
| DSD (DSF) | DSF tags | Yes | No |
| DSD (DFF) | DFF tags | No | No |
| WavPack | APEv2 | Binary tag | Yes |
| APE | APEv2 + ID3v2 | Binary tag | Yes |

Echobox can also backfill missing artwork from iTunes and MusicBrainz.

---

## Multi-Channel Handling

Echobox is a stereo player. Multi-channel source files (5.1, 7.1, etc.) are automatically downmixed to stereo for playback.

Mono files are upmixed to stereo.

---

*Have a format that isn't supported? [Request it](https://github.com/OMBS-IO/echobox/issues/new?template=feature_request.yml).*
