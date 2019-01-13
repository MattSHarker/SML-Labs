This program provides four functions in SML with the intent of creating lists of prime numbers.

fun makeLst (n)
    Takes in an int.
    Provides a list of all integers from 1 to n.

fun removeMult (lst, n)
    Takes in a tuple of a list and an int.
    Removes any number from list which is a multiple of n.

fun sieve (lst)
    Takes in a list.
    Removes any number that is not prime from lst.

fun primes (n)
    Takes in an int.
    Creates a list of primes which are smaller than or equal to n.

This program is written in SML/NJ, which will be needed to run the program.
To run the program, open command prompt and type SML. (To exit, press CTRL-D, or CTRL-Z in Windows).
Enter "use" followed by the name of the file, including the file path in quotes.
Use two backslashes whenever one is typically needed and end the line with a semi-colon.
Example: use "c:\\Users\UserName\\Desktop\\primes.sml";
