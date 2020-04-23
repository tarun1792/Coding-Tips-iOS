//: Playground - noun: a place where people can play

import UIKit
import Foundation
import PlaygroundSupport


// kvo

class Person:NSObject{
    
   @objc dynamic var name:String
    
    init(with name:String){
        self.name = name
        super.init()
    }
}


var myContext = 0

class PersonManager:NSObject{
    
   var person:Person
    
    init(with person:Person){
        self.person = person
        super.init()
        
        //add observe to the property of person name
        
        self.person.addObserver(self, forKeyPath: #keyPath(Person.name), options: .new, context: &myContext)
    }
    
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        
        if context == &myContext{
            if let changedName = change?[.newKey] as? String{
                print("The New Name Of Person is \(changedName)")
            }
        }
    }
}


let person = Person(with: "Ankit")
let personManager = PersonManager(with: person)

person.name = "amit"


// null collesing operator

infix operator |||

func |||<T> (lhs:T?,rhs: @autoclosure () -> T)->T{
    
    if let value = lhs{
        return value
    }
    return rhs()
}

var name:String?

 //name = nil

//https://stackoverflow.com/questions/24082959/does-swift-have-a-null-coalescing-operator-and-if-not-what-is-an-example-of-a-c

print(name ||| "name")


func compare <T>(compute:(T,T) -> Bool,value1:T,value2:T) -> String{
    
    if compute(value1,value2){
        let message:String = "Condition ek dum theek hai"
        return message
    }
    
    return "Nahi hui bhai Condition satisfy"
}


let result = compare(compute: { $0 == $1}, value1: "tarun", value2: "tarun")
print(result)


// ios app file directories

//https://developer.apple.com/library/archive/documentation/FileManagement/Conceptual/FileSystemProgrammingGuide/FileSystemOverview/FileSystemOverview.html


// Search path Domain mask
//Domain constants specifying base locations to use when you search for significant directories.

//static var userDomainMask: FileManager.SearchPathDomainMask
//The user’s home directory—the place to install user’s personal items (~).

//https://developer.apple.com/documentation/foundation/filemanager/searchpathdomainmask


//You need to move file to your custom location after the download. Implement URLSessionDownloadDelegate and you will receive location of your downloaded file.
//
//Delegate method :

//+++++++++++++++++===========================================================save download file to document directory==========================================

/*let location:URL = URL(string: "some url")!

// this is delegate method
func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL){
    
}


//Code to move file :
    
do {
    let documentsURL = try
        FileManager.default.url(for: .documentDirectory,
                                in: .userDomainMask,
                                appropriateFor: nil,
                                create: false)
    
    let savedURL = documentsURL.appendingPathComponent("yourCustomName.pdf")
    try FileManager.default.moveItem(at: location, to: savedURL)
    
} catch {
    print ("file error: \(error)")
}
 
 */

//+++++++++++++++++=============================================================================================================================================

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

