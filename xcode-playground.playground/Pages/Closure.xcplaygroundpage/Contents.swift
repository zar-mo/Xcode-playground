//: [Previous](@previous)

import UIKit

var greet = { (name: String) in print("hello:   \(name)")}

greet("abouzar")

func doSomething(input: Int, completionHandler: (Int) -> String){
    
    let output = input * 10
    
    completionHandler(output)
}

// trailing closure
doSomething(input: 5) { output in
    
    let valueStr =  String(output * 2)
    print(valueStr)
    return valueStr
   
}

// function which return a closure

func operation(a: Int, b: Int) -> (Int) -> Int {
    
    let ab = a * b
    
    return { input in
        return 10 * ab + input
    }
}

let higherOrderFunction = operation(a: 3, b: 5)

let result = higherOrderFunction(8)

print(result)


struct Person {
    var name: String
    var age: Int
}

let people = [
    Person(name: "Alice", age: 28),
    Person(name: "Bob", age: 22),
    Person(name: "Charlie", age: 35)
]

// Sorting by age using a closure
let sortedByAge = people.sorted { a, b in
    a.age > b.age
}

print(sortedByAge)

let numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

let evenNumbers = numbers.filter { num in
    num > 7
}

print(evenNumbers)


func fetchData(completion: @escaping (Result<Data, Error>) -> Void){
    
    DispatchQueue.global().asyncAfter(deadline: .now() + 1){
        
        if Bool.random(){
            completion(.success(Data()))
        }else{
            completion(.failure(NSError()))
        }
        
    }
    
}

fetchData { result in
    switch result {
    case .success(let success):
        print("success")
    case .failure(let failure):
        print("failed")
    }
}
