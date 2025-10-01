# DuckyPad Music Server Control

Wall-mounted duckyPad for controlling shairport-sync via MPRIS.

## Hardware

- duckyPad (2020) with custom 3D printed case, mounted on the wall with Command Strips
- fitPC3 music server running Debian
- Connected via USB

## What It Does

- Play/Pause, Next, Previous, Stop track via MPRIS
- Set AirPlay volume to 100% via pseudo-MPRIS
- Mute toggle via ALSA

## Server Setup

### System Configuration Files
- `/etc/shairport-sync.conf` - Enable MPRIS support
- `/etc/triggerhappy/triggers.d/shairport.conf` - Key bindings
- `/etc/systemd/system/triggerhappy.service.d/override.conf` - Run as triggerhappy user

### Scripts
- `./pull_config.sh` - Update scripts from server setup
- `./push_config.sh` - Copies setup files to server's temp directory
- `./Scrpting/install_configs.sh` - Installs config files and updates daemons

### Services
- `shairport-sync` - AirPlay receiver with MPRIS enabled
- `triggerhappy` - Listens for media keys, runs as triggerhappy user

### Users and Groups
- `triggerhappy` user in `audio` and `input` groups
- `shairport-sync` user in `audio` group

## DuckyPad Configuratio

Keys programmed with media key codes:
- `MK_PP` - Play/Pause
- `MK_NEXT` - Next track
- `MK_PREV` - Previous track
- `MK_MUTE` - Mute toggle
- `MK_STOP` - Stop playback
- `MK_VOLUP` - Interpreted as set volume 100%

## Notes

Volume control is best to do via physical amplifier knob. While iPhone/iPad volume rocker is convenient from afar, volume modification controlled from fitPC3 was unreliable. Since the duckyPad is in arm's reach of the amplifier, it makes most sense to be able to easily maximize the digital volume for best fidelity and volume consistency.

Because of the delay inherent to AirPlay audio streaming, there is about a 1-3 second delay in the duckyPad -> triggerhappy -> MPRIS -> AirPlay device -> shairport-sync pipeline. This is judged to be acceptable for the use case. The mute function is nearly instantaneous because it works through ALSA directly.

## Photos

![Case photo 1](Photos/Case1.jpg)
![Case photo 2](Photos/Case2.jpg)
![Case photo 3](Photos/Case3.jpg)
