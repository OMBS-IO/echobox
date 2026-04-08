# Security Policy

## Reporting a Vulnerability

If you discover a security vulnerability in Echobox, please report it responsibly.

**Do not open a public issue for security vulnerabilities.**

Instead, please reach out via the contact information on **[ombs.io](https://ombs.io)**.

Include:
- Description of the vulnerability
- Steps to reproduce
- Echobox version and Android version
- Any potential impact you've identified

## Response Timeline

- **Acknowledgment:** Within 48 hours
- **Initial assessment:** Within 7 days
- **Fix or mitigation:** Dependent on severity, but critical issues are prioritized immediately

## Scope

This policy covers the Echobox Android application. It does not cover:
- Third-party services (Radio-Browser API, etc.)
- User devices or networks

## Security Design

Echobox is built with security in mind:

- **Zero cloud dependency** — No user data is transmitted to any server
- **No telemetry or analytics** — Nothing is tracked
- **No account required** — No credentials to protect
- **Minimal storage access** — The app reads your music files; file deletion (duplicate resolution) requires explicit user confirmation and uses system trash for reversibility
- **Local network only** — SoundTouch, UPnP, and Cast operate on your LAN
- **Zero known vulnerabilities** — Dependencies are regularly audited
