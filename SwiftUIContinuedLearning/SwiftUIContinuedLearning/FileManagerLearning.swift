//
//  FileManagerLearning.swift
//  SwiftUIContinuedLearning
//
//  Created by Vedant Mistry on 09/04/24.
//

import SwiftUI

// only add images that are important to your app to the assets folder.


// the view model should be specific to specific views
// the file manager is going to be generic for anything that wants to access the file manager
class LocalFileManager {
    static let instance = LocalFileManager()
    
    let folderName = "SwiftUIContinuedLearning_FileManager"
    
    init() {
        createFolderIfNeeded()
    }
    
    // to save images to folders
    func createFolderIfNeeded() {
        guard let path = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask)
            .first?
            .appendingPathComponent(folderName)
            .path else {
            return
        }
        
        if !FileManager.default.fileExists(atPath: path) {
            do {
                try FileManager.default.createDirectory(atPath: path, withIntermediateDirectories: true, attributes: nil)
                print("Successfully created folder")
            } catch {
                print("Error creating folder")
            }
        }
    }
    
    func saveImage(image: UIImage, imageName: String) -> String {
        guard let imageData = image.pngData(),
              let path = getPathForImage(imageName: imageName) else {
            print("Error getting out data")
            return "Error getting data"
        }
        
        // url to save the image to on the device
        // 1) saving to the file manager
        do {
            try imageData.write(to: path)
            print("Success saving at path: \(path)")
            return "Successfully saved!"
        } catch {
            print("Error: \(error)")
            return "Error saving"
        }
    }
    
    // 2) Getting it back from the file manager
    func getImage(imageName: String) -> UIImage? {
        guard
            let path = getPathForImage(imageName: imageName)?.path,
            FileManager.default.fileExists(atPath: path) else {
            print("Error getting path")
            return nil
        }
        
        return UIImage(contentsOfFile: path)
    }
    
    func getPathForImage(imageName: String) -> URL? {
        guard
            let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
                .first?
                .appendingPathComponent(folderName)
                .appendingPathComponent("\(imageName).jpg") else {
            print("Error printing path component")
            return nil
        }
        
        return path
    }
    
    // to delete the image from the file manager
    func deleteImage(imageName: String) -> String {
        guard
            let path = getPathForImage(imageName: imageName),
            FileManager.default.fileExists(atPath: path.path) else {
            print("Error getting path")
            return "Error getting path"
        }
        
        do {
            try FileManager.default.removeItem(at: path)
            print("Successfully deleted!")
            return "Sucessfully deleted!"
            
        } catch {
            print("Error deleting image: \(error)")
            return "Error deleting image"
        }
    }
}

class FileManagerViewModel: ObservableObject {
    @Published var infoMessage: String = ""
    
    @Published var image: UIImage? = nil
    let manager = LocalFileManager.instance
    
    let imageName: String = "image"
    
    init() {
//        getImageFromAssetsFolder()
        getImageFromFileManager()
    }
    
    func getImageFromAssetsFolder() {
        image = UIImage(named: imageName)
    }
    
    func getImageFromFileManager() {
        image = manager.getImage(imageName: imageName)
    }
    
    func saveImage() {
        guard let image = image else { return }
        infoMessage = manager.saveImage(image: image, imageName: imageName)
    }
    
    func deleteImage() {
        infoMessage = manager.deleteImage(imageName: imageName)
    }
}

struct FileManagerLearning: View {
    @StateObject var viewModel = FileManagerViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                if let image = viewModel.image {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 200, height: 200)
                        .clipped()
                        .clipShape(RoundedRectangle(cornerRadius: 10.0))
                }
                
                HStack {
                    Button {
                        viewModel.saveImage()
                    } label: {
                        Text("Save to file manager")
                            .padding()
                            .font(.headline)
                            .foregroundStyle(Color.black)
                            .background(Color.yellow)
                            .clipShape(RoundedRectangle(cornerRadius: 10.0))
                    }
                    
                    Button {
                        viewModel.deleteImage()
                    } label: {
                        Text("Delete image from file manager")
                            .padding()
                            .font(.headline)
                            .foregroundStyle(Color.black)
                            .background(Color.red)
                            .clipShape(RoundedRectangle(cornerRadius: 10.0))
                    }
                }
                
                Text(viewModel.infoMessage)
                    .font(.largeTitle)
                    .foregroundStyle(Color.pink)
                
                Spacer()
            }
            .navigationTitle("File manager")
        }
    }
}

#Preview {
    FileManagerLearning()
}
