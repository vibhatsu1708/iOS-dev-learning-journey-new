//
//  TaskGroupLearning.swift
//  LearningSwiftConcurrency
//
//  Created by Vedant Mistry on 17/04/24.
//

import SwiftUI

// Used to run a group of tasks together concurrently. A group of tasks.
// Using a task group over a for each loop saves a lot of time.

class TaskGroupLearningManager {
    let urlString = "https://picsum.photos/350"
    
    var images: [UIImage] = []
    
    // Using multiple async let statements like this is fine when there isn't too much data to deal with.
    // When there is more data, you would need to use the Task Group.
    func fetchImagesWithAsyncLet() async throws -> [UIImage] {
        async let fetchImage1 = fetchImage(urlString: urlString)
        async let fetchImage2 = fetchImage(urlString: urlString)
        async let fetchImage3 = fetchImage(urlString: urlString)
        async let fetchImage4 = fetchImage(urlString: urlString)
        
        let (image1, image2, image3, image4) = await (try fetchImage1,try  fetchImage2, try fetchImage3, try fetchImage4)
        
        return  [image1, image2, image3, image4]
    }
    
    // Using Task Group
    func fetchImagesWithTaskGroup() async throws -> [UIImage] {
        let urlStrings: [String] = [
            "https://picsum.photos/350",
            "https://picsum.photos/350",
            "https://picsum.photos/350",
            "https://picsum.photos/350"
        ]
        
        
        // Just like any asynchronous function that throws, the task group needs to be set with try await, because you need to try to fetch it and then await for the response.
        // the below function is returning the images which the parent function would return its content.
        return try await withThrowingTaskGroup(of: UIImage?.self) { group in
            var images: [UIImage] = []
            images.reserveCapacity(urlStrings.count) // basically telling how many minimum elements will be allocated since when using an array you don't know how many elements are going to be in the array itself.
            
            // Actual method
            // Use this method
            for urlString in urlStrings {
                group.addTask {
                    // better to use try? instead of just try, because if one of them fails all of them will fail if you use just try, but by using try?, if one of them fails, only one will return a nil value whereas the others would work as intended. By marking this as try?, you would need to mark the above UIImage.self as UIImage?.self, since it is an optional and could return a nil value.
                    try? await self.fetchImage(urlString: urlString)
                }
            }
            
            // Explanation for what not to use
            /*
            // the add task automatically gets the return type because of the above "UIImage.self".
            // Method for explanation, since this also is manually writing the task groups, this isn't how it is done.
//            group.addTask {
//                try await self.fetchImage(urlString: self.urlString)
//            }
//            group.addTask {
//                try await self.fetchImage(urlString: self.urlString)
//            }
//            group.addTask {
//                try await self.fetchImage(urlString: self.urlString)
//            }
//            group.addTask {
//                try await self.fetchImage(urlString: self.urlString)
//            }
             */
            
            
            // basically says that throughout this for loop it waits for each result to come back.
            // this for loop is going to wait for each image to come back, so if one never returned back, we would be waiting for the last task forever or until it fails.
            for try await image in group {
                if let image = image {
                    images.append(image)
                }
            }
            
            return images
        }
    }
    
    private func fetchImage(urlString: String) async throws -> UIImage {
        guard let url = URL(string: urlString) else {
            throw URLError(.badURL)
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url, delegate: nil)
            if let image = UIImage(data: data) {
                return image
            } else {
                throw URLError(.badURL)
            }
        } catch {
            throw error
        }
    }
}

class TaskGroupLearningViewModel: ObservableObject {
    @Published var images: [UIImage] = []
    let manager = TaskGroupLearningManager()
    
    func getImages() async {
        if let images = try? await manager.fetchImagesWithTaskGroup() {
            self.images.append(contentsOf: images)
        }
    }
}

struct TaskGroupLearning: View {
    @StateObject var viewModel = TaskGroupLearningViewModel()
    
    let columns: [GridItem] = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(viewModel.images, id: \.self) { image in
                        Image(uiImage: image)
                            .resizable()
                            .scaledToFit()
                            .frame(height: 150)
                    }
                }
            }
            .navigationTitle("Task Groups")
            .task {
                await viewModel.getImages()
            }
        }
    }
}

#Preview {
    TaskGroupLearning()
}
