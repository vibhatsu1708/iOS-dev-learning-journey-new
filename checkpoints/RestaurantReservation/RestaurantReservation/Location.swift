import Foundation

struct Location {
    var locationName: String
    var locationSubName: String
    var contactNumber: String
    
    init(locationName: String, locationSubName: String, contactNumber: String) {
        self.locationName = locationName
        self.locationSubName = locationSubName
        self.contactNumber = contactNumber
    }
}
