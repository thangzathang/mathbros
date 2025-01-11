#!/bin/bash

## Functions
# Check for quit keyword func
check_quit() {
    local input=$1
    if [[ "$input" = "exit" || "$input" = "q" ]]; then 
        echo "Exiting program..."
        exit 0
    fi
}

# Shuffle Function
shuffle() {
    local size=${#secondaryMultiples[@]}
    for ((i=$size-1; i>0; i--)); do
        j=$((RANDOM % (i+1)))
        temp=${secondaryMultiples[i]}
        secondaryMultiples[i]=${secondaryMultiples[j]}
        secondaryMultiples[j]=$temp
    done
}

while true; do
    # Get primary input
    echo -e "\nEnter primary multiple (type 'exit' to quit)"
    read pInput
    check_quit "$pInput"
    echo "You entered primary multiple: $pInput"

    # Get secondary input
    echo -e "\nEnter the secondary multiple (type 'exit' to quit)"
    read sInput
    check_quit "$sInput"
    echo "You entered secondary multiple: $sInput"

    # Declare empty array for a randomized set of multiples
    declare -a secondaryMultiples=()

    for ((i=1; i<=$sInput; i++)); do
        secondaryMultiples+=($i)
    done

    echo "Original Array: ${secondaryMultiples[@]}"
    
    # Shuffle the array
    shuffle
    echo "Shuffled Array: ${secondaryMultiples[@]}"

    for i in "${secondaryMultiples[@]}"; do
        question="$pInput x $i"
        echo "What is $question?"
        read ansInput
        check_quit "$ansInput"

        correctAns=$(($pInput*$i))
        if [ "$ansInput" -eq "$correctAns" ]; then
            echo "Correct! The answer to $question is $correctAns."
        else 
            echo "Wrong! It is not $ansInput. The answer to $question is $correctAns."
        fi
    done
done