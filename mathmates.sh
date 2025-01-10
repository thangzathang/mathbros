#!/bin/bash

# Check for quit keyword func
check_quit() {
    local input=$1
     if [[ "$input" = "exit" || "$input" = "q" ]]; then 
        echo "Exiting program..."
        exit 0
    fi
}

# Array length is 4, as user inputs sec multiple of 4.
# Array is [1, 2, 3, 4]

# Shuffle Function
shuffle() {
    local array=("$@")
    local i j temp
    for ((i=${#array[@]}-1; i>0; i--)); do # i = 3 as array length is 4-1 = 3
        j=$((RANDOM % (i+1))) # j = 2 , as the modulo operation will return value less then 4, from i + 1 which is 3 + 1. 
        temp=${array[i]} # temp = 4, as array[3] = 4
        array[i]=${array[j]} # array[3] = array[2] thus array is now [1, 2, 3, 2]
        array[j]=$temp # array[2] = 4, thus array is now [1, 4, 3, 2]
    done
    printf "%s\n" "${array[@]}"
}

while true; do
    # Get primary input
    echo "\nEnter primary multiple ( type 'exit' to quit )" 
    read pInput
    check_quit "$pInput"
    echo "You entered primary multiple: $pInput" 

    # Get secondary input
    echo "\nEnter the secondary multiple ( type 'exit' to quit )" 
    read sInput
    check_quit "$sInput"
    echo "You entered secondary multiple: $sInput" 

    # Declare empty array for a randomized set of multiples
    declare -a secondaryMultiples

    for ((i=1; i<=$sInput; i++)); do
        secondaryMultiples+=(i)
        echo ${#secondaryMultiples[@]}
    done

    echo "Ready to randomise array"

    for ((i=1; i<=${#secondaryMultiples[@]}; i++)); do 
        question="$pInput x $i"
        echo "What is $question?"
        read ansInput

        correctAns=$(($pInput*$i))
        if [ $ansInput -eq $correctAns ]; then
            echo "Correct! The answer to $question is $correctAns."
        else 
            echo "Wrong! It is not $ansInput. The answer to $question, is $correctAns."
        fi
    done
done