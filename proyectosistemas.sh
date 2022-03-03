eleccion=0
while [ $eleccion != 4 ]
do
echo "MENU"
echo "----------------------------------------------"
echo "1.-Instalacion de plex."
echo "2.-Comprobacion del status del servicio plex."
echo "3.-Desistalar plex."
echo "4.-Salir"
echo "-----------------------------------------------"
read -p "dime que eleccion del menu quieres" eleccion

if [ $eleccion -eq 1 ];then

read -p "Comprueba si esta el servicio plex : " instalador
if [ $instalador -eq "1" ];then
        ruta3=`sudo service plexmediaserver status`
        if [ -z "$ruta3" ];then
        	echo "No existe"
		read -p "quieres instalar el servicio de video: " servicio
		if [ $servicio -ne "1" ];then
			exit
		else
	        	read -p "desea hacer la instalacion de los repositorios: " repositorios
	       	 	if [ $repositorios -eq "1" ];then
	                	sudo apt-get  update
        	        	sudo apt-get  upgrade
        		fi
        		read -p "desea instalarlo :" instalarlo
	        	if [ $instalarlo -eq "1" ];then
        			 sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 97203C7B3ADCA79D
        			 sudo apt install apt-transport-https ca-certificates curl
       				 sudo curl https://downloads.plex.tv/plex-key
       				 echo deb https://downloads.plex.tv/repo/deb public main | sudo tee /etc/apt/sources.list.d/plexmediaserver.list
        			sudo apt update
        			sudo apt-get install -y plexmediaserver
        			sudo mkdir -p /opt/plexmediaserver/movies
        			sudo chown -R plex: /opt/plexmediaserver
        		fi
        		read -p "desea comprobar que esta activo el servicio" activo
        		if [ $activo -eq "1" ];then
        			ruta9=`sudo service plexmediaserver status | grep -E "active"`
       				echo $ruta9
        		fi
		fi
	else
		echo "Ya existe"
		exit
	fi
fi
fi
if [ $eleccion -eq 2 ];then
sudo service plexmediaserver status
fi
if [ $eleccion -eq 3 ];then
sudo apt-get --purge remove plexmediaserver
fi


done
