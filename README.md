# PPPwn-Luckfox

An alternative low-cost Linux board for exploits PS4 on V11.00 or below.<br>
Original work by theflow <a href=https://github.com/TheOfficialFloW/PPPwn>PPPwn</a> 
and thanks to xfangfang <a href=https://github.com/xfangfang/PPPwn_cpp>PPPwn-CPP</a> for an executable re-write of PPPwn in C++ for Cortex-A7 which is compatible with RV1103/RV1106 rockchip
on the luckfox pico series and SiSTRo for his <a href=https://github.com/GoldHEN/GoldHEN>GoldHen</a>, and lastly <a href=https://github.com/stooged/PI-Pwn>Stooged</a> for his inspiration. <br>

## Note

- Currently support PS4 version: `9.00, 9.60, 10.00, 10.01, 11.00`
- The average PPPwned time is around `1min - 2min` sometimes it load under `1 minute`
- Using `pppwn` nightly build from xfangfang PPPwn_cpp <be>

## Tested Version

- [x] 9.00
- [x] 9.60
- [x] 10.00
- [x] 10.01
- [x] 11.00
      
## What it does

The goal here is to setup the Luckfox pico to automatically try and jailbreak the console, all you need to do is wait until the process completes. Once it PPPwned the process will stop. <br>

## Requirements

- Luckfox Pico/Pro/Max/Plus/Mini
- Ethernet Cable
- USB Type-C for power to the board
- A USB drive with exFAT32 formatted (only use for the first time to load GoldHEN)

## Support Boards

- <b>Luckfox Pico Pro</b><br>
- <b>Luckfox Pico Max</b><br>
- <b>Luckfox Pico Plus</b><be>
- <b>Luckfox Pico Mini *</b><br>
- <b>Luckfox Pico *</b><br>

## Installation Software

1. Download <a href= https://drive.google.com/drive/folders/1sFUWjYpDDisf92q9EwP1Ia7lHgp9PaFS>Alpine Linux</a> After you download, extract one of the zip files according to your Luckfox Pico models. <br>
2. Download <a href=https://drive.google.com/file/d/1ALo4G7rEaF1GNhUHINoYHT_RGWGddzYw>SocToolKit</a> and unzip the burning tool.
3. Open the software and select your chip type

Luckfox Models  | Chip Type
------------- | -------------
Luckfox Pico Pro/Max  | RV1106
Luckfox Pico/Plus/Mini  | RV1103 

4. Steps to flash firmware for Luckfox Pico on Windows: <br>
 <a href= https://wiki.luckfox.com/Luckfox-Pico/Luckfox-Pico-ProMax-burn-image/> Alpine Linux Porting</a>
 Seguire le istruzioni sul wiki ufficiale

7. After you log in, run the following commands and follow the setup instruction


Modifica il file /etc/network/interfaces usando vi:
```sh
vi /etc/network/interfaces
```
Utilizzare vi per modificare il file,
Entra in modalità di inserimento:
Premi "i" per entrare in modalità di inserimento.
Inserisci la seguente configurazione:
```sh
auto eth0
iface eth0 inet dhcp
```   

Premi Esc per uscire dalla modalità di inserimento.
Digita :wq e premi Invio per salvare le modifiche e uscire da vi.
Riavvia il servizio di rete per applicare le modifiche:
```sh
/etc/init.d/networking restart
``` 
1. Installazione di sudo
Ora puoi installare sudo/nano utilizzando il comando apk:
```sh
su -  # Passa a root se non lo sei già
apk update  # Aggiorna l'elenco dei pacchetti disponibili
apk add sudo  # Installa il pacchetto sudo
apk add nano # installa il pacchetto nano
``` 

Once the Luckfox reboots pppwn will run automatically.<be>

## * Special Note for Luckfox Pico/Mini
Ignore this if you use Pro/Max/Plus version. For these 2 boards, there's no Ethernet port, to make it work you need to solder the LAN Port (RJ45) cable to it, either female or male is fine, and burn the Ubuntu image with `pico plus image` and follow the same step as other boards. See the wiring in the `Issues` tab.

## Installation Hardware

1. You simply need to connect the LAN cable from Luckfox Pico to the PS4 and power the Luckfox from the PS4 via a USB Type-C cable or other sources.

## On your PS4:<br>

- Go to `Settings` and then `Network`<br>
- Select `Set Up Internet connection` and choose `Use a LAN Cable`<br>
- Choose `Custom` setup and choose `PPPoE` for `IP Address Settings`<br>
- Enter `ppp` for `PPPoE User ID` and `PPPoE Password`<br>
- Choose `Automatic` for `DNS Settings` and `MTU Settings`<br>
- Choose `Do Not Use` for `Proxy Server`<br>

For GoldHen you need to place the goldhen.bin file onto the root of a usb drive and plug it into the console.<br>
Once goldhen has been loaded for the first time it will be copied to the consoles internal hdd and the usb is no longer required.<br>
To update goldhen just repeat the above process and the new version will be copied to the internal hdd<br>

