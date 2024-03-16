//
//  DoCatchTryThrows.swift
//  LearningSwiftConcurrency
//
//  Created by Vedant Mistry on 06/03/24.
//

import SwiftUI

/*
 do catch
 try
 throws
 */

class DoCatchTryThrowsDataManager {
    let isActive: Bool = true
    
    func getTitle() -> (title: String?, error: Error?) {
        if isActive {
            return ("New Text", nil)
        } else {
            return (nil, URLError(.badURL))
        }
    }
    
    // Always use this over the above one, since this is a generic and it is easy to be able to deal with and understand pre set types of what is supposed to be returned instead of handling tupes with different values.
    //    func getTitle2() -> Result<String, Error> {
    //        if isActive {
    //            return .success("New text")
    //        } else {
    //            return .failure(URLError(.badServerResponse))
    //        }
    //    }
    
    func getTitle2() throws -> String {
        if isActive {
            return "New text 2"
        } else {
            throw URLError(.badServerResponse)
        }
    }
    
    // this function basically says, it will try to return a string, and if it can't it has the ability to throw an error, and will throw an error when in need.
    func getTitle3() throws -> String {
        if isActive {
            return "New text 1"
        } else {
            throw URLError(.badServerResponse)
        }
    }
    
    func getTitle4() {
        
    }
    
}

class DoCatchTryThrowsViewModel: ObservableObject {
    let manager: DoCatchTryThrowsDataManager = DoCatchTryThrowsDataManager()
    
    @Published var text1: String = "Starting text 1"
    @Published var text2: String = "Starting text 2"
    
    //    func fetchTitle() {
    //        let returnedData = manager.getTitle()
    //        if let newTitle = returnedData.title {
    //            self.text = newTitle
    //        } else if let error = returnedData.error {
    //            self.text = error.localizedDescription
    //        }
    //    }
    
    //    func fetchTitle() {
    //        let returnedData = manager.getTitle2()
    //
    //        switch returnedData {
    //        case .success(let newText):
    //            self.text = newText
    //        case .failure(let error):
    //            self.text = error.localizedDescription
    //        }
    //    }
    
    func fetchTitle() {
        // what this says is, it will do what is told, and if it fails, it will throw an error, and this error will be caught by the catch block.
        
        // if you do not care for an error, if it is thrown or not. Optional trys can be used. And this will work even though there isn't something specific in place dealing with the errors, the text just wont get updated if an error is thrown.
        let newTitle1 = try? manager.getTitle3()
        if let newTitle1 = newTitle1 {
            self.text1 = newTitle1
        }
        
        let newTitle2 = try? manager.getTitle2()
        if let newTitle2 = newTitle2 {
            self.text2 = newTitle2
        }
        
        //        do {
        //            let newTitle = try manager.getTitle3()
        //            self.text = newTitle
        //        } catch {
        //            self.text = error.localizedDescription
        //        }
    }
}

struct DoCatchTryThrows: View {
    @StateObject private var viewModel: DoCatchTryThrowsViewModel = DoCatchTryThrowsViewModel()
    
    var body: some View {
        VStack {
            Text(viewModel.text1)
            Text(viewModel.text2)
        }
        .frame(width: 300, height: 300)
        .background(Color.indigo)
        .onTapGesture {
            viewModel.fetchTitle()
        }
    }
}

#Preview {
    DoCatchTryThrows()
}
