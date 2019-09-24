# Unzip Me
Points: 150

## Category
Forensics
## Question
>I stole these files off of The20thDucks' computer, but it seems he was smart enough to put a password on them. Can you unzip them for me?

### Hint
>There are many tools that can crack zip files for you.

>All the passwords are real words and all lowercase.

## Solution
We are given 3 zip file called zip1.zip, zip2.zip and zip3.zip. If you try to unzip it then you will be prompted for a password. 

The 1st hint tell us that are many tools to crack zip files. Therefore, they suggest we have to brute force the password.

I used `johntheripper` for this challenge

#### Step 1: Get password hash
`zip2john zip1.zip > zip1.hash`

#### Step 2: Crack hash
`john --wordlist=/usr/share/wordlists/rockyou.txt pass.hash`

Repeat for the other 2 zip files. 

The flag is split between the 3 zip files. 

### Flag
`nactf{w0w_y0u_unz1pp3d_m3}`
