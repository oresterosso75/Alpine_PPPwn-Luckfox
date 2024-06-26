PPPwn-Luckfox<br>
Una scheda Linux alternativa a basso costo per eseguire exploit su PS4 con versione 11.00 o inferiore.<br>
Lavoro originale di theflow <a href=https://github.com/TheOfficialFloW/PPPwn>PPPwn</a>
e grazie a xfangfang <a href=https://github.com/xfangfang/PPPwn_cpp>PPPwn-CPP</a> per una riscrittura eseguibile di PPPwn in C++ per Cortex-A7 compatibile con RV1103/RV1106 rockchip sulla serie Luckfox pico e SiSTRo per il suo <a href=https://github.com/GoldHEN/GoldHEN>GoldHen</a>, e infine <a href=https://github.com/stooged/PI-Pwn>Stooged</a> per la sua ispirazione. <br>

Nota
Versioni attualmente supportate di PS4: 9.00, 9.60, 10.00, 10.01, 11.00<br>
Il tempo medio di PPPwned è circa 1min - 2min, a volte si carica in meno di 1 minuto<br>
Utilizzo di pppwn nightly build da xfangfang PPPwn_cpp <br><be>
Versioni testate
 9.00
 9.60
 10.00
 10.01
 11.00
Cosa fa
L'obiettivo è configurare il Luckfox pico per tentare automaticamente di effettuare il jailbreak della console, tutto ciò che devi fare è aspettare che il processo si completi. Una volta completato il PPPwn, il processo si fermerà. <br>

Requisiti
Luckfox Pico/Pro/Max/Plus/Mini
Cavo Ethernet
USB Type-C per alimentare la scheda
Una chiavetta USB formattata in exFAT32 (da utilizzare solo la prima volta per caricare GoldHEN)
Schede supportate
<b>Luckfox Pico Pro</b><br>
<b>Luckfox Pico Max</b><br>
<b>Luckfox Pico Plus</b><be>
<b>Luckfox Pico Mini *</b><br>
<b>Luckfox Pico *</b><br>

Installazione Software

1 Scarica <a href= https://drive.google.com/drive/folders/1sFUWjYpDDisf92q9EwP1Ia7lHgp9PaFS>Alpine Linux</a>. Dopo il download, estrai il file zip dentro la cartella SocToolKit <br>
2 Scarica <a href=https://drive.google.com/file/d/1ALo4G7rEaF1GNhUHINoYHT_RGWGddzYw>SocToolKit</a> e decomprimi lo strumento di masterizzazione.
4 Passaggi per flashare il firmware per Luckfox Pico su Windows: <br>
 <a href= https://wiki.luckfox.com/Luckfox-Pico/Luckfox-Pico-ProMax-burn-image/> Alpine Linux Porting</a>
5 Seguire le istruzioni sul wiki ufficiale

Accesso al dispositivo tramite putty:<br>
Scarica <a href= https://www.chiark.greenend.org.uk/~sgtatham/putty/latest.html>Putty 0.81</a>.<br>
Segui la procedura per l'accesso:
<a href= https://wiki.luckfox.com/Luckfox-Pico/Luckfox-Pico-Alpine-Linux-1/>Alpine Linux Porting</a>.<br>
dopo accesso:<br>

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
Ora puoi installare sudo/nano utilizzando il comando apk:
```sh
su -  # Passa a root se non lo sei già
apk update  # Aggiorna l'elenco dei pacchetti disponibili
apk add sudo  # Installa il pacchetto sudo
apk add nano # installa il pacchetto nano
``` 

Installa PPPwn:
Scarica <a href=https://winscp.net/eng/download.php>WinSCP 6.3</a>
Connetti al dispositivo con le credenziali impostate con putty, scorri fino alla cartella root e copia all'interno la cartella PPPwn.
Chiudere il programma

Apri nuovamente putty, accedi con le credenziali.
Spostati dentro la cartella PPPwn ed esegui i comandi:

```sh
cd PPPwn
chmod +x install.sh
sudo ./install.sh
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

