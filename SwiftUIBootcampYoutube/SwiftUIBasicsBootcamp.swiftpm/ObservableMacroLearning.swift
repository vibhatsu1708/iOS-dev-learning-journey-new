//
//  ObservableMacroLearning.swift
//  SwiftUIBasicsBootcamp
//
//  Created by Vedant Mistry on 18/03/24.
//

import SwiftUI

@available(iOS 17.0, *)
@Observable class ObservableViewModel {
    // by default everything is published
    var title: String = "Some title"
    
    // and to ignore
    @available(iOS 17.0, *)
    @ObservationIgnored var fruits: [String] = ["applles", "berrries"]
}

@available(iOS 17.0, *)
struct ObservableMacroLearning: View {
    @State private var viewModel: ObservableViewModel = ObservableViewModel()
    
    var body: some View {
        VStack {
            Button(viewModel.title) {
                viewModel.title = "Some new title"
            }
            
            ChildView(viewModel: viewModel)
        }
        .environment(viewModel)
    }
}

@available(iOS 17.0, *)
struct ChildView: View {
    @Bindable var viewModel: ObservableViewModel
    
    var body: some View {
        VStack {
            Button(viewModel.title) {
                viewModel.title = "Some new random title"
            }
        }
    }
}

@available(iOS 17.0, *)
struct ThirdView: View {
    @Environment(ObservableViewModel.self) var viewModel
    
    var body: some View {
        Button(viewModel.title) {
            viewModel.title = "Some new random random title"
        }
    }
}

#Preview {
    if #available(iOS 17.0, *) {
        ObservableMacroLearning()
    } else {
        // Fallback on earlier versions
    }
}
