//
//  GenericsLearning.swift
//  SwiftuiAdvancedLearningBootcamp
//
//  Created by Vedant Mistry on 02/04/24.
//

import SwiftUI

struct StringModel {
    let info: String?
    
    func removeInfo() -> StringModel {
        return StringModel(info: nil)
    }
}

// lets say, you want the functionality of the StringModel, but also for Booleans, so the first beginner approach would be to copy paste the String model, and rename it to the Bool Model like this.
struct BoolModel {
    let info: Bool?
    
    func removeInfo() -> BoolModel {
        return BoolModel(info: nil)
    }
}

// so if you were to create a custom model with a custom type, this is how you would do it.
// in an actual app, instead of creating new models for each and every needed type, this is the better way to do so. CustomType is not a keyword, its just a way of writing that a custom type is used, so in production, the letter 'T' is used instead of the 'CustomType'. For example
// T stands for the type.
//struct GenericModel<CustomType> {
struct GenericModel<T> {
//    let info: CustomType?
    let info: T?
    
    func removeInfo() -> GenericModel {
        return GenericModel(info: nil)
    }
}



class GenericsViewModel: ObservableObject {
    @Published var stringModel = StringModel(info: "Hello there!")
    
    @Published var genericStringModel = GenericModel(info: "Obi wan kenobi!")
    @Published var genericBoolModel = GenericModel(info: true)
 
    func removeData() {
        stringModel = stringModel.removeInfo()
        genericStringModel = genericStringModel.removeInfo()
        genericBoolModel = genericBoolModel.removeInfo()
    }
}


// using generics is a little different when using on a view.

struct GenericView<T: View>: View {
    let title: String
    
    // what is i want to pass in another view, like a button or a textfield?
    // the way in the struct above, you created a custom type with the struct's name, there that custom type could take anything like Strings, Booleans etc. But if you wanted to pass in a custom view, like buttons or textfields, into an additional view, then you would need to make the custom type conform to the View protocol. So basically if the input is a View, it would work, like Text(""), not Strings, because Strings are types not view, whereas Text is.
    let content: T
    
    var body: some View {
        VStack {
            Text(title)
            
            // and since content is of the type T, the custom view type, which conforms to the view protocol the content works over here.
            content
        }
    }
}

struct GenericsLearning: View {
    @StateObject private var viewModel = GenericsViewModel()
    
    var body: some View {
        VStack {
//            GenericView(title: "This is a generic view")
            // This is how you pass a View as a generic to an additional view.
            GenericView(title: "hello anakin", content: Text("hello obiwan"))
            
            Text(viewModel.stringModel.info ?? "no data")
            Text(viewModel.genericStringModel.info ?? "no data")
            Text(viewModel.genericBoolModel.info?.description ?? "no data")
        }
        .onTapGesture {
            viewModel.removeData()
        }
    }
}

#Preview {
    GenericsLearning()
}
