#!/bin/bash

echo "SCRIPT PARA CREAR USUARIOS"
echo "por favor ingrese el nombre: "

read nombre

if [ "$nombre" == "" ]; then
    echo "el nombre no puede estar vacio"
    exit 1
fi

#home del usuario
echo -e "\n"
echo "ingrese el home"
echo "(puede quedar vacio)"
echo ""/home/$nombre""
read home

if [ "$home" == "" ]; then
    home="/home/$nombre"
fi

echo "\n"
echo "ingrese el grupo"
echo "default: 1000"
read grupo

if [ "$grupo" == "" ]; then
    grupo=1000
fi

echo "Ingrese el shell a utilizar (default /bin/bash): "
read shell
# Si no ingreso ningún shell como por ejemplo un menu, dejo con el shell por defecto

if [ "$shell" == "" ] ; then
shell="/bin/bash"
fi

#mostrar datos ingresados por el usuario
echo "Los datos ingresados:"
echo -e "\n"
echo "Nombre del usuario: $nombre"
echo "Shell por defecto : $shell"
echo "Directorio home: $home"
echo "Grupo del usuario: $grupo"
read

useradd -d /home/$nombre -g $grupo -m -s $shell $nombre
# Si hay un error salgo del script

if [ "$?" != 0 ] ; then
echo -e "\n"
echo "Ha ocurrido un error, asegurese de que los datos ingresados son correctos."
exit 1
fi

# contraseña
echo -e "\n"
echo "Ingrese una contraseña para $nombre"
passwd $nombre
echo -e "\n"
echo "El usuario fue creado"
