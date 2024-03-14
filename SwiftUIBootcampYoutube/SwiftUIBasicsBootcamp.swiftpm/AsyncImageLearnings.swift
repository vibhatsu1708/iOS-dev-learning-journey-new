//
//  AsyncImageLearnings.swift
//  SwiftUIBasicsBootcamp
//
//  Created by Vedant Mistry on 14/03/24.
//

import SwiftUI

struct AsyncImageLearnings: View {
    let url = URL(string: "https://picsum.photos/400")
    
    var body: some View {
//        asyncImageView
        
        // using the async image with the content containing the image phase, letting the developer handle errors, if any
        // to deal with the phases of the image loading
        AsyncImage(
            url: url) { imagePhase in
                switch imagePhase {
                case .empty:
                    ProgressView()
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 200)
                        .clipShape(RoundedRectangle(cornerRadius: 20.0))
                        .padding()
                case .failure:
                    Image(systemName: "questionmark")
                        .font(.headline)
                @unknown default:
                    Image(systemName: "questionmark")
                        .font(.headline)
                }
            }
    }
    
    // using the async image with the content and the placeholder
    var asyncImageView: some View {
        AsyncImage(
            url: url,
            content: { returnedImage in
                returnedImage
                    .resizable()
                    .scaledToFit()
                    .clipShape(RoundedRectangle(cornerRadius: 20.0))
            },
            placeholder: {
                ProgressView()
            })
            .frame(width: 200, height: 200)
    }
}

#Preview {
    AsyncImageLearnings()
}
