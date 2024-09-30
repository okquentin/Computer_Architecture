#include <stdio.h>
#include <math.h>

int sumn(int n){
    if(n==0){
        return 0;
    }
    return (pow(n,2) + sumn(n-1)); 
}


int main(){
    int result = sumn(5);
    printf("%d", result);
    return 0;
}