import UIKit

enum MembershipType: Double{
    case nonMember = 1
    case silver = 0.95
    case gold = 0.8
    case diamond = 0.7
}

protocol ShoppingItem {
    var unitPrice: Double { get }
    var quantity: Int { get }
    
    func totalPrice() -> Double
}

extension ShoppingItem {
    func totalPrice() -> Double {
        return unitPrice * Double(quantity)
    }
}

class TaxCalculator {
    let taxPercentage: Double
    
    init(taxPercentage: Double) {
        self.taxPercentage = taxPercentage
    }
    
    func calculateTax(for item: ShoppingItem) -> Double {
        return item.totalPrice() * taxPercentage / 100
    }
}


enum DiscountType{
    case membership
    case cashBack
}
protocol DiscountProtocol {
    
    var type: DiscountType {get}
    func applyDiscount(to amount: Double) -> Double
}

class MembershipDiscountCalculator: DiscountProtocol {
    let membership: MembershipType
    let type: DiscountType = .membership
    
    init(membership: MembershipType) {
        self.membership = membership
    }
    
    func applyDiscount(to amount: Double) -> Double {
        return amount * membership.rawValue
    }
}

class CashBackDiscountCalculator: DiscountProtocol {
    let type: DiscountType = .cashBack
    let cashBack: Int
    
    init(cashBack: Int) {
        self.cashBack = cashBack
    }
    
    func applyDiscount(to amount: Double) -> Double {
        
        return max(amount - Double(cashBack), 0)
    }
}


class Receipt {
    var items: [ShoppingItem] = []
    let taxCalculator: TaxCalculator
    let discountCalculators: [DiscountProtocol]
    
    init(taxCalculator: TaxCalculator, discountCalculators: [DiscountProtocol]) {
        self.taxCalculator = taxCalculator
        self.discountCalculators = discountCalculators
    }
    
    func totalWithoutTax() -> Double {
        return items.reduce(0) { $0 + $1.totalPrice() }
    }
    
    func totalTax() -> Double {
        return items.reduce(0) { $0 + taxCalculator.calculateTax(for: $1) }
    }
    
    func totalWithTaxAndDiscount() -> Double {
        
        var total = totalWithoutTax() + totalTax()
        
        for discount in discountCalculators{
            
            total = discount.applyDiscount(to: total)
        }
        return total
    }
}


struct GroceryItem: ShoppingItem {
    var unitPrice: Double
    var quantity: Int
}

let item1 = GroceryItem(unitPrice: 10.0, quantity: 2)
let item2 = GroceryItem(unitPrice: 15.0, quantity: 1)

let taxCalculator = TaxCalculator(taxPercentage: 10)
let membershipDiscountCalculator = MembershipDiscountCalculator(membership: .gold)
let cashBackDiscountCalculator = CashBackDiscountCalculator(cashBack: 20)

let discountCalculators: [DiscountProtocol] = [membershipDiscountCalculator, cashBackDiscountCalculator]
let receipt = Receipt(taxCalculator: taxCalculator, discountCalculators: discountCalculators)
receipt.items.append(item1)
receipt.items.append(item2)

print("Total without tax: \(receipt.totalWithoutTax())")
print("Total tax: \(receipt.totalTax())")
print("Total with tax and discount: \(receipt.totalWithTaxAndDiscount())")



