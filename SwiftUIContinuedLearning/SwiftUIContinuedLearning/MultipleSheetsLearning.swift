//
//  MultipleSheetsLearning.swift
//  SwiftUIContinuedLearning
//
//  Created by Vedant Mistry on 21/03/24.
//

import SwiftUI

struct RandomModel: Identifiable {
    let id: String = UUID().uuidString
    let title: String
}

/*
 These are the ways which work.
 1) Using a binding
 2) Multiple sheets
 3) Using $item
 */

struct MultipleSheetsLearning: View {
//    @State var selectedModel: RandomModel = RandomModel(title: "Starting title")
    @State var selectedModel: RandomModel?
//    @State var showSheet: Bool = false
//    @State var showSheet2: Bool = false
    
    // This does not work, explanation is here.
    // This method does not work. So, what is happening here? Basically when this main view is loaded, this also loads the data or the sheet to be presented. So the above selected model is the default value or the starting value for this sheet when it is loaded for the first time. That's why for the first time, the title displayed in the next screen is the "Starting title", and not one or two depending on the button pressed.
    var body: some View {
        VStack(spacing: 20) {
            // This works
            // Using multiple sheets
            // Since each child element has its own .sheet modifier. If the parent has a .sheet modifier, the .sheet modifiers on the child views, won't work, because the parent view .sheet modifiers cancel out the child views .sheet modifiers.
            Button("Button 1") {
                selectedModel = RandomModel(title: "One")
//                showSheet.toggle()
            }
//            .sheet(isPresented: $showSheet, content: {
//                NextScreen(selectedModel: RandomModel(title: "Onee"))
//            })
            
            Button("Button 2") {
                selectedModel = RandomModel(title: "Two")
//                showSheet2.toggle()
            }
            // This works
            // Using $item
            // So, why this works. Because by setting the selectedModel to optional, its default value is nil, and with the bottom now sheet modifier, it will display a sheet only when the selectedModel is not set to nil. And what the above buttons do, is setting the selectedModel to a value which is not nil, this this works.
            .sheet(item: $selectedModel) { model in
                NextScreen(selectedModel: model)
            }
            
            
            
            
//            .sheet(isPresented: $showSheet2, content: {
//                NextScreen(selectedModel: RandomModel(title: "Twoo"))
//            }) // Even this doesn't work, since only one sheet is allowed per view, so the one on the parent view cancels out the sheet of the child. This sheet doesn't display at all.
        }
//        .sheet(isPresented: $showSheet, content: {
////            NextScreen(selectedModel: selectedModel)
//            // Again, conditionally rendering sheets do not work in the presentation of sheets. Not just sheets, but any kind of popover content. REMEMBER, because the content for the sheet is loaded with the main view on top of which it is supposed to be presented.
//            
//            // This works
//            // Using binding
//            NextScreen(selectedModel: selectedModel)
//        })
    }
}

struct NextScreen: View {
    // This works
    // Using binding
//    @Binding var selectedModel: RandomModel
    
    let selectedModel: RandomModel
    
    var body: some View {
        Text(selectedModel.title)
            .font(.largeTitle)
    }
}

#Preview {
    MultipleSheetsLearning()
}
