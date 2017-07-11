

**resolve header include circular dependencies**
-------------------------------------------------------------

[StackOverflow](https://stackoverflow.com/questions/625799/resolve-header-include-circular-dependencies)

So let's tell the compiler about B. This is known as a forward declaration, and is discussed further in this answer.

```
// main.cc
class B;
#include "A.h"
#include "B.h"
int main (...) {
  A a;
}
```

This works. It is not great. But at this point you should have an understanding of the circular reference problem and what we did to "fix" it, albeit the fix is bad.

The reason this fix is bad is because the next person to #include "A.h" will have to declare B before they can use it and will get a terrible #include error. So let's move the declaration into A.h itself.

```
// file: A.h
class B;
class A {
  B* _b; // or any of the other variants.
};
```

And in B.h, at this point, you can just #include "A.h" directly.

```
// file: B.h
#include "A.h"
class B {
  // note that this is cool because the compiler knows by this time
  // how much space A will need.
  A _a; 
}
```

