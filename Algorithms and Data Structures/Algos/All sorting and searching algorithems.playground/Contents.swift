//: Playground - noun: a place where people can play


// All algorithems
// 1. quicksort
// 2. mergeSort
// 3. selectionSort
// 4. bubbleSort

// QUICK SORT

/* Algorithem
 
 quick sort algo
 1. Take a pivot element usually at the end of array.
 2. Take a pIndex starting element of an array.
 3. check if A[i] <= pivot.
 4. if yes then swap A[i] with A[pIndex] and increment pIndex by 1.
 5  else just leave it.
 6. run steps 3,4,5 from start to end - 1.
 7. swap A[pIndex] with A[end] at the end of program.
 8. partition the program into two and repeat the steps untill start < end.
 
 */

func quickSort(Array:[Int],start:Int,end:Int) -> [Int]{
    var A = Array
    guard start < end else{return A}
    
    let pivot = A[end]
    var pIndex = start
    var swaped = 0
        
    print(A)
    print("start \(start) , pIndex :\(pIndex) , end: \(end) , endElement \(A[end]) , pivot : \(pivot) \n ++++++++")
    
    for i in start...(end - 1){
        if A[i] <= pivot{
            A = swap(A,i,pIndex)
            swaped += 1
            print("swap \(swaped) :-  \(A[i])  with  \(A[pIndex])")
            pIndex += 1
        }
    }
    
    A = swap(A,pIndex,end)

    print("\n \(A)")
    print("start \(start) , pIndex :\(pIndex) , end: \(end) , endElement \(A[end]) , pivot : \(pivot) \n \n \n ===========")
    
    A = quickSort(Array: A, start: start, end: pIndex - 1)
    A = quickSort(Array: A, start: pIndex + 1, end: end)
    
    return A
}


func swap(_ Array:[Int],_ A:Int,_ B:Int)->[Int]{
    var Array = Array
    if A == B {return Array}
    let temp = Array[A]
    Array[A] = Array[B]
    Array[B] = temp
    return Array
}

/* ++++++++++++++MERGE SORT ++++++++++++
 
 psudo code
 
 mergeSort(Array)-> Array{
 
1. length = array.count - 1 // find length of array
 
2. guard length > 0 else{return a} // compare if lenght is greater then 0
 
3. mid = lenght/2 // find mid
 
4. leftArray = Array[0...mid] // divide array into left and right
 
5. rightArray = Array[mid+1 ... length] // right array
 
6. let sortedLeft = mergeSort(leftArray)

7. let sortedRight = mergeSort(rightArray) call recursive sort on left and right
 
8. A = merge(left , right , newArray) merger left and right into new array
 
9. return sorted Array
 }
 
 merge(left,right,Array){
 
 1. leftlenght = left.count // find count of lenght ... if u intend to use <= operator then find left.count - 1 lenght else simply us it
 
 2. rightLenght = right.count  // smilarly
 
 3. var A = Array
 
 4. i,j,k = 0
 
 5. while (i < leftLength && j < rightLenght){
 
 if left[i] <= right[j]{ // compare values
    A[k] = left[i] // put in A which ever is lowest and move that array count
    i++
 }else{
    A[k] = right[j]
    j++
 }
 
 k++
 }
 
 6. while (i< leftLenght){
    A[k] = left[i]  // add all left over cases
    i++
    k++
 }
 
 7. while (j < rightLenght){
    A[k] = right[j]
    j++
    k++
 }
 
    return A
 }
 
 */


// merger sort

func mergeSort(A:[Int])->[Int]{
    let len = A.count - 1
    
    guard len > 0 else{return A}
    
    let mid = len/2
    let leftArray = Array(A[0...mid])
    let rightArray = Array(A[(mid+1)...len])
    
    let sortedLeft = mergeSort(A:leftArray)
    let sortedRight = mergeSort(A: rightArray)
    
    let sortedArray = merge(left:sortedLeft,right:sortedRight,Array: A)
    
    return sortedArray
}

func merge(left:[Int],right:[Int],Array:[Int])->[Int]{
    var A = Array
    let leftCount = left.count
    let rightCount = right.count
    var i=0,j=0,k=0
    
    while(i < leftCount && j < rightCount){
        
        if left[i] <= right[j]{
            A[k] = left[i]
            i += 1
        }else{
            A[k] = right[j]
            j += 1
        }
        
        k += 1
    }
    
    while(i < leftCount){
        A[k] = left[i]
        k += 1
        i += 1
    }
    
    while(j < rightCount){
        A[k] = right[j]
        k += 1
        j += 1
    }
    
    return A
}

/* selectionSort
Algo

1.set min location to 0

2. search minimum element in array
 
3. swap with value of location min.
 
4. increment min point to next elements
 
5. repeat until list is sorted
 

 psuedo code
 
 selectionSort(Array){
 
 var minLocation = 0
 let length = Array.count - 1
 
 guard lenght > 0 else {return A}
 
 let MinIndex = findMin(Array)
 
 swap(minIndex,minlocation,Array)
 
 Array = Array[minlocation + 1 ... lenght]
 
 selectionSort(array)
 
 return Array
 }

 */

func selectionSort(Array:[Int])->[Int]{
    var A = Array
    let len = A.count - 1
    var minIndex = 0
    
    for i in 0 ... (len - 1){
        minIndex = i
        for j in (i+1)...len{
            if A[j] < A[minIndex]{
                   minIndex = j
                let temp = A[j]
                A[j] = A[minIndex]
                A[minIndex] = temp
            }
        }
    }
    
   return A
}

/* BubbleSort
 
 pesudoCode

 func bubbleSort(A,n){
 
    for k <- 1 to n-1 { // these are called passes and it will be from zero to n-1
 
        for i <- 0 to n-2 {
            if A[i] > A[i+1]{
                swap(A[i],A[i+1])
            }
        }
    }
 
 }
 
*/

func bubbleSort(Array:[Int])->[Int]{
    var A = Array
    let len = A.count-1
    
    for _ in 0...len{
        for j in 0...(len-1){
            if A[j] > A[j+1]{
                let temp = A[j]
                A[j] = A[j+1]
                A[j+1] = temp
            }
        }
    }
    return A
}

func bubbleSort2(Array:[Int])->[Int]{
    var A = Array
    let len = A.count-1
    
    for i in 0...len-1{
        for j in (i+1)...(len){
            if A[i] > A[j]{
                let temp = A[j]
                A[j] = A[j+1]
                A[j+1] = temp
            }
        }
    }
    return A
}

var array = [11,10,9,8,7,6,5,4,3,2,1,0]
array = quickSort(Array: array, start: 0, end: array.count - 1)
let mergeSortedArray = mergeSort(A: array)
let selectionSortedArray = selectionSort(Array: array)
let bubbleSortedArray = bubbleSort(Array: array)
print(array)
print(mergeSortedArray)
print(selectionSortedArray)
print(bubbleSortedArray)

// quicksort function
// quicksort function for posting on medium
func quickSort2(array:[Int],start:Int,end:Int) -> [Int]{
    var a = array
    // baseCondition :- check if start index is less than end index
    guard start < end else{return a}
    
    let pivot = a[end] // find the pivot
    var startIndex = start // put start index
    
    for i in start...(end - 1){
        // check if value is less or equal to pivot
        if a[i] <= pivot{
            // swap the values
            a = quickSwap(array:a, index1: i, index2: startIndex)
            startIndex += 1
        }
    }
    // swap the value of pivot
    a = quickSwap(array:a ,index1: startIndex, index2: end)
    
    
    // run recursive call for array divided into two parts from pivot    point
    a = quickSort2(array: a, start: start, end: startIndex - 1)
    a = quickSort2(array: a, start: startIndex+1, end: end)
    return a
}

func quickSwap(array:[Int], index1: Int , index2:Int)->[Int]{
    var a = array
    if index1 == index2 {return a}
    let temp = a[index1]
    a[index1] = a[index2]
    a[index2] = temp
    return a
}

let array2 = [123,2,23,4,12,14,86,546,7,68,35,33,464,13,5,63,79,3,2,57,9,0,65,4]
let sortedArray = quickSort2(array: array2, start: 0, end: array2.count - 1)
print(sortedArray)
