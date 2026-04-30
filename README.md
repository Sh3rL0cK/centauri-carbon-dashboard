# Centauri Carbon Dashboard

A self-contained web dashboard for the **Elegoo Centauri Carbon** FDM 3D printer.

Single HTML file. No build step, no dependencies, no server-side code.

![Dashboard screenshot](https://raw.githubusercontent.com/Sh3rL0cK/centauri-carbon-dashboard/main/screenshot.png)

## Features

- Live camera feed (MJPEG, resizable panel, fullscreen)
- Temperature monitoring — nozzle, bed, chamber with progress bars
- Print progress ring — percent, layer count, elapsed/remaining time
- XYZ position, motor status, fan speed sliders
- Motion control — D-pad XY jog, Z, extruder; step sizes 0.1/1/10/30mm; per-axis homing
- Print controls — Print, Pause, Resume, Stop, Lights, Set Temps, Fans Off
- Speed slider (10–200%)
- File browser — browse printer storage, upload `.gcode`, start print directly
- Multi-printer support — add/remove/switch between printers
- Printer config saved to `localStorage` — auto-connects on every page load
- Raw WebSocket log + command input for debugging

## Quick Start

### Docker (recommended)

```bash
docker run -d -p 8080:80 sh3rl0ck/centauri-carbon-dashboard
```

Open **http://localhost:8080**, click **+**, enter your printer's IP address.

### Or serve the HTML directly

```bash
python3 -m http.server 8080
```

Open **http://localhost:8080/centauri-dashboard-v2.html**

> **Note:** Must be served over HTTP — opening as `file://` blocks WebSocket connections.

## Protocol

The printer communicates over **SDCP v3.0** (Smart Device Control Protocol) via WebSocket on port 3030. No authentication required.

```
ws://<printer-ip>:3030/websocket
```

The dashboard auto-discovers the MainboardID on first connection and handles reconnection automatically.

## Tested with

- Elegoo Centauri Carbon (firmware as of early 2026)

Other Elegoo SDCP-compatible printers may work — open an issue if yours does.

## License

MIT
