//
//  DownloadJsonWithEscapingLearning.swift
//  SwiftUIContinuedLearning
//
//  Created by Vedant Mistry on 01/04/24.
//

import SwiftUI

struct PostModel: Identifiable, Codable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}

class DownloadJsonWithEscapingViewModel: ObservableObject {
    @Published var posts: [PostModel] = []
    
    init() {
        getPosts()
    }
    
    func getPosts() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else { return }
        
        downloadData(url: url) { data in
            if let data = data {
                guard let newPosts = try? JSONDecoder().decode([PostModel].self, from: data) else { return }
                // if this is not done on the main thread, xcode will throw an error since publishing changes from background threads is not allowed, because the downloading of data happens on the background threads, and the UI changes happen on the main thread.
                DispatchQueue.main.async { [weak self] in
                    self?.posts = newPosts
                }
            } else {
                print("No data returned")
            }
        }
    }
    
    
    // since this is downloading data, an asynchronous function, better use escaping closures.
    func downloadData(url: URL, completionHandler: @escaping (_ data: Data?) -> ()) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let data = data,
                error == nil,
                let response = response as? HTTPURLResponse,
                response.statusCode >= 200 && response.statusCode < 300 else {
                print("Error downloading data: \(String(describing: error))")
                completionHandler(nil)
                return
            }
            
            completionHandler(data)
            
        }.resume()
    }
}

struct DownloadJsonWithEscapingLearning: View {
    @StateObject var viewModel = DownloadJsonWithEscapingViewModel()
    
    var body: some View {
        ScrollView {
            ForEach(viewModel.posts) { post in
                VStack(alignment: .leading) {
                    Text("\(post.id)")
                        .font(.caption2)
                    Text(post.title)
                        .font(.headline)
                    Text(post.body)
                        .font(.body)
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.yellow.opacity(0.4))
                .clipShape(RoundedRectangle(cornerRadius: 10.0))
                .padding()
            }
        }
    }
}

#Preview {
    DownloadJsonWithEscapingLearning()
}
