# The problem with really big numbers

So I'm working on a project where I'm gonna need to test wether a number is prime or not. Sounds simple right? Except for the fact that the numbers in question can be thousands or millions of bits long. This is the problem of discovering new Mersene Primes (ADD LINK), a group of prime numbers that are all defined as $2^n - 1$, where $n$ is yet another prime number. Their existance is a really cool fact of mathematics, and has allowed us to find the largest primes yet, by helpfully narrowing down the search field quite a bit. A mersene number isn't guarenteed to be a prime, but for a given size they're much more likely to be than most other basic filtration methods would give (as it includes most of them built-in, like removing the possibility for obvious factors by having n be prime).

Anyway, my problem is - How do you test if a number is prime or not, using circuitry that can't even hold the entire number at once? This is a really nice challenge for computational digital logic design, that I've decided to take on. I'll be looking at some of the literature from GIMPS(ADD LINK), the Great-Internet-Mersene-Prime-Search, which has so far broken the record multiple times for the largest primes discovered, by having the computation be spread around many computers around the world, donating their CPU cycles for the good of humanity. 

The first problem I have to tackle is how to check if two numbers are co-prime, if they can be of arbitrary length? This in-and-of-itself will provide most of the cleverness I need to solve this thing, but I want to make it time-efficient as well, which makes the job considerably more difficult.