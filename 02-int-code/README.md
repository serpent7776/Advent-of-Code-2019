# AoC #2

## Part 1 solution in awk

Just run `./aoc2.sh` in your terminal. This expects `input` file to exist in your current directory.

The first step is to split input on comma to be easier processed by awk.
Awk reads all the intcode instructions into an array and then iterates through the array executing instructions. After executing instruction 99 awk exits and print value at first memory cell.

## Part 2 solution

This part was solved with no code written.
First thing to notice is that all we have is either an addition or multiplication, so it should be possible to convert intcode to some real machine instructions and execute them.  I choose C as a target, because it's fairly simple language to generate and C compilers are amazing at optimizing.
This is where **vim** kicks in. Using some macros and normal mode editing I converted intcode instructions into C expressions manipulating an array of values. It looked like this:

```C
int fun(int n, int k)
{
	int v[121];
	// initialise values
	v[0] = 1;
	v[1] = 0;
	v[2] = 0;
	v[3] = 3;
	v[4] = 1;
	v[5] = 1;
	// ...
	// do calculations
	v[3] = v[0] + v[0];
	v[3] = v[1] + v[2];
	v[3] = v[3] + v[4];
	v[3] = v[5] + v[0];
	v[19] = v[10] * v[1];
	v[23] = v[9] * v[19];
	v[27] = v[13] * v[23];
	// ...
	v[103] = v[5] + v[99];
	v[107] = v[6] + v[103];
	v[111] = v[107] + v[2];
	v[0] = v[111] + v[5];
	return v[0];
}
```

But we're looking for values at memory locations `v[1]` and `v[2]`, so these values cannot be given. I changed these values to parameters `n` and `k`.

```C
	v[1] = n;
	v[2] = k;
```

Then, being to lazy to compile the code myself, I pasted it to **compiler explorer** and it outputted this beautifully optimised asm:

```asm
	imul    eax, edi, 120
	or      eax, 4
	imul    eax, eax, 2000
	lea     eax, [rsi + rax]
	add     eax, 2694
```

`eax` is where function return value lives, so after executing this asm instructions it will contain the value that we know as input. `edi` and `rsi` are our input parameters that we need to calculate.
So all we need to do is to reverse the operations.
Easy, right?
