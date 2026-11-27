# Windows Dummy Port Occupier

A lightweight Windows desktop utility built with **Delphi (VCL)** to intentionally occupy/bind specific TCP ports on `127.0.0.1`. Useful for testing how applications, installers, or services handle port conflicts.

## Features

- **Selective Port Binding**: Choose which ports to occupy from a checklist (`3000`–`3006`, `50000`–`50006`).
- **Batch Controls**: Quickly select or deselect all ports using **Check All** and **unCheck All**.
- **One-Click Occupy & Release**:
  - **Occupy Selected Ports !** — Spawns a `TIdTCPServer` listener bound to `127.0.0.1` for each checked port.
  - **Release All Ports !** — Gracefully stops and frees all active port listeners.
- **Live Activity Log**: Displays real-time status and error messages in the log panel.

## Requirements

- **Windows** OS
- **Embarcadero Delphi** (VCL)
- **Indy** (`IdTCPServer`, `IdContext`) — included with Delphi
- **TMS Component Pack / AdvGlassButton** (`AdvGlassButton`)

## Project Structure

- `dummy_port.dpr` — Application entry point
- `dummy_port.dproj` — Delphi project configuration
- `umain.pas` / `umain.dfm` — Main form UI and port-binding logic
- `LICENSE` — Project license

## Usage

1. Open `dummy_port.dproj` in Delphi and build/run the project.
2. Check the ports you want to occupy (or click **Check All**).
3. Click **Occupy Selected Ports !** to bind the selected ports on `127.0.0.1`.
4. Run your target application or installer to test port-conflict handling.
5. Click **Release All Ports !** when finished to free all occupied ports.

## License

See [LICENSE](LICENSE) for details.
