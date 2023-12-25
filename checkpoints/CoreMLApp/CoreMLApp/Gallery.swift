//
//  Gallery.swift
//  CoreMLApp
//
//  Created by Vedant Mistry on 25/12/23.
//

import SwiftUI
import CoreML
import Vision
import PhotosUI

struct Gallery: View {
    @State private var selectedItem: PhotosPickerItem?
    @State var image: UIImage?
    
    var body: some View {
        VStack {
            PhotosPicker("Select an Image", selection: $selectedItem, matching: .images)
                .onChange(of: selectedItem) {
                    Task {
                        if let data = try? await selectedItem?.loadTransferable(type: Data.self) {
                            image = UIImage(data: data)
                        }
                        print("Failed to load the image!")
                    }
                }
            if let image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
            }
        }
        .padding()
    }
}

#Preview {
    Gallery()
}
