import Foundation

struct Visits {
    let name: String
    let location: String
    let timeOfVisit: String
    let timeSpent: Int
    
    init(name: String, location: String, timeOfVisit: String, timeSpent: Int) {
        self.name = name
        self.location = location
        self.timeOfVisit = timeOfVisit
        self.timeSpent = timeSpent
    }
}

#if DEBUG
extension Visits {
    static var sampleData = [
        Visits(name: "Google HQ", location: "California", timeOfVisit: "15:45", timeSpent: 110),
        Visits(name: "Apple HQ", location: "California", timeOfVisit: "09:41", timeSpent: 128),
        Visits(name: "Microsoft HQ", location: "Washington", timeOfVisit: "14:35", timeSpent: 57),
        Visits(name: "Unity HQ", location: "California", timeOfVisit: "10:43", timeSpent: 87),
        Visits(name: "Amazon HQ", location: "Washington", timeOfVisit: "13:57", timeSpent: 58)
    ]
}
#endif
