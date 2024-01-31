//
//  ContentView.swift
//  FirebaseProject
//
//  Created by Vedant Mistry on 17/01/24.
//

import SwiftUI
import Firebase
import FirebaseStorage

struct ContentView: View {
    @State var isPickerShowing: Bool = false
    @State var selectedImage: UIImage?
    
    var body: some View {
        VStack {
            if selectedImage != nil {
                Image(uiImage: selectedImage!)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200)
                    .clipped()
            } else {
                Rectangle()
                    .foregroundStyle(Color.yellow)
                    .frame(width: 200, height: 200)
            }
            
            Button(action: {
                isPickerShowing = true
            }, label: {
                Label("Add image", systemImage: "plus.circle.fill")
            })
            
            // If selected image is not nil, show the button to upload to the database storage.
            Button {
                uploadPhoto()
            } label: {
                Label("Upload to Database", systemImage: "icloud.and.arrow.up.fill")
            }
            .padding()
            .foregroundStyle(Color.white)
            .background(Color.blue)
            .clipShape(Capsule())
        }
        .padding()
        .sheet(isPresented: $isPickerShowing, onDismiss: nil, content: {
            ImagePicker(isPickerShowing: $isPickerShowing, selectedImage: $selectedImage)
        })
    }
    
    func uploadPhoto() {
        // Make sure the selected image property isn't nil
        guard selectedImage != nil else {
            return
        }
        
        // Create the storage reference
        let storageReference = Storage.storage().reference()
        
        // Turn the image into data
        let imageData = selectedImage!.jpegData(compressionQuality: 0.8)
        guard imageData != nil else {
            return
        }
        
        // Specify the file path and the name
        // If the folder doesn't exist, it will be automatically created.
        let path = "images/\(UUID().uuidString).jpg"
        let fileReference = storageReference.child(path)
        
        // Upload the data
        let uploadTask = fileReference.putData(imageData!, metadata: nil) { metadata, error in
            // Check for errors, if nothing, its successful
            if error == nil && metadata != nil {
                // Save a reference to the firestore database.
                let database = Firestore.firestore()
                database.collection("images").document().setData(["url": path])
            }
        }
        
        // Save a reference to the file in firestore database
    }
}

#Preview {
    ContentView()
}
