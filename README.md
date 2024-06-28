<h1>PPPwn-Luckfox</h1>
<nr>
La scheda di sviluppo Luckfox Pico è basata su Linux e progettata per progetti di elettronica e sviluppo di applicazioni integrate.<br>
Questa scheda rappresenta un'alternativa a basso costo per eseguire exploit su PS4 con versione 11.00 o inferiore.<br>
Il lavoro originale è stato realizzato da theflow con il progetto <a href="https://github.com/TheOfficialFloW/PPPwn">PPPwn</a><br>
Grazie a xfangfang per la riscrittura in C++ eseguibile su Cortex-A7 compatibile con i rockchip RV1103/RV1106 nella serie Luckfox Pico, disponibile nel progetto <a href="https://github.com/xfangfang/PPPwn_cpp">PPPwn-CPP</a>.<br>
Un ringraziamento speciale va anche a SiSTRo per il suo progetto <a href="https://github.com/GoldHEN/GoldHEN">GoldHen</a>, e infine a Stooged per la sua ispirazione con il progetto <a href="https://github.com/stooged/PI-Pwn">PI-Pwn</a>.<br><br>

Nota:
Le versioni di Firmware PS4 attualmente supportate: 9.00, 9.60, 10.00, 10.01, 11.00<br>
Il tempo medio di PPPwned è circa 1min - 2min, a volte si carica in meno di 1 minuto<br>
L'obiettivo è configurare il Luckfox Pico in modo che tenti automaticamente di effettuare il jailbreak della PS4.<br>
Una volta avviato, non è necessario alcun intervento: basta attendere che il processo termini.<br>
Quando PPPwn completa il jailbreak, il procedimento si arresterà automaticamente.

Requisiti:<br>
usb Serial Converter <a href=https://voob.it/Q9rP>CP2102</a><br>
Luckfox Pico/Pro/Max/Plus/Mini<br>
Cavo Ethernet<br>
USB Type-C per alimentare la scheda<br>
Una chiavetta USB formattata in exFAT32 (da utilizzare solo la prima volta per caricare GoldHEN)<br>
Schede supportate:<br><br>
<b>Luckfox Pico Pro</b><br>
<b>Luckfox Pico Max</b><br>
<b>Luckfox Pico Plus</b><be>
<b>Luckfox Pico Mini *</b><br>
<b>Luckfox Pico *</b><br><br>

Installazione Software

1 Scarica <a href= https://drive.google.com/drive/folders/1sFUWjYpDDisf92q9EwP1Ia7lHgp9PaFS>Alpine Linux</a>. Dopo il download, estrai il file zip dentro la cartella SocToolKit <br>
2 Scarica <a href=https://drive.google.com/file/d/1ALo4G7rEaF1GNhUHINoYHT_RGWGddzYw>SocToolKit</a> e decomprimi lo strumento di masterizzazione.<br>
3 Segui i passaggi per flashare il firmware per Luckfox Pico su Windows:<a href= https://wiki.luckfox.com/Luckfox-Pico/Luckfox-Pico-Alpine-Linux-1/>Alpine Linux Porting</a>.<br>
Dopo l'accesso è necessario modificare la password di root per consentire l'accesso da WinSCP per il trasferimento di file.<br> 
Per cambiare o impostare una password in Alpine Linux, segui questi passaggi:<br>
Digita il comando:<br>

```sh
su
```
1 Premi Invio per loggarti come utente root o avere i privilegi<br>
2 Digita:<br>
```sh
passwd root
```
Segui le istruzioni per inserire la nuova password di root.<br>

Ora inserendo le nuove credenziali ( IP,User,Password) è possibile accedere correttamente tramite Putty oppure tramite WinSPC.<br> 

Per configurare l'interfaccia di rete eth0 in modalità DHCP (IP dimanico assegnato dal router)<br>
Modifica il file /etc/network/interfaces usando vi:
```sh
vi /etc/network/interfaces
```
Utilizzare vi per modificare il file,
Entra in modalità di inserimento:
Digita "i" sulla tastiera per entrare in modalità di inserimento e cancella(se presente):
```sh
auto eth0
iface eth0 inet static
        address 192.168.50.59
        netmask 255.255.255.0
        gateway 192.168.50.1
```   
Inserisci la seguente configurazione:
```sh
auto eth0
iface eth0 inet dhcp
```   

Premi Esc per uscire dalla modalità di inserimento.
Digita sulla tastiera ":wq" e premi Invio per salvare le modifiche e uscire da vi.
Ora riavvia il servizio di rete per applicare le modifiche:
```sh
/etc/init.d/networking restart
``` 
Installazione di sudo utilizzando i comandi apk:
```sh
su -
apk update 
apk add sudo 
``` 
Ora possiamo disconnettere il dispositivo dalla porta Seriale.<br><br>
Installa PPPwn:
Scarica <a href=https://winscp.net/eng/download.php>WinSCP 6.3</a>
Connetti al dispositivo con le credenziali (IP,USER,PWD) scorri fino alla cartella root e copia all'interno la cartella PPPwn (avendo cura di rinominarla PPPwn).
Chiudere il programma

Apri putty, accedi con le credenziali (IP,USER,PWD) ed esegui i comandi:

```sh
cd PPPwn
chmod +x install.sh
sudo ./install.sh
``` 
Una volta che il Luckfox si riavvia, PPPwn verrà eseguito automaticamente.

* Nota Speciale per Luckfox Pico/Mini
Ignora questa sezione se usi le versioni Pro/Max/Plus.<br>
Per queste due schede, poiché non c'è una porta Ethernet, è necessario saldare un cavo per la porta LAN (RJ45), sia maschio che femmina. Successivamente segui gli stessi passaggi delle altre schede.

<h1>Installazione Hardware</h1><br><br>

Collega semplicemente il cavo LAN dal Luckfox Pico alla PS4 e alimenta il Luckfox dalla PS4 tramite un cavo USB Type-C o altre fonti.<br>
Sulla tua PS4:<br>
Vai a Impostazioni di Rete<br>
Seleziona Configura connessione Internet e scegli Usa un cavo LAN<br>
Scegli l'opzione Personalizzata per la configurazione e seleziona PPPoE per le Impostazioni dell'indirizzo IP<br>
Inserisci 0000 come ID utente 0000 e Password PPPoE<br>
Scegli Automatico per le Impostazioni DNS e Impostazioni MTU<br>
Seleziona Non usare per il Server Proxy<br>

Per GoldHen, è necessario posizionare il file goldhen.bin nella radice di una chiavetta USB e collegarla alla console. Una volta caricato GoldHen per la prima volta, verrà copiato sul disco rigido interno della console e la chiavetta USB non sarà più necessaria. Per aggiornare GoldHen, basta ripetere il processo e la nuova versione verrà copiata sul disco rigido interno.
