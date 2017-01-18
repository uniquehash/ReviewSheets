# Charlies class 0

background and meta information

### fibonacci sequence


* naive approach
    ```
        function fib1(n)
        {
            if n = 0: return 0
            if n = 1: return 1
            return fib1(n - 1) + fib1(n - 2)
        }
    ```

* for above algorithm 
    * let T(n) be the number of computer steps
        * T(n) = 1 for n = 0
        * T(n) = 2 for n = 1

* less naive approach 
```
    function fib2(b)
    {
        if n = 0: return 0
            create an array f[0...n]
            f[0] = 0, f[1] = 1
        for i = 2...n: 
            f[i] = f[i - 1] + f[i - 2]
        return f[n]
    }