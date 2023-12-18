import Foundation

func fetchData() {
    guard let url = URL(string: "https://fakestoreapi.com/products") else { return }
    URLSession.shared.dataTask(with: url) { (data, response, error) in
        guard let data = data else { return }
        print(response)
    }.resume()
}
fetchData()
