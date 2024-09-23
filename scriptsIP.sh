#Compilacion de script para el manejo de acceso y denegacion a maquinas por direccion IP y MAC
while true
	do
	echo ""
	echo "1.- Denegar ping remoto por IP"
	echo "2.- Permitir ping remoto por IP"
	echo "3.- Denegar puerto 22 por IP"
	echo "4.- Pemritir puerto 22 por IP"
	echo "5.- Denegar puerto 22 en un rango IP"
	echo "6.- Permitir puerto 22 en un rango de IP"
	echo "7.- Denegar puerto 22  por direccion MAC"
	echo "8.- Permitir puerto 22 por direccion MAC"
	echo "9.- Mostrar el estado de las reglas"
	echo "10.- Salir del programa"
	echo "----- Selecciona alguna opcion -----"
	read opcion
	if [ $opcion -eq 0 ] || [ $opcion -gt 10 ]
		then
		echo "Operacion Invalida"
		exit 1
	fi
	case $opcion in
	1)
	echo "Ingrese la IP a denegar ping remoto"
	read ip_den
	sudo iptables -A INPUT -p icmp -s $ip_den -j DROP
	echo "Operacion Completada"
	;;
	2)
	echo "Ingrese la IP a permitir ping remoto"
	read ip_per
	sudo iptables -D INPUT -p icmp -s $ip_per -j DROP
	echo "Operacion Completada"
	;;
	3)
	echo "Ingrese la IP a denegar el acceso por puerto 22"
	read ip_den
	sudo iptables -A INPUT -p tcp -s $ip_den --dport 22 -j DROP
	echo "Operacion Completada"
	;;
	4)
	echo "Ingresa la IP a permitir el acceso por puerto 22"
	read ip_per
	sudo iptables -D INPUT -p tcp -s $ip_per --dport 22 -j DROP
	echo "Operacion Completada"
	;;
	5)
	echo "Ingresa la IP inicial a del rango a restringir"
	read ip_inicial
	echo "Ingresa la IP final a del rango a  restringir"
	read ip_final
	sudo iptables -A INPUT -p tcp --dport 22 -m iprange --src-range $ip_inicial-$ip_final -j DROP
	echo "Operacion Completada"
	;;
	6)
	echo "Ingresa la IP inicial a del rango a permitir acceso"
	read ip_inicial
	echo "Ingresa la IP final a del rango a  permitir acceso"
	read ip_final
	sudo iptables -D INPUT -p tcp --dport 22 -m iprange --src-range $ip_inicial-$ip_final -j DROP
	echo "Operacion Completada"
	;;
	7)
	echo "Localiza e ingresa la dirección MAC a restringir"
	read dir_mac
	sudo iptables -A INPUT -p tcp --dport 22 -m mac --mac-source $dir_mac -j DROP
	echo"Operacion Completada"
	;;
	8)
	echo "Localiza e ingresa la direccion MAC a permitir"
	read dir_mac
	sudo iptables -D INPUT -p tcp --dport 22 -m mac --mac-source $dir_mac -j DROP
	echo "Operacion Completada"
	;;
	9)
	sudo /sbin/iptables -nL
	;;
	10)
	exit 1
	;;
	esac
done
