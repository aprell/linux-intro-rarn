mkdir Buch
cd Buch
mkdir Kapitel1 Kapitel1/Abbildungen Kapitel2 Kapitel3
cd Kapitel1
cp ~/Downloads/tux.png Abbildungen
echo "## Einleitung" > 01_Einleitung.txt
cd ..
cp ~/Downloads/*.tif .
echo "# Titel" > Inhalt.txt
