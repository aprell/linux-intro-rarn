# Einführung in die Benutzung von Linux

Im Rahmen der Vorlesung _Rechnerarchitektur und Rechnernetze_ am
Lehrstuhl für Angewandte Informatik II  
Universität Bayreuth  
Wintersemester 2014/15

## Linux?

- Linux bezeichnet eigentlich nur den Betriebssystem-Kernel
- Kernel + System- und Anwenderprogramme = vollständiges Betriebssystem für
  Endanwender (Distribution)
- Es gibt zahllose Distributionen, zu viele, um sie alle aufzuzählen
- Aktuelle Spitzenplätze auf [distrowatch.com](http://distrowatch.com)
  (Oktober 2014): 1. [Mint](http://www.linuxmint.com), 2.
  [Ubuntu](http://www.ubuntu.com/), 3. [Debian](http://www.debian.org/)
- Weitere bekannte Distributionen: [Fedora](http://fedoraproject.org),
  [openSUSE](http://de.opensuse.org), [Mageia](http://www.mageia.org),
  [Gentoo](http://www.gentoo.org), ...
- Linux ist weit verbreitet, vor allem auf Servern, Supercomputern, in
  eingebetteten Systemen, auf Smartphones und auf Tablets (Android)
- Desktop-Umgebungen wie [KDE](http://www.kde.org),
  [GNOME](http://www.gnome.org), [Xfce](http://www.xfce.org) oder
  [LXDE](http://lxde.org) bieten grafische Benutzeroberflächen und erleichtern
  den Einstieg

## Anwendungen

### Webbrowser
<img src="images/firefox.png" alt="Firefox" title="Firefox" style="width: 800px"/>

### Office-Suite
<img src="images/calc.png" alt="LibreOffice Calc" title="LibreOffice Calc" style="width: 800px"/>

### Dateimanager
<img src="images/dolphin.png" alt="Dolphin" title="Dolphin" style="width: 800px"/>

### Dokumentbetrachter
<img src="images/okular.png" alt="Okular" title="Okular" style="width: 800px"/>

### Bildbetrachter
<img src="images/gwenview.png" alt="Gwenview" title="Gwenview" style="width: 800px"/>

### Texteditor
<img src="images/kwrite.png" alt="KWrite" title="KWrite" style="width: 800px"/>

## $HOME sweet $HOME

- Linux ist ein Mehrbenutzer-Betriebssystem
- Jeder Benutzer hat ein eigenes Arbeitsverzeichnis (Home-Verzeichnis)
- Dateien und Verzeichnisse außerhalb des eigenen Home-Verzeichnisses können
  nur mit entsprechenden Rechten zugegriffen werden

### Beispiel

_Anlegen und Löschen von Ordnern und Dateien in der aktuellen
Desktop-Umgebung_

## Die Kommandozeile

<img src="images/konsole.png" alt="Konsole" title="Konsole" style="width: 600px"/>

- Die Kommandozeile bietet Zugriff auf grafische und nichtgrafische Tools
  und Anwendungen; man gibt Befehle ein und bestätigt mit der Eingabetaste
- `man xyz` (manual) liefert Hilfe zu einem bestimmten Befehl `xyz`
- Alles, was folgt, funktioniert auch auf Macs, da OS X und Linux ein
  gemeinsames Vorbild haben: [Unix](http://de.wikipedia.org/wiki/Unix)

### Beispiel

_Anlegen und Löschen von Ordnern und Dateien in der Kommandozeile_

Wo befinden wir uns?

`pwd` (print working directory)

Wir befinden uns in unserem Home-Verzeichnis. Was gibt es hier?

`ls` (list contents)

Noch nicht besonders viel. Es kann losgehen:

1. `mkdir Buch` (make directory)
2. `cd Buch` (change directory)

	Wir befinden uns jetzt im Verzeichnis `Buch`, das wir soeben angelegt
	haben. Die restlichen fehlenden Verzeichnisse können wir der Reihe nach
	oder in einem Rutsch erstellen.

3. `mkdir Kapitel1 Kapitel2 Kapitel3`  
   `mkdir Kapitel1/Abbildungen`

	Tipp: Mit der Option `-p` (parent) geht das Erstellen einer
	Verzeichnisstruktur am schnellsten:

	`mkdir -p Kapitel1/Abbildungen Kapitel2 Kapitel3`

4. `cd Kapitel1`

	Jetzt befinden wir uns in `Kapitel1`, einem Unterverzeichnis von `Buch`.
	Tilde (`~`) bezeichnet unser Home-Verzeichnis (Neugierige probieren `echo
	~`). Wir downloaden die Datei `Tux.png` und kopieren diese anschließend
	von `Downloads` nach `Abbildungen`.  Mit `echo` erzeugen wir die Datei
	`Einleitung.txt` und fügen eine erste Zeile Text ein. Da wir uns in
	`Buch/Kapitel1` befinden, bringt uns `cd ..` in das übergeordnete
	Verzeichnis `Buch` zurück.

5. `curl -s -o ~/Downloads/Tux.png http://upload.wikimedia.org/wikipedia/commons/a/af/Tux.png`
6. `cp ~/Downloads/Tux.png Abbildungen` (copy)
7. `echo "Einleitung" > Einleitung.txt`
8. `cd ..`

	Wieder im Verzeichnis `Buch` erzeugen wir mit `echo` analog zu 6. die
	Datei `Inhalt.txt`. Fertig!

9. `echo "Titel" > Inhalt.txt`

Das war recht mühsam. Schön wäre es, wenn man diesen Vorgang automatisieren
könnte...

### Ein einfaches Shell-Skript

_Shell = Kommandozeileninterpreter_

Um alle Befehle aus unserem Beispiel "auf einmal" auszuführen, erstellen wir
eine Datei `newbook.sh` mit folgendem Inhalt:

```shell
mkdir Buch
cd Buch
mkdir -p Kapitel1/Abbildungen Kapitel2 Kapitel3
cd Kapitel1
curl -s -o ~/Downloads/Tux.png http://upload.wikimedia.org/wikipedia/commons/a/af/Tux.png
cp ~/Downloads/Tux.png Abbildungen
echo "Einleitung" > Einleitung.txt
cd ..
echo "Titel" > Inhalt.txt
echo "Neues Buch angelegt"
```

Können wir die Datei nun als Programm ausführen? Noch nicht...

`ls -l`

Die Datei `newbook.sh` kann zwar gelesen und verändert, aber nicht ausgeführt
werden. Das müssen wir ändern.

`chmod u+x newbook.sh` (change mode)  
`ls -l`

Et voilà! Mit `mv` verschieben wir `newbook.sh` nach `bin` und mit `cd` ohne
Pfadangabe wechseln wir direkt ins Home-Verzeichnis.

`mv newbook.sh ~/bin` (move)  
`cd`

 Zum Test löschen wir unser oben angelegtes `Buch`. Bereit? Dann los:

`newbook.sh`

### Zum Schluss

Kommandos lassen sich verketten: `a | b` bedeutet, die Ausgabe bzw. das
Ergebnis von `a` wird als Eingabe von `b` verwendet. Extrem nützlich! Drei
kurze Beispiele:

`find -name '*.txt' | wc -l` ermittelt die Anzahl der Textdateien im
aktuellen Verzeichnis einschließlich aller Unterverzeichnisse.

`echo "4/3 * 3.14159 * 2.25^3" | bc` bestimmt den Wert des in Klammern
stehenden arithmetischen Ausdrucks (`bc` ist ein Taschenrechner).

`history | tr -s " " | cut -d" " -f3 | sort | uniq -c | sort -nr | head` zeigt
die "Top 10" der am häufigsten benutzten Kommandos.  

Das letzte Beispiel lässt erahnen, der Fantasie sind nahezu keine Grenzen
gesetzt.
