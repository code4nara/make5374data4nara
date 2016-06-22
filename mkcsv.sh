#!/bin/bash
####
#   For make 5374.jp data/arealist for Nara-Shi
#	5374: see 5374.jp
####
echo
echo "  This is the script For make 5374.jp data/arealist for Nara-Shi"
echo

OUTFILE="area_days_NEW.csv"

########	Include Files
####
#  Area list 
#	CSV Format: AreaName,AlphaCode(A-G),Numeric(1-20)
AREAFILE="0arealist.csv"
####
#  Alphabet Code (from A to G)
#	CSV Format: AlphaCode(A-G),Center,Moeru,Moenai,Plastic
CODEFILE="0codelist.csv"
####
#  Numric Code 
#	CSV Format: Numeric(1-20),Shigen-Gomi
CNUMFILE="0cnumlist.csv"


########	Define
#   Like Hash Array
declare -A alphacode
declare -A numcode

########	Raed AplhaCode
IFS=$'\n'
file=(`cat "${CODEFILE}"`)
IFS=$' '

echo "  - Parsing ${CODEFILE}"

for line in "${file[@]}"; do
    if [[ $line == "" || $line =~ ^# ]]; then
      continue
    fi

    ACODE_KEY=`echo ${line} | awk -F, '{print $1}'`
    ACODE_VALUE=`echo ${line} | sed s/^[A-Z],// `

    alphacode[${ACODE_KEY}]="${ACODE_VALUE}"

    echo ${ACODE_KEY} : ${alphacode["${ACODE_KEY}"]}
done

echo "  - Finished"

echo ${CNUMFILE}

########	Raed NumricCode
IFS=$'\n'
file=(`cat ${CNUMFILE}`)
IFS=$' '

echo "  - Parsing ${CNUMFILE}"

for line in "${file[@]}"; do
    if [[ $line == "" || $line =~ ^# ]]; then
      continue
    fi

    NCODE_KEY=`echo ${line} | awk -F, '{print $1}'`
    NCODE_VALUE=`echo ${line} | sed s/^[0-9]*,// `

    numcode[${NCODE_KEY}]=${NCODE_VALUE}

   echo ${NCODE_KEY} : ${numcode[${NCODE_KEY}]}
done

echo "  - Finished"

echo ${OUTFILE}
echo '地名,センター,燃やせるごみ,燃やせないごみ,プラスチック製容器包装,再生資源ゴミ' > ${OUTFILE}


########	Make 5374 Data
#   read Arealist 
IFS=$'\n'
file=(`cat "${AREAFILE}"`)
IFS=$' '

echo "  - Raeding ${AREAFILE}"

ln=0
for line in "${file[@]}"; do
    if [[ $line == "" || $line =~ ^# ]]; then
      continue
    fi

    echo "  - - $line"

    ln=`expr $ln + 1`

    AREA=`echo ${line} | awk -F, '{print $1}'`
    ACODE=`echo ${line} | awk -F, '{print $2}'`
    NCODE=`echo ${line} | awk -F, '{print $3}'`

    if [[ $ACODE == "X" || $ACODE == "Z" ]]; then
        contine
    fi

    echo ${AREA},${alphacode["${ACODE}"]},${numcode[${NCODE}]} 20991231 >> ${OUTFILE}
    echo ${AREA},${alphacode["${ACODE}"]},${numcode[${NCODE}]} 20991231 
done

# Blink Line
echo "" >> ${OUTFILE}

####
echo "Make $ln Lines in ${OUTFILE}"
exit
