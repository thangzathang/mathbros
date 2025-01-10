# 1. feat/randomMultiples

So far the program will run a consecutive order of the array. If secondary multiple is 4, the array is [1, 2, 3, 4]. I would like to randomize it so that user is prompted randomly.

Something like: "What is 2x4?" Then "What is 2x1", "What is 2x3" etc.

I used the Fisher-Yates shuffle algorithm.

Here is the algo code in bash:

```markdown
# Array length is 4, as user inputs secondary multiple of 4.

# Initial array is [1, 2, 3, 4]

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
        j=$((RANDOM % (i+1))) # j = 2 (make up), as the modulo operation will return value between 0 and 3 (i+1)
        temp=${array[i]} # temp = 4, as array[3] = 4
        array[i]=${array[j]} # array[3] = array[2] = 3, thus array is now [1, 2, 3, 3]
        array[j]=$temp # array[2] = 4, thus array is now [1, 2, 4, 3]
    done

    printf "%s\n" "${array[@]}"
}
```

Second iteration of the shuffle:

```
# Shuffle Function
# After first iteration, array is [1, 2, 4, 3]

shuffle() {
    local array=("$@")
    local i j temp

    for ((i=${#array[@]}-1; i>0; i--)); do # i = 2 as array length is 3-1 = 2
        j=$((RANDOM % (i+1))) # j = 1 (make up), as the modulo operation will return value between 0 and 2 (i+1)
        temp=${array[i]} # temp = 4, as array[2] = 4
        array[i]=${array[j]} # array[2] = array[1] = 2, thus array is now [1, 2, 2, 3]
        array[j]=$temp # array[1] = 4, thus array is now [1, 4, 2, 3]
    done

    printf "%s\n" "${array[@]}"
}
```

Third iteration of the shuffle:

```
# Shuffle Function
# After second iteration, array is [1, 4, 2, 3]
shuffle() {
    local array=("$@")
    local i j temp
    for ((i=${#array[@]}-1; i>0; i--)); do # i = 1 as array length is 2-1 = 1
        j=$((RANDOM % (i+1))) # j can be 0 or 1, as the modulo operation will return value between 0 and 1 (i+1)
        temp=${array[i]} # temp = 4, as array[1] = 4
        array[i]=${array[j]} # array[1] = array[0] = 1, thus array is now [1, 1, 2, 3]
        array[j]=$temp # array[0] = 4, thus array is now [4, 1, 2, 3]
    done
    printf "%s\n" "${array[@]}"
}
```

Final array state after all iterations: [4, 1, 2, 3]

Note: In real execution, j values would be random in each iteration, leading to different possible permutations of the array.
