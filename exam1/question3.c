#include <stdio.h>

int func(int a0, int a1){ // a0 = a, a1 = b
    while(a0>=a1){ // Will fail (and thus return a) once a < b
        a0=a0-a1; // Subtract b from a and store the result in a
    }
    return a0; // Return a once a < b
}

int main(){
    int a = 15;
    int b = 4;
    int c = func(a, b);
    printf("%d", c);
    return 0;
}