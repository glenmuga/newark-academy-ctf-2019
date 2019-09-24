# SHCALC
Points: 200

## Category
General Skills

## Question
>John's written a handy calculator app - in bash! Too bad it's not that secure... 
Connect at nc shell.2019.nactf.com 31214


### Hint
>Heard of injection?

## Solution
We can use backtick (`) to force it to evaluate any commands in it. Use it in the calculator.
```bash
`ls`
`cat flag.txt`
```

### Flag
`nactf{3v4l_1s_3v1l_dCf80yOo}`
