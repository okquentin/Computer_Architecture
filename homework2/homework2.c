// Write a function in a high-level language 
// for int find42(int array[], int size). 

// size specifies the number of elements in array
// array[] specifies the base address of the array 

// The function should return the index number of the 
// first array entry that holds the value 42. 
// If no array entry is 42, it should return the value –1. 

main(){
    int size = 5;
    int array[size];
    int return_val = find42(array, size);
    printf("%d\n", return_val);
}

int find42(int array[], int size){
    for(int i=0; i<size;i++){ // Incrementing array index to search for element
        if(array[i]==42){ // Comparing value of array element to 42
            return i; // If an element is found to equal 42, return index of element
        }
    }
    return -1; // If search is complete and no such element is found, return -1
}