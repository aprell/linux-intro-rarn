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
