# Filesystem Image
Points: 200

## Category
Forensics

## Question
>Put the path to flag.txt together to get the flag! for example, if it was located at ab/cd/ef/gh/ij/flag.txt, your flag would be nactf{abcdefghij}

### Hint
>Check out loop devices on Linux

## Solution
We are given a gzip file called `fsimage.iso.gz`. Use `gzip -d fsimage.iso.gz` to unzip.

For this challenge, I could not personally mount the iso file. Instead I opened it in file system and open the file system in terminal.

The questions says to put the path together to flag.txt to form the flag. So we know that there is a flag.txt hidden inside. To find it we can use `grep -r .*` to find the location of the flag.txt.

Results show that is it stored in the following directory: `lq/wk/zo/py/hu/flag.txt`

### Flag
`nactf{lqwkzopyhu}`
