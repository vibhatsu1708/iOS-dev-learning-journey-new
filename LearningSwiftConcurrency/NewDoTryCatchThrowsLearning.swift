//
//  NewDoTryCatchThrowsLearning.swift
//  LearningSwiftConcurrency
//
//  Created by Vedant Mistry on 02/04/24.
//

import SwiftUI

class NewDataManager {
    let isActive: Bool = true
    
    func getTitle() -> (title: String?, error: Error?) {
        if isActive {
            return ("New starting string!", nil)
        } else {
            return (nil, URLError(.badURL))
        }
    }
    
    func getTitle2() -> Result<String, Error> {
        if isActive {
            return .success("New new starting string!")
        } else {
            return .failure(URLError(.badURL))
        }
    }
    
    func getTitle3() throws -> String {
        if isActive {
            return "New new new starting text!"
        } else {
            throw URLError(.badURL)
        }
    }
}

class NewDoTryCatchThrowsViewModel: ObservableObject {
    @Published var text: String = "Starting string!"
    let manager = NewDataManager()
    
    func fetchTitle() {
        if let newTitle = manager.getTitle().title {
            self.text = newTitle
        } else if let error = manager.getTitle().error {
            self.text = error.localizedDescription
        }
    }
    
    func fetchTitle2() {
        let result = manager.getTitle2()
        
        switch result {
        case .success(let newTitle):
            self.text = newTitle
        case .failure(let error):
            self.text = error.localizedDescription
        }
    }
    
    func fetchTitle3() {
        do {
            let newTitle = try manager.getTitle3()
            self.text = newTitle
        } catch let error {
            self.text = error.localizedDescription
        }
    }
}

struct NewDoTryCatchThrowsLearning: View {
    @StateObject var viewModel = NewDoTryCatchThrowsViewModel()
    
    var body: some View {
        Text(viewModel.text)
            .font(.title)
            .frame(width: 300, height: 300)
            .background(Color.teal)
            .clipShape(RoundedRectangle(cornerRadius: 30.0))
            .onTapGesture {
                viewModel.fetchTitle3()
            }
    }
}

#Preview {
    NewDoTryCatchThrowsLearning()
}
