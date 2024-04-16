//
//  AsyncLetLearning.swift
//  LearningSwiftConcurrency
//
//  Created by Vedant Mistry on 17/04/24.
//

import SwiftUI

// Async let lets you perform multiple async statement or async methods at the same time, and get the results together.

struct AsyncLetLearning: View {
    @State private var images: [UIImage] = []
    let columns: [GridItem] = [GridItem(.flexible()), GridItem(.flexible())]
    let url = URL(string: "https://picsum.photos/350")!
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(images, id: \.self) { image in
                        Image(uiImage: image)
                            .resizable()
                            .scaledToFit()
                            .frame(height: 150)
                    }
                }
            }
            .navigationTitle("Async let")
            .onAppear {
                // Using this method causes the images to load one after the another and not together.
                // One option using just Task could be by using multiple Tasks.
                Task {
                    do {
                        // Using this method, makes sure that all four images display at the same time, that is because all the four functions below are being executed and the result is being awaited at the same time.
                        async let fetchImage1 = fetchImage()
                        async let fetchImage2 = fetchImage()
                        async let fetchImage3 = fetchImage()
                        async let fetchImage4 = fetchImage()
                        
                        // so basically if all four of these are successful, all four of these would get setup.
                        let (image1, image2, image3, image4) = await (try fetchImage1, try fetchImage2, try fetchImage3, try fetchImage4)
                        self.images.append(contentsOf: [image1, image2, image3, image4])
                        
                        
//                        let image1 = try await fetchImage()
//                        self.images.append(image1)
//                        
//                        let image2 = try await fetchImage()
//                        self.images.append(image2)
//                        
//                        let image3 = try await fetchImage()
//                        self.images.append(image3)
//                        
//                        let image4 = try await fetchImage()
//                        self.images.append(image4)
                    } catch {
                        print("Error: \(error.localizedDescription)")
                    }
                }
            }
        }
    }
    
    func fetchImage() async throws -> UIImage {
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

#Preview {
    AsyncLetLearning()
}
