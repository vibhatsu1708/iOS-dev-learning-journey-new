import Foundation

// rule of thumb, is to have everything as private as possible

struct MovieModel {
    let title: String
    let genre: MovieGenre
    private(set) var isFavourite: Bool
    
    // first way to change the value of a struct
    func updateFavouriteStatus(newValue: Bool) -> MovieModel {
        MovieModel(title: title, genre: genre, isFavourite: newValue)
    }
    
    // second way and the better way to update the value of a struct
    mutating func updateFavouriteStatus2(newValue: Bool) {
        isFavourite = newValue
    }
}

enum MovieGenre {
    case romedy, scifi, action
}

class MovieManager {
    
    // this is by default a public variable, which means anything can get or set its value
    var movie1: MovieModel = MovieModel(title: "back to the future", genre: .scifi, isFavourite: false)
    
    // this is a private variable, which means we cannot get or set outside of the class
    private var movie2: MovieModel = MovieModel(title: "the night i met you", genre: .romedy, isFavourite: true)
    
    // this is a private set, which means you can read movie3, but cannot update movie3 outside of this class
    private(set) var movie3: MovieModel = MovieModel(title: "mission impossible", genre: .action, isFavourite: false)
    
    func updateMovie3(isFavourite: Bool) {
        movie3.updateFavouriteStatus2(newValue: isFavourite)
    }
}

let manager = MovieManager()

//manager.movie1 = manager.movie1.updateFavouriteStatus(newValue: true)
//manager.movie1.updateFavouriteStatus(newValue: true)
//print(manager.movie1)

// this wont work because movie2 is private
//manager.movie2

// for updating public variables inside the class
let movie1 = manager.movie1
manager.movie1 = manager.movie1.updateFavouriteStatus(newValue: true)

let movie3 = manager.movie3
manager.updateMovie3(isFavourite: true)

// PRIVATE AND PUBLIC ARE BY FAR THE MOST COMMON BUT THERE ARE MANY OTHERS
