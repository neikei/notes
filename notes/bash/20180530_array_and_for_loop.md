### 2018-05-30: Array and for loop

THe following snippet shows a simple array initialization and a for loop over each element of the array.

```bash
#!/bin/bash
array=(a b c d e)
for char in ${array[@]}
do
    echo $char
done
```
