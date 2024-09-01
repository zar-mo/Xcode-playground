//: [Previous](@previous)

import UIKit

enum AuthMethod: String{
    case email = "email"
    case phoneNumber = "phone number"
    case invalid = "invalid"
}

protocol account {
    associatedtype Auth
    
    func authMethod(auth: Auth) -> AuthMethod
    
}

struct FacebookUser: account {
    
    let name: String
    let age: Int
    
    func authMethod(auth: String) -> AuthMethod {
        if auth.count == 10, let number = Int(auth) {
            return .phoneNumber
        }else if auth.contains("@") {
            return .email
        }else{
            return .invalid
        }
    }
}

struct WhatsAppUser: account {
    
    let username: String
    
    func authMethod(auth: Int) -> AuthMethod {
        
        if String(auth).count == 10 {
            return .phoneNumber
        }else {
            return .invalid
        }
    }
}

let myFacebbok = FacebookUser(name: "John", age: 24)
let myWhatsApp = WhatsAppUser(username: "John_Smith")

let method1 = myFacebbok.authMethod(auth: "john33@gamil.com")
let method2 = myWhatsApp.authMethod(auth: 1234567890)

print("facebook auth method:    \(method1.rawValue)")
print("whatsApp auth method:    \(method2.rawValue)")

protocol Collection {
    
    associatedtype Item: Equatable
    
    var items: [Item] {get set}
    subscript(_ index: Int) -> Item {get}
    
    mutating func append(_ item: Item)
}

extension Collection {
    
     mutating func append(_ item: Item){
        
        items.append(item)
    }
}

struct newCollection: Collection {
    

    var items: [Int] = []
    
    subscript(index: Int) -> Int {
        return items[index]
    }
  
}



