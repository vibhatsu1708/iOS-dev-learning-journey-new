import Foundation

struct Order {
    let price: Int
    let location: String
}

func totalRevenueOf(orders: [Order], location: String) -> Int {
    let ordersAtLocation = orders.filter { $0.location == "New York" }
    print(ordersAtLocation)
    let orderPrices = ordersAtLocation.map { $0.price }
    print(orderPrices)
    let sumOfPrices = orderPrices.reduce(0) { $0 + $1 }
    print(sumOfPrices)
    
    return 0
}

let orders = [
    Order(price: 24, location: "New York"),
    Order(price: 37, location: "San Francisco"),
    Order(price: 101, location: "New York"),
]
 
let result = totalRevenueOf(orders: orders, location: "New York")
