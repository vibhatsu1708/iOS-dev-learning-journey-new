//
//  DownloadJsonWithCombineLearning.swift
//  SwiftUIContinuedLearning
//
//  Created by Vedant Mistry on 01/04/24.
//

import SwiftUI
import Combine

struct PostModelCombine: Identifiable, Codable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}

class DownloadWithCombineViewModel: ObservableObject {
    @Published var posts: [PostModelCombine] = []
    var cancellables = Set<AnyCancellable>()
    
    init() {
        getPosts()
    }
    
    func getPosts() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else { return }
        
        // create the publisher
//        URLSession.shared.dataTaskPublisher(for: url)
        // put the publisher on the background thread, done by default, no need to explicitly do it.
        URLSession.shared.dataTaskPublisher(for: url)
            .subscribe(on: DispatchQueue.global(qos: .background))
        // receive it on the main thread
            .receive(on: DispatchQueue.main)
        // make sure it isn't damaged, checking that the data is good
            .tryMap(handleOutput)
        // decode the data into the post model
            .decode(type: [PostModelCombine].self, decoder: JSONDecoder())
        // if you use the replace error, it would basically replace the errors with the empty array, instead of failing the process, so you wouldn't need the sink with that completion handler.
        
        
        // if you don't want to deal with errors.
//            .replaceError(with: [])
//            .sink(receiveValue: { [weak self] returnedPosts in
//                self?.posts = returnedPosts
//            })
        
        // either this can be done or the below can be done. If you don't want to deal with the errors, use the first one, and if you want to deal with the errors, use the below one.
        
        
        // if you want to deal with errors
        // use the item, put the item into the app
            .sink { completion in
                // handle the errors if any
                switch completion {
                case .finished:
                    print("Finished")
                case .failure(let error):
                    print("Error: \(error)")
                }
            } receiveValue: { [weak self] returnedPosts in
                self?.posts = returnedPosts
            }
        // store (or cancel the subscription)
            .store(in: &cancellables)

    }
    
    func handleOutput(output: URLSession.DataTaskPublisher.Output) throws -> Data {
        guard let response = output.response as? HTTPURLResponse,
              response.statusCode >= 200 && response.statusCode < 300 else {
                  throw URLError(URLError.badServerResponse)
            }
        return output.data
    }
}

struct DownloadJsonWithCombineLearning: View {
    @StateObject var viewModel = DownloadWithCombineViewModel()
    
    var body: some View {
        ScrollView {
            ForEach(viewModel.posts) { post in
                VStack(alignment: .leading) {
                    Text(post.title)
                        .font(.headline)
                    Text(post.body)
                        .font(.body)
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.orange.opacity(0.5))
                .clipShape(RoundedRectangle(cornerRadius: 10.0))
                .padding()
            }
        }
    }
}

#Preview {
    DownloadJsonWithCombineLearning()
}
