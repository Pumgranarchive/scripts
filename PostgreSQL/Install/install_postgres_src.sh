#Installation des dépendances
sudo apt-get update
echo '' | sudo apt-get install libreadline6-dev
echo '' | sudo apt-get install zlib1g-dev

echo '' | sudo apt-get install gcc
echo '' | sudo apt-get install make

#Téléchargement de PostgreSQL v9.4.0
wget https://ftp.postgresql.org/pub/source/v9.4.0/postgresql-9.4.0.tar.gz
tar -xf postgresql-9.4.0.tar.gz
cd postgresql-9.4.0/

#Compilation de PostgreSQL
./configure
make
sudo make install

#Configuration de PostgreSQL
sudo adduser postgres                           #Utilisateur qui lance le serveur de la DB
sudo mkdir /usr/local/pgsql/data/               #Répertoire dans lequel va être stocké les objets (DB, tables, ...)
sudo chown postgres /usr/local/pgsql/data/      #Ce repertoire appartient à l'utilisateur Postgres et Root (personne d'autre)
sudo su postgres <<-'EOF'
set -e
export PATH="/usr/local/pgsql/bin:$PATH"
initdb -D /usr/local/pgsql/data/
pg_ctl -D /usr/local/pgsql/data/ -w start
createdb pumgrana
createuser api

EOF



#Lancement de PostgreSQL au démarrage
sudo sed -i -e '$i su - postgres -c '\''/usr/local/pgsql/bin/pg_ctl start -D /usr/local/pgsql/data -l serverlog'\''\n' /etc/rc.local
