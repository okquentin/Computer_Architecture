#include <stdio.h>

int wxmodn(int a0, int a1){
    int temp = 0;
    int t1 = 0;
    while(temp!=1){
        t1++;
        temp = a0*t1;
        while(temp >= a1){
            temp = temp - a1;
        }
    }
    return t1;
}

int main(){
    int w = 3;
    int n = 13;
    int x = wxmodn(w, n);
    printf("%d", x);
}