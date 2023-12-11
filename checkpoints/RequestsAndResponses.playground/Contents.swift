import Foundation

let littleLemonAddress = "https://raw.githubusercontent.com/Meta-Mobile-Developer-PC/Working-With-Data-API/main/littleLemonSimpleMenu.json"
let url = URL(string: littleLemonAddress)

print(url!)

guard let url = url else {
    throw NSError()
}

let request = URLRequest(url: url)

let newDataTask: URLSessionDataTask

newDataTask = URLSession.shared.dataTask(with: request) { (data, response, error) in
    if let data = data,
       let resultString = String(data: data, encoding: .utf8) {
        print(resultString)
    }
}
newDataTask.resume()


let session = URLSession(configuration: .default)
let task = session.dataTask(with: URL(string: littleLemonAddress)!) { (data, response, error) in
    if let error = error {
        print(error)
    } else {
        print("completed!")
    }
}
task.resume()
