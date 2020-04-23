//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

/* +++++++++++++++++++++++++++++++++++++++++++++++++++ NSURLConnection ++++++++++++++++++++++++++++++++++++++++++*/

// creating a URL to download
let url = NSURL(string: "https://api.nasa.gov/planetary/apod?api_key=DEMO_KEY")! as URL

// creating a URL request for NSURLConnection
let request = URLRequest(url: url)

do{
    // tring to run a reqquest
    let data = try? NSURLConnection.sendSynchronousRequest(request, returning: nil)
    
    // if no error thrown we create a json object with data we got in response
    let jsonSerialized = try JSONSerialization.jsonObject(with: data!, options: []) as? [String:Any]
    
    //extract the data from the json object
    if let json = jsonSerialized , let _ = json["url"], let _ = json["explanation"]{
    }
    
}catch{
    // here we catch the error
}


/* +++++++++++++++++++++++++++++++++++++++++++++++++++ URL SESSION ++++++++++++++++++++++++++++++++++++++++++*/


// URL for session url
let sessionUrl = URL(string: "https://api.nasa.gov/planetary/apod?api_key=DEMO_KEY")

// creating a task with URLSession singleton class
let task = URLSession.shared.dataTask(with: sessionUrl!) { (data, response, error) in
    
    // we check if any error exists
    if error != nil {
        print("Error has arised")
    }
    
    // in do we try to serialize the data with json serialzer
    do {
    let jsonSerilized = try JSONSerialization.jsonObject(with: data!, options: []) as? [String:Any]
    
    //extract the data from the json object
    if let json = jsonSerilized , let url = json["url"], let explanation = json["explanation"]{
        print("\n  \(url) \n \n \(explanation)")
        }
        
    }catch{
        
    }

    
}

// resume the past to download
task.resume()


// this need to be run for catching async responses
//RunLoop.main.run()

/* +++++++++++++++++++++++++++++++++++++++++++++++++++ Find sum of digits ++++++++++++++++++++++++++++++++++++++++++*/

// for finding the some of digits
func findSumOfDigit(num:Int){
    var sum = 0
    var number = num
    
    while(number != 0 ){
        sum += number % 10
        number = number/10
    }
    
    print("The sum of all digits of \(num) is \(sum)")
}

print("\nSum of digits")
findSumOfDigit(num: 9231310)

/* +++++++++++++++++++++++++++++++++++++++++++++++++++ Reverse a string++++++++++++++++++++++++++++++++++++++++++*/

// to reverse a string
func findReverseOfString(string:String) -> String{
    var reverse = ""
    for char in string{
        reverse = "\(char)" + reverse
    }

    print("\(reverse)")
    
    return reverse
}
print("\nReverse of string")
findReverseOfString(string: "Tarun kaushik")

/* +++++++++++++++++++++++++++++++++++++++++++++++++++ check palindrome ++++++++++++++++++++++++++++++++++++++++++*/

// to find if a string is a palindrome or not
func findPalindrome(string:String){
    
    if string.first != string.last{
        print("Not a palindrome and i am returning from Here")
        return
    }
    
    let reverseString = findReverseOfString(string: string)
    
    if reverseString == string{
        print("Its a palindrome")
    }else{
        print("Not a palindrome")
    }
}

print("\npalindrom")
findPalindrome(string: "madam")


func reverseNumber(num:Int){
    var num = num
    var reverseNum = 0
    
    while num != 0 {
        reverseNum = reverseNum * 10 + num%10
        num = num/10
    }
    
    print(reverseNum)
}

reverseNumber(num: 98123124)

/* +++++++++++++++++++++++++++++++++++++++++++++++++++ uniqueness of string ++++++++++++++++++++++++++++++++++++++++++*/

// finding if the array is unique
func findUniqueNess(string:String) -> Bool{
    var charSet:[Character:Bool] = [:]
    for val in string{
        guard charSet[val] == nil else{return false}
        charSet[val] = true
    }
    return true
}
print("\nUNIQUNESS")
findUniqueNess(string: "asdfghjkl")

/* +++++++++++++++++++++++++++++++++++++++++++++++++++ return unique string from given string ++++++++++++++++++++++++++++++++++++++++++*/

func uniqueString(string:String)-> String{
    var charSet:[Character:Bool] = [:]
    var uniqueString = ""
    
    for char in string{
        if charSet[char] == nil {
            uniqueString += "\(char)"
            charSet[char] = true
        }
    }
    
    return uniqueString
}

print(uniqueString(string: "aksnfaksnasaknafafonjkbuiergweiuhoaincbyryqowrpjqpfjvbzhbisdueonaciabviuthonq"))

/* +++++++++++++++++++++++++++++++++++++++++++ WAP to count the occurence of each charater in string+++++++++++++++++++++++++++++++++++++++++*/

func charaterCount(String:String){
    var charSet:[Character:Int] = [:]
    
    for char in String{
        if charSet[char] == nil{
            charSet[char] = 1
        }else{
            charSet[char] = 1 + charSet[char]!
        }
    }
    
    for (key,value) in charSet{
        print("\(key) is present in string for \(value) times")
    }
}

charaterCount(String: "aksnfaksnasaknafafonjkbuiergweiuhoaincbyryqowrpjqpfjvbzhbisdueonaciabviuthonq")


//WAP to introduce # after occurence of every 7 characters in the string


/* +++++++++++++++++++++++++++++++++++++++++++++++++++ find anagram ++++++++++++++++++++++++++++++++++++++++++*/

// anagram :- anagrams are two string which have same characters but arranged diffrently example Tarun and nurat

func checkAnagram(string1:String,string2:String) -> Bool{
    var charSet1:[Character:Int] = [:]
    var charSet2:[Character:Int] = [:]
    
    if string1.count != string2.count{
        return false
    }
    
    if string1 == string2{
        return true
    }
    
    for char in string1{
        if let value = charSet1[char] {
            charSet1[char] = 1 + value
        }else{
            charSet1[char] = 1
        }
    }
    
    for char in string2{
        if let value = charSet2[char] {
            charSet2[char] = 1 + value
        }else{
            charSet2[char] = 1
        }
    }
    
    return charSet1 == charSet2
}

print(checkAnagram(string1: "geeksforgeeks", string2: "forgeeksgeeks"))

/* wap to replace all the space in a string with %20 */

func replaceSpace(string:String){
    
    var newString = ""
    
    for char in string{
        if char == " "{
            newString.append("%20")
        }else{
            newString.append(char)
        }
    }
    
    print(newString)
}

replaceSpace(string: "welcome to india")

/* +++++++++++++++++++++++++++++++++++++++++++++++++++ Merge sort algo ++++++++++++++++++++++++++++++++++++++++++*/

// merge sort algo

func merge(left:[Int],right:[Int], Array:[Int]) -> [Int]{
    let lLen = left.count
    let rLen = right.count
    
    var A = Array
    //[1,10] adn [1,203]
    var i = 0 ,j = 0,k = 0
   
    while(i < lLen && j < rLen){
        
        if left[i] <= right[j]{
            A[k] = left[i]
            i += 1
        }else{
            A[k] = right[j]
            j += 1
        }
        
        k += 1
    }
    
    while(i < lLen){
        A[k] = left[i]
        i += 1
        k += 1
    }
    
    while( j < rLen){
        A[k] = right[j]
        j += 1
        k += 1
    }
    
    return A
    
}

func mergeSort(A:[Int]) -> [Int]{
    
    let len = A.count - 1
    
    guard len > 0 else{ print("array sorted to single elements \(A)"); return A}
    
    let mid = len/2
    let leftArray = Array(A[0...mid])
    let rightArray = Array(A[mid+1 ... len])
    
    print("left array \(leftArray)")
    print("right arraya \(rightArray)")
    
    let sortedLeft = mergeSort(A: leftArray)
    let sortedRight = mergeSort(A: rightArray)
    
    print("sorted left array \(sortedLeft)")
    print("sorted right array  \(sortedRight)")
    
    let sortedArray = merge(left: sortedLeft, right: sortedRight, Array: A)
    
    print(sortedArray)
    
    return sortedArray
}

var array = [1,10,1,203,1231,2,4,69,30,05,343,5,3,242,5]

mergeSort(A: array)

/* +++++++++++++++++++++++++++++++++++++++++++++++++++ Selection sort algo ++++++++++++++++++++++++++++++++++++++++++*/

// selection sort algo
func selectionSort(array:[Int]) -> [Int]{
    var a = array
    let len = array.count - 1
    var i = 0
    while(len != i){
        let searchArray = Array(a[i...len])
        let minIndex = searchMinimum(array: searchArray) + i
        
        if (minIndex) != i{
            let temp = a[minIndex]
            a[minIndex] = a[i]
            a[i] = temp
        }
        
        print(a)
        i += 1
    }
    
    return a
}

func searchMinimum(array:[Int])->Int{
    var minNumber = array[0]
 
    print(array)
    var minIndex = 0
    var index = 0
    for value in array{
        if minNumber >= value{
            minNumber = value
            minIndex = index
        }
        index += 1
    }
    
    print(minIndex)
    return minIndex
}

  print(selectionSort(array: array))

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

let bubbleSortedArray = bubbleSort(Array: array)


// quickSort

func quickSort(array:[Int])->[Int]{
    var array = array
    guard array.count > 1 else{return array}

    var pIndex = 0
    let end = array.count - 1
    let pivot = array[end]
    
    
    for i in 0 ... end - 1{
        if pivot >= array[i]{
            array = swap(i, pIndex, in: array)
            pIndex += 1
        }
    }
    array =  swap(pIndex, end, in: array)

    var array1:[Int] = [] , array2:[Int] = []
    if pIndex > 0{
        array1 = quickSort(array: Array(array[0...pIndex-1]))
    }
    
    if pIndex  < end{
        array2 = quickSort(array: Array(array[pIndex+1 ... end]))
    }
    
    return array1 + [array[pIndex]] + array2
}

func swap(_ index1:Int ,_ index2:Int,in array:[Int])->[Int]{
    var array = array
    guard index1 != index2 else{return array}
    let temp = array[index1]
    array[index1] = array[index2]
    array[index2] = temp
    return array
}

print(quickSort(array: array))



//++++++++++++++++++++++++++++++++++++++++++++++++ Searching algorithms ++++++++++++++++++++++++++++++++++++++++++//

// Linear search
// array doesnt need to be sorted for this
// time complexity in this case is O(n)

func linearSearch(search value:Int , in array:[Int]) -> Int{
    
    for i in 0 ... array.count - 1{
        
        if array[i] == value{
            return i
        }
    }
    
    return -1
}

let index = linearSearch(search: 343, in: array)
print(index)

//Binary search
// we assume array to be sorted first

func binarySearch(search value: Int , in array:[Int])->Bool{
    let len = array.count - 1
    guard len > 1 else{ if value == array[0]{
        return true
    }
        return false
    }
    
    let mid = len/2
    
    if array[mid] == value{
        print("value is found")
        return true
    }
    
    if array[mid] > value{
        return binarySearch(search: value, in: Array(array[(0) ... (mid - 1)]))
    }else{
        return binarySearch(search: value, in: Array(array[(mid + 1)...len]))
    }
}
print("\nbinary search")
print(binarySearch(search: 10, in: [0,1,3,5,7,9,10,12,14,15,16,61]))


// ++++++++++++++++++++++++++++++++ find if triplet exists ++++++++++++++++++++++++++++++++++++++++++++++++++++++++


func tripletExist(array:[Int],num:Int) -> Bool{
    
    for (index,i) in array.enumerated(){
        let sum = num - i
        var table:[Int:Int] = [:]
        for k in index...(array.count - 1){
            let j = array[k]
            if index != k{
            if table[j] != nil{
                print("\(i),\(j),\(sum - j)")
                return true
            }else{
                table[sum-j] = sum - j
                }
            }
        }
    }
    return false
}


print(tripletExist(array: [1,4,45,8,7,0,1], num: 15))


// WAP  to string with input "welcome to india" output "india to welcome"


func reverseSentence(sentence:String){
    let wordsArray = sentence.components(separatedBy: " ")
    
    var count = wordsArray.count - 1
    
    var reverseSentenceString = ""
    
    while(count >= 0 ){
        reverseSentenceString += "\(wordsArray[count]) "
        count -= 1
    }
    
    print(reverseSentenceString)
}

reverseSentence(sentence: "Welcome to india")


/*********************************************************
 *  LINKED LISTS QUESTIONS
 *********************************************************/
 
/* WAP to remove duplicates from and unsorted linked list */

class Node{
    var next:Node?
    var data:Int?
    
    init(data:Int){
        self.data = data
    }
    
    func appendToTail(data:Int){
        let newNode = Node(data: data)
        var n = self
        while(n.next != nil){
          n = n.next!
        }
        n.next = newNode
    }
    
    func printList(){
        var string = "start->"
        var n = self
        while(n.next != nil){
            string += "\(n.data ?? -1)->"
            n = n.next!
        }
        string += "\(n.data ?? -1)->"
        string += "finished"
        
        print(string)
    }
}

// lets create a linked list

let  head = Node(data: 1)
head.appendToTail(data: 2)
head.appendToTail(data: 3)
head.appendToTail(data: 4)
head.printList()

//WAP to find sum of 3rd largest no  in the array without using any inbuilt function


func updateValues(array:[Int],newValue:Int)->[Int]{
    var newArray = array
    if array[0] < newValue{
        newArray[0] = newValue
        newArray[1] = array[0]
        newArray[2] = array[1]
    }else if array[1] < newValue{
        newArray[1] = newValue
        newArray[2] = array[1]
    }else if array[2] < newValue{
        newArray[2] = newValue
    }
    
    return newArray
}

func thirdLargestNumber(array:[Int]){
    var largestValuesArray = [0,0,0]
    
    for i in  1 ... array.count - 1{
        if largestValuesArray[2] < array[i]{
            largestValuesArray = updateValues(array: largestValuesArray,newValue: array[i])
        }
    }
    
    print("largest value is \(largestValuesArray.last!) largest value array \(largestValuesArray)")
}

thirdLargestNumber(array: [2,1,5,8,10,4,6])

//+++++++++++++++++++++++++++++++++++++++++++++generic function to remove duplicates+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

func removeDup<T>(array:[T]) -> [T]{
    var charSet :[String:T] = [:]
    var newArray:[T] = []
    
    for i in array{
        if charSet["\(i)"] == nil {
            charSet["\(i)"] = i
            newArray.append(i)
        }
    }
    
    print(newArray)
    return newArray
}


removeDup(array: [1,2,70,1,70,23,6,232,5,6,78,0])
removeDup(array: ["ar","br","ar","no","yes","en","dn"])

//+++++++++++++++++++++++++++++++++++++++++++++++ reverse string without using component separator +++++++++++++++++++++++++++++++++++++++++++++++

func reverseSentence2(set:String){
    var reverse = ""
    var word = ""
    
    for i in set{
        if i == " "{
            reverse = word + " " + reverse
            word = ""
        }else{
            word.append(i)
        }
    }
    
    reverse = word + " " + reverse
    
    print(reverse)
}

reverseSentence2(set: "Hi My Name Is")

// ++++++++++++++++++++++++++++++++++++++++++ first non repeating number in array -> Initial approach ++++++++++++++++++++++++++++++++++++++++++++++++++

func nonRep(array:[Int]){
    var nonRep:Int?
    
    for i in 0 ... array.count - 2{
        for j in (i+1) ... (array.count - 1){
            if array[i] == array[j]{
                nonRep = nil
                break
            }else{
                nonRep = array[i]
            }
        }
        
        if nonRep != nil {
            break
        }
    }
    
    guard let nonRpeating = nonRep else{print("nonefound \(String(describing: nonRep))"); return}
    
    print("Non repeating number is \(nonRpeating)")
}

nonRep(array: [1,2,70,1,70,23,6,232,5,6,78,0])

// same non repeating with differeent approach

func modifiedNonRep(array:[Int]){
    var uniqueArray = [Int]()
    var dic:[Int:Int] = [:]
    
    for i in array.indices{
        if dic[array[i]] == nil {
            uniqueArray.append(i)
            dic[array[i]] = uniqueArray.count - 1
        }else{
            if let index = dic[array[i]]{
                uniqueArray.remove(at: index)
            }
        }
    }
    
    print("first non repeating number is at \(uniqueArray[0]) and it is \(array[uniqueArray[0]])")
}


modifiedNonRep(array: [1,2,70,1,70,23,6,232,5,6,78,0])
