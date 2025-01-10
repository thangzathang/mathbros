# 1. feat/randomMultiples

So far the program will run a consecutive order of the array. If secondary multiple is 4, the array is [1, 2, 3, 4]. I would like to randomize it so that user is prompted randomly.

Something like: "What is 2x4?" Then "What is 2x1", "What is 2x3" etc.

I used the Fisher-Yates shuffle algorithm.

Here is the algo code in bash:

```
shuffle() {
    local array=("$@")
    local i j temp
    for ((i=${#array[@]}-1; i>0; i--)); do
        j=$((RANDOM % (i+1)))
        temp=${array[i]}
        array[i]=${array[j]}
        array[j]=$temp
    done
    printf "%s\n" "${array[@]}"
}
```

Let's deep dive into this, code by code, line by line.

First iteration of the shuffle:

```
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
```

Second iteration of the shuffle:
