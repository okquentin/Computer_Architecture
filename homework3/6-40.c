#include <stdio.h>
#include <stdlib.h>
// #define DEBUG

void concat(char string1[], char string2[], char stringconcat[]){
    // Initalize counter variables
    int i = 0;
    int j = 0;

    // Fill each element of the combined array with the first string until a null character is reached
    while(string1[i] != '\0'){
        stringconcat[i] = string1[i];
        i++;
    }
    // Fill the rest of the combined array with the content of string 2 until null character is reached
    while(string2[j] != '\0'){
        stringconcat[i] = string2[j];
        i++;
        j++;
    }
}

int main(){
    char stringA[] = "Hello";
    char stringB[] = "World";
    char* stringC;

    // The size of the combined string should be the size of both strings -1
    // this is because each string has a null terminator, and only one is needed
    unsigned long combinedSize = sizeof(stringA) + sizeof(stringB) -1;


    stringC = malloc(combinedSize); // Allocating memory for the combined string

    concat(stringA, stringB, stringC); // Function call
    printf("%s", stringC); // Printing the combined string

    #ifdef DEBUG
    printf("String A: %lu \n", sizeof(stringA));
    printf("String B %lu \n", sizeof(stringB));
    printf("String C %lu \n", combinedSize);
    #endif
}