for dir in */; do rar a -r "${dir%/}.rar" "$dir"; done --------> cria um diretório para cada arquivo .rar na pasta

rename s/S012/S12/ The_Big_Bang_Theo* -----> renomear apenas uma parte do nome e manter o resto (tanto início quanto fim)

wget -nc -r -l 1 -np -nH --cut-dirs=2 -e robots=off -R "index.html*" -i /root/lista - baixa primeiro diretório todo

wget -nc -r -l 1 -np -nH --cut-dirs=2 -e robots=off -R "index.html*" -i /root/links -P /drive02/PUBLICO-DRIVE02/TUDO/
