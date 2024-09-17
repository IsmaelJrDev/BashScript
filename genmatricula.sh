anio=$(date +%Y)
echo "Ingrese el periodo en el que ingreso"
echo "1.- (Febrero)   2.- (Admicion TESJI)"
read periodo
if [ $periodo -eq 0 ] || [ $periodo -gt 2 ]
	then
	echo "Operacion invalida"
	exit 1
fi
echo "----Catalogo---- "
echo "1.- Ing. Industrial"
echo "2.- Ing. TIC'S"
echo "3.- Ing. Sistemas Computacionales"
echo "4.- Ing. Mecatronica"
echo "5.- Ing. Quimica"
echo "6.- Lic. Administracion"
echo "7.- Ing. Civil"
echo "8.- Ing. Logistica"
echo "Ingrese carrera que ingresara"
read carrera
if [ $carrera -eq 0 ] || [ $carrera -gt 8 ]
	then
	echo "Operacion invalida"
	exit 1
fi
echo "Ingrese su numero de Alumno"
read alumno
if [ $alumno -eq 0 ] || [ $alumno -gt 999 ]
	then
	echo "Operacion invalida"
	echo "El numeor de alumno no pude ser mayor a 999"
	exit 1
fi
if [ $alumno -ge 1 ] && [ $alumno -le 10 ]
	then
	a="00$alumno"
	r=$anio$periodo$carrera$a
	echo "Su matricula es: $r"
	else if [ $alumno -ge 11 ] && [ $alumno -le 100 ]
		then
		a="0$alumno" 
		r=$anio$periodo$carrera$a
		echo "Su matricula es: $r"
		else if [ $alumno -ge 101 ] && [ $alumno -le 999 ]
			then
			echo "Su matricula es: $anio$periodo$carrera$alumno"
	fi
	fi
fi
