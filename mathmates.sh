#!/bin/bash

while true; do

    echo "\nEnter primary multiple ( type 'exit' to quit )" 
    read pInput

    if [ "$pInput" = "exit" ]; then 
        echo "Exiting Program"
        break
    fi

    echo "You entered primary multiple: $pInput" 

    echo "\nEnter the secondary multiple ( type 'exit' to quit )" 
    read sinput

    echo "You entered secondary multiple: $sinput" 

    if [ "$sinput" = "exit" ]; then 
        echo "Exiting program..."
        break
    fi

done