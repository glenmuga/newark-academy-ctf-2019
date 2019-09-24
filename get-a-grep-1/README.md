# Get a GREP #1
Points 125

## Category 
General Skills

## Question
>Juliet hid a flag among 100,000 dummy ones so I don't know which one is real! But maybe the format of her flag is predictable? I know sometimes people add random characters to the end of flags... I think she put 7 random vowels at the end of hers. Can you get a GREP on this flag?

### Hint
>Look up regular expressions (regex) and the regex option in grep!

## Solution
For this challenge, the question states that 7 random vowels are place at the end and the hint already tells us to use regex. Thus, to use regex with grep, use the `-E` flag.

Use command `grep -E [AEIOUaeiou]{7} flag.txt` and you will be shown the flag.

### Flag
`nactf{r3gul4r_3xpr3ss10ns_ar3_m0r3_th4n_r3gul4r_euaiooa}`
