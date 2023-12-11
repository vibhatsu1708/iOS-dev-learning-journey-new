import Foundation

let address = "https://cms.samespace.com/items/songs"
let url = URL(string: address)

guard let url = url else {
    throw NSError()
}

var songsDataJSON: String = ""

let group = DispatchGroup()

let request = URLRequest(url: url)
let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
    defer {
        group.leave()
    }
    
    if let data = data,
       let responseString = String(data: data, encoding: .utf8) {
        songsDataJSON = responseString
        print(songsDataJSON)
    }
}

group.enter()
task.resume()
group.wait()

//print(type(of: songsDataJSON))

struct Song: Decodable {
    var id: Int //song id
    var name: String //song name
    var artist: String //artist name
    var accent: String //color hex code as string
    var top_track: Bool //whether or not it is a top track
    var url: String //song url
}

//converting the json string to Data
if let jsonData = songsDataJSON.data(using: .utf8) {
    do {
        let decoder = JSONDecoder()
        
        struct Wrapper: Decodable {
            var data: [Song]
        }
        
        let songsData = try decoder.decode(Wrapper.self, from: jsonData)
        
        print(songsData.data)
    } catch {
        print("Error: \(error)")
    }
} else {
    print("Error converting JSON string to Data")
}
