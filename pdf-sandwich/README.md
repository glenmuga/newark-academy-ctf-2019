# Kellen's PDF sandwich
Points: 150

## Category
Forensics

## Question
>Kellen was playing some more World of Tanks....
>He played so much WOT that he worked up an appetite.

>Kellen ripped a PDF in half. He then treated these two halves as bread and placed a different PDF on the inside (yummy PDF meat!). >That sounds like one good PDF sandwich. PDF on the outside and inside! YUM! 

### Hint
>You are going to have to find a way to remove the PDF from inside the other PDF file.

## Solution
We are given a file called `MeltedFile.pdf`. Open it and you will find `nacntf{w3_l0lcv_r d`

For this challenge, we can use tool called `foremost` based on this [recommendation](https://trailofbits.github.io/ctf/forensics/).
Use command `foremost MeltedFile.pdf`. It will create a file called `output`. Explore it and you will find a `.pdf` file inside it. Opening it will give you the 2nd part of the flag `_0f_t4nk5ejwjfae}`.

Combine both and you will get `nacntf{w3_l0lcv_r d_0f_t4nk5ejwjfae}`.
We can tell right away that the flag is in the incorrect format as it is nonsensical. Honestly, it took it a bit of guessing to get the actual flag. The question states that Kellen loves to play World of Tanks and the flag partially mentions `{w3_..._0f_t4nk`, so it's safe to assume it means `we love world of tanks`.

### Flag
`nactf{w3_l0v3_w0rld_0f_t4nk5ejwjfae}`
