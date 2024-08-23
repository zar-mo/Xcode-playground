/*
 
 {
   "status": "success",
   "data": {
     "user": {
       "id": "123456",
       "name": {
         "first": "John",
         "middle": "A.",
         "last": "Doe"
       },
       "contacts": [
         {
           "type": "email",
           "value": "john.doe@example.com"
         },
         {
           "type": "phone",
           "value": "+1-555-1234"
         }
       ],
       "address": {
         "street": "123 Main St",
         "city": "Anytown",
         "state": "CA",
         "postalCode": "90210",
         "country": "USA"
       },
       "roles": [
         {
           "role": "admin",
           "permissions": ["read", "write", "delete"]
         },
         {
           "role": "user",
           "permissions": ["read"]
         }
       ],
       "profile": {
         "avatarUrl": "https://example.com/avatar.jpg",
         "bio": "Software engineer with 10 years of experience in mobile and web development.",
         "social": {
           "twitter": "@johndoe",
           "linkedin": "https://linkedin.com/in/johndoe"
         }
       }
     },
     "settings": {
       "theme": "dark",
       "notifications": {
         "email": true,
         "sms": false
       }
     },
     "metrics": {
       "posts": 150,
       "followers": 300,
       "following": 180,
       "likes": {
         "received": 2500,
         "given": 1750
       }
     }
   },
   "meta": {
     "timestamp": "2024-08-23T10:00:00Z",
     "requestId": "abc123xyz"
   }
 }
 
 
 */

import Foundation

struct Employee{
    var status: String?
    var data: Data?
    var meta: MetaData?
    
    init(status: String? = nil, data: Data? = nil, meta: MetaData? = nil) {
        self.status = status
        self.data = data
        self.meta = meta
    }
}

struct Data{
    var user: User?
    var setting: Setting?
    var metrics: Metrics?
    
    init(user: User? = nil, setting: Setting? = nil, metrics: Metrics? = nil) {
        self.user = user
        self.setting = setting
        self.metrics = metrics
    }
    
    
}

struct User{
    var id: String?
    var name: Name?
    var contact: [Contact]?
    var address: Address?
    var roles: [Role]?
    var profile: Profile?
    
    init(id: String? = nil, name: Name? = nil, contact: [Contact]? = nil, address: Address? = nil, roles: [Role]? = nil, profile: Profile? = nil) {
        self.id = id
        self.name = name
        self.contact = contact
        self.address = address
        self.roles = roles
        self.profile = profile
    }
}

struct Setting{
    var theme: String?
    var notifications: Notifications?
    
    init(theme: String? = nil, notifications: Notifications? = nil) {
        self.theme = theme
        self.notifications = notifications
    }
    
    
}

struct Metrics{
    var post: Int?
    var following: Int?
    var followers: Int?
    var likes: Like?
    
    init(post: Int? = nil, following: Int? = nil, followers: Int? = nil, likes: Like? = nil) {
        self.post = post
        self.following = following
        self.followers = followers
        self.likes = likes
    }
}


struct Name{
    var first: String?
    var middle: String?
    var last: String?
    
    init(first: String? = nil, middle: String? = nil, last: String? = nil) {
        self.first = first
        self.middle = middle
        self.last = last
    }
}

struct Contact{
    var type: String?
    var value: String?
    
    init(type: String? = nil, value: String? = nil) {
        self.type = type
        self.value = value
    }
}

struct Address{
    
    var street: String?
    var city: String?
    var state: String?
    var postalCode: String?
    var country: String?
    
    init(street: String? = nil, city: String? = nil, state: String? = nil, postalCode: String? = nil, country: String? = nil) {
        self.street = street
        self.city = city
        self.state = state
        self.postalCode = postalCode
        self.country = country
    }
    
}

struct Role{
    var role: String?
    var permissions: [String]?
    
    init(role: String? = nil, permissions: [String]? = nil) {
        self.role = role
        self.permissions = permissions
    }
}

struct Profile{
    var avatarUrl: String?
    var bio: String?
    var social: Social?
    
    init(avatarUrl: String? = nil, bio: String? = nil, social: Social? = nil) {
        self.avatarUrl = avatarUrl
        self.bio = bio
        self.social = social
    }
   
}

struct Social{
    var twitter: String?
    var linkedin : String?
    
    init(twitter: String? = nil, linkedin: String? = nil) {
        self.twitter = twitter
        self.linkedin = linkedin
    }
}

struct Notifications{
    var email: Bool
    var sms: Bool
    
    init(email: Bool = false, sms: Bool = false) {
        self.email = email
        self.sms = sms
    }
}

struct Like{
   var recieved: Int
    var given: Int
    
    init(recieved: Int = 0, given: Int = 0) {
        self.recieved = recieved
        self.given = given
    }
}

struct MetaData{
    var timestamp: Date?
    var requestId: String?
    
    init(timestamp: Date? = nil, requestId: String? = nil) {
        self.timestamp = timestamp
        self.requestId = requestId
    }
}

