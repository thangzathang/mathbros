#!/bin/bash

# Check for quit keyword func
check_quit() {
    local input=$1
     if [[ "$input" = "exit" || "$input" = "q" ]]; then 
        echo "Exiting program..."
        exit 0
    fi
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

    # Added second loop for multiplication table
    for ((i=1; i<=$sInput; i++)); do
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