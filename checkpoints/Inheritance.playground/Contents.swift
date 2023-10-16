class Vehicle {
    var currentSpeed = 0.0
    var description: String {
        return "Travelling at \(currentSpeed)"
    }
}
class TwoWheeler: Vehicle {
    var hasBasket: Bool = false
    var isBike: Bool = false
    var isBicycle: Bool = false
    
    override var description: String {
        if isBike {
            return "Vehicle is a Bike travelling at \(super.currentSpeed)"
        } else if isBicycle {
            return "Vehicle is a Bicycle travelling at \(super.currentSpeed)"
        }
        return "I dunno."
    }
}

var AudiBike = TwoWheeler()
AudiBike.currentSpeed = 120
print(AudiBike.description)
AudiBike.isBike = true
print(AudiBike.description)
