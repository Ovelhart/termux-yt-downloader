clear

 ARQUIVO_CORES="$HOME/.termux/colors.properties"
HEX_COLOR="#FF2020"

if [ -f "$ARQUIVO_CORES" ]; then
    LINHA_COR=$(grep -E '^color1' "$ARQUIVO_CORES" | tr -d '[:space:]')
    if [ ! -z "$LINHA_COR" ]; then
        HEX_RAW=$(echo "$LINHA_COR" | sed -E 's/color1[:=]//g' | tr -d '#')
        if [ ${#HEX_RAW} -eq 6 ]; then
            HEX_COLOR="#$HEX_RAW"
        fi
    fi
fi

# Converte o Hexadecimal capturado para o formato RGB do terminal
HEX_LIMPO=$(echo "$HEX_COLOR" | tr -d '#')
R=$(printf "%d" "0x${HEX_LIMPO:0:2}")
G=$(printf "%d" "0x${HEX_LIMPO:2:2}")
B=$(printf "%d" "0x${HEX_LIMPO:4:2}")

COR_DINAMICA="\e[38;2;${R};${G};${B}m"
SEM_COR="\e[0m"

read -r -d '' ASCII << 'EOF'
   ###################################   
 ######################################  
 ####################################### 
#########################################
#########################################
#################   #####################
#################      ##################
#################         ###############
#################      ##################
#################   #####################
#########################################
#########################################
 ####################################### 
 ####################################### 
   ###################################   
EOF


COLS=$(tput cols)

echo "$ASCII" | while IFS= read -r linha; do
    TAM_LINHA=${#linha}
    
    if [ $COLS -gt $TAM_LINHA ]; then
        ESPACOS=$(( (COLS - TAM_LINHA) / 2 ))
        printf "%${ESPACOS}s${COR_DINAMICA}%s${SEM_COR}\n" "" "$linha"
    else
        printf "${COR_DINAMICA}%s${SEM_COR}\n" "$linha"
    fi
done
