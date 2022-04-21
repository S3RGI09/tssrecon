echo "Bienvenido al asistente de instalacion de Cracker, vamos a empezar por instalar los programas."
sudo apt install gobuster whatweb nmap
sudo rpm -i gobuster whatweb nmap
sudo pacman -i gobuster whatweb nmap
sudo brew install gobuster whatweb nmap
echo "ahora vamos a darle permisos de ejecucion al script, esto SOLO FUNCIONA EN SISTEMAS UNIX-LIKE"
chmod +x tssrecon.sh
echo "Ahora solo pon en tu consola "./tssrecon.sh" ya tienes el script listo"
echo "Gracias por instalar TSSrecon, ahora vamos a borrar este instalador"
rm instalacion.sh
