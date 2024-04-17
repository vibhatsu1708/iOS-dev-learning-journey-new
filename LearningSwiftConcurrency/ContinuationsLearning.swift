//
//  ContinuationsLearning.swift
//  LearningSwiftConcurrency
//
//  Created by Vedant Mistry on 17/04/24.
//

import SwiftUI

class ContinuationsLearningManager {
    func getData(url: URL) async throws -> Data {
        do {
            let (data, _) = try await URLSession.shared.data(from: url, delegate: nil)
            return data
        } catch {
            throw error
        }
    }
    
    func getData2(url: URL) async throws -> Data {
        return try await withCheckedThrowingContinuation { continuation in
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let data = data {
                    // the continuation as per the documentation should be resumed exactly once and not more, or it could lead to app crash.
                    // In the code here, if the data is valid data, it resumes it once, if it faces an error, it resumes the continuation only once, and if none of the statements or conditions are met, it resumes the continuation again only once.
                    continuation.resume(returning: data)
                } else if let error = error {
                    continuation.resume(throwing: error)
                } else {
                    continuation.resume(throwing: URLError(.badURL))
                }
            }.resume()
            // every url session requires a .resume to work if it has a completion handler.
        }
    }
    
    // creating a custom escaping closure
    func getFlameImageFromDatabase(completionHandler: @escaping (_ image: UIImage) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            completionHandler(UIImage(systemName: "flame.fill")!)
        }
    }
    
    func getFlameImageFromDatabase() async -> UIImage {
        return await withCheckedContinuation { continuation in
            getFlameImageFromDatabase { image in
                continuation.resume(returning: image)
            }
        }
    }
}

class ContinuationsLearningViewModel: ObservableObject {
    @Published var image: UIImage? = nil
    let networkManager = ContinuationsLearningManager()
    
    func getImage() async {
        guard let url = URL(string: "https://picsum.photos/350") else { return }
        
        do {
            let data = try await networkManager.getData2(url: url)
            if let image = UIImage(data: data) {
                // MainActor.run is similar to the DispatchQueue.main.async
                await MainActor.run {
                    self.image = image
                }
            }
        } catch {
            print("Error: \(error.localizedDescription)")
        }
    }
    
    func getFlameImage() async {
//        networkManager.getFlameImageFromDatabase { [weak self] image in
//            self?.image = image
//        }
        
        let image = await networkManager.getFlameImageFromDatabase()
        self.image = image
    }
}

struct ContinuationsLearning: View {
    @StateObject var viewModel = ContinuationsLearningViewModel()
    
    var body: some View {
        ZStack {
            if let image = viewModel.image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
            }
        }
        .task {
//            await viewModel.getImage()
            await viewModel.getFlameImage()
        }
    }
}

#Preview {
    ContinuationsLearning()
}
