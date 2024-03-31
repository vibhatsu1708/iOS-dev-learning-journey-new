//
//  EscapingClosures.swift
//  SwiftUIContinuedLearning
//
//  Created by Vedant Mistry on 31/03/24.
//

import SwiftUI

class EscapingClosuresViewModel: ObservableObject {
    @Published var text: String = "Hello, world!"
    
    func getData() {
//        downloadData2 { returnedData in
//            text = returnedData
//        }
        
//        downloadData3 { [weak self] returnedData in
//            self?.text = returnedData
//        }
        
        downloadData5 { [weak self] returnedResult in
            self?.text = returnedResult.data
        }
    }
    
    func downloadData() -> String {
        return "New data!"
    }
    
    // example of a non escaping closure
    func downloadData2(completionHandler: (_ data: String) -> Void) {
        completionHandler("New new data!")
    }
    
    // example of an escaping closure
    func downloadData3(completionHandler: @escaping (_ data: String) -> ()) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            completionHandler("New new data!")
        }
    }
    
    func downloadData4(completionHandler: @escaping (DownloadResult) -> ()) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            let result = DownloadResult(data: "New new new new data!")
            completionHandler(result)
        }
    }
    
    func downloadData5(completionHandler: @escaping DownloadCompletion) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            let result = DownloadResult(data: "New new new new data!")
            completionHandler(result)
        }
    }
}

struct DownloadResult {
    let data: String
}

typealias DownloadCompletion = (DownloadResult) -> ()

struct EscapingClosures: View {
    @StateObject var viewModel = EscapingClosuresViewModel()
    
    var body: some View {
        Text(viewModel.text)
            .font(.largeTitle)
            .fontWeight(.semibold)
            .foregroundStyle(LinearGradient(colors: [Color.pink, Color.indigo], startPoint: .topLeading, endPoint: .bottomTrailing))
            .onTapGesture {
                viewModel.getData()
            }
    }
}

#Preview {
    EscapingClosures()
}
