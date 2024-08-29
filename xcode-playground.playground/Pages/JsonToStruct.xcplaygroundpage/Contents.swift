/*
 {
     "id": "0001",
     "type": "donut",
     "name": "Cake",
     "ppu": 0.55,
     "batters": {
         "batter": [
             {
                 "id": "1001",
                 "type": "Regular"
             },
             {
                 "id": "1002",
                 "type": "Chocolate"
             },
             {
                 "id": "1003",
                 "type": "Blueberry"
             },
             {
                 "id": "1004",
                 "type": "Devil's Food"
             }
         ]
     },
     "topping": [
         {
             "id": "5001",
             "type": "None"
         },
         {
             "id": "5002",
             "type": "Glazed"
         },
         {
             "id": "5005",
             "type": "Sugar"
         },
         {
             "id": "5007",
             "type": "Powdered Sugar"
         },
         {
             "id": "5006",
             "type": "Chocolate with Sprinkles"
         },
         {
             "id": "5003",
             "type": "Chocolate"
         },
         {
             "id": "5004",
             "type": "Maple"
         }
     ]
 }

 
 "id": "0001",
 "type": "donut",
 "name": "Cake",
 "ppu": 0.55,
 "batters": {

 */

struct Food{
    var id: String?
    var type: String?
    var name: String?
    var ppu: Double?
    var batter: [Batter]?
    var topping: [Topping]?
    
    init(id: String? = nil, type: String? = nil, name: String? = nil, ppu: Double? = nil, batter: [Batter]? = nil, topping: [Topping]? = nil) {
        self.id = id
        self.type = type
        self.name = name
        self.ppu = ppu
        self.batter = batter
        self.topping = topping
    }
}
struct Batter{
    let id: String?
    let type: String?
    
    init(id: String?, type: String?) {
        self.id = id
        self.type = type
    }
}
struct Topping{
    let id: String?
    let type: String?
    
    init(id: String?, type: String?) {
        self.id = id
        self.type = type
    }
}
let batters: [Batter] = [Batter(id: "1001", type: "Regular"),
                         Batter(id: "1002", type: "Chocolate"),
                         Batter(id: "1003", type: "Blueberry"),
                         Batter(id: "1004", type: "Devil's Food")]

let toppings: [Topping] = [Topping(id: "5001", type: "None"),
                           Topping(id: "5002", type: "Glazed"),
                           Topping(id: "5005", type: "Sugar"),
                           Topping(id: "5007", type: "Powdered Sugar"),
                           Topping(id: "5006", type: "Chocolate with Sprinkles"),
                           Topping(id: "5003", type: "Chocolate"),
                           Topping(id: "5004", type: "Maple"),]

let food = Food(batter: batters, topping: toppings)

enum ToppingType{
    case None
    case Glazed
    case Sugar
    case PowderedSugar
    case ChocolateWithSprinkles
    case Chocolate
    case Maple
}
