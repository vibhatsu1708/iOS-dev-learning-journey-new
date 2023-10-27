import Foundation

struct Visits {
    let name: String
    let location: String
    let timeOfVisit: String
    let timeSpent: Int
    let longitude: Float
    let latitude: Float
    
    init(name: String, location: String, timeOfVisit: String, timeSpent: Int, longitude: Float, latitude: Float) {
        self.name = name
        self.location = location
        self.timeOfVisit = timeOfVisit
        self.timeSpent = timeSpent
        self.latitude = latitude
        self.longitude = longitude
    }
}

#if DEBUG
extension Visits {
    static var sampleData = [
        Visits(name: "Google HQ", location: "California", timeOfVisit: "15:45", timeSpent: 110, longitude: 37.4224766, latitude: -122.0842499),
        Visits(name: "Apple HQ", location: "California", timeOfVisit: "09:41", timeSpent: 128, longitude: 37.334909, latitude: -122.009026),
        Visits(name: "Microsoft HQ", location: "Washington", timeOfVisit: "14:35", timeSpent: 57, longitude: 47.639722, latitude: -122.133100),
        Visits(name: "Unity HQ", location: "California", timeOfVisit: "10:43", timeSpent: 87, longitude: 37.783300, latitude: -122.408376),
        Visits(name: "Amazon HQ", location: "Washington", timeOfVisit: "13:57", timeSpent: 58, longitude: 38.897733, latitude: -77.036530)
    ]
}
#endif
