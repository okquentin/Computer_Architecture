#include <iostream>

int function(int a0, int a1){ 
    // Initalizing temporary variables (counter and t3)
    int t2 = 0;
    int t3 = a1;

    // Condition will fail when a0 < t3, allowing the counter to be returned
    while(a0>=t3){ 
        t2++;
        t3 = t3+a1; 
    }
    return t2;
}

int main(){
    int a = 24; // Initalizing variable to pass into a0
    int b = 3; // Initalizing variable to pass into a1
    int result = function(a, b); // Function call, a0, a1 initalized here
    std::cout << result;
}

