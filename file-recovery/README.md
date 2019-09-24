# File Recovery
Points: 300

## Category
Forensics

## Question
>Uh oh! Lillian has accidentally deleted everything on her flash drive! Here's an image of the drive; find the PNG and get the flag. 

### Hint
>Although the file entry is gone from the filesystem, its contents are still on disk.
>If only there were tools to find file signatures...

## Solution
Question states that Lilian has deleted everything in the file and we have to find a `png file` from the given iso.
Unzip `filerecovery.iso.gz` using `gzip -d filerecovery.iso.gz`.

I solved this question using `Autopsy` on Windows.
Open `filerecovery.iso` with `Autopsy`.
Go to `Views` > `Deleted Files` > `File System` and you will find a file aptly named `flag.png`.
Extract it out and open the file then you will see the flag.

### Flag
`nactf{f1l3_r3c0v3ry_15_c0ol}`
