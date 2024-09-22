#Script para restringir el acceso a un cierto numero de rango 

echo "Ingresa la IP inicial a del rango a restringir"
read ip_inicial
echo "Ingresa la IP final a del rango a  restringir"
read ip_final

iptables -A INPUT -p tcp --dport 22 -m iprange --src-range $ip_inicial-$ip_final -j DROP
echo "Maquinas restringidas exitosamente"