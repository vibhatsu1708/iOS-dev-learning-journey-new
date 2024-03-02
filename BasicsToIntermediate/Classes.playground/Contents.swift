import Foundation

// Classes are relatively slower compared to structs and enums
// Classes are reference types
// Classes are stored in the heap, and the heap are shared across all the threads in the program
// Reference types point to an object in memory and update the object in memory

class ScreenViewModel {
    let title: String
    
    // since this is being updated from within the class, it should be made so that its value is only 'set' within the class
    private(set) var showButton: Bool
    
    // structs have implicit init, whereas in classes you need to write the init
    init(title: String, showButton: Bool) {
        // self refers to this instance of the class
        self.title = title
        self.showButton = showButton
    }
    
    deinit {
        // runs as the object is being removed from the memory
        // structs do not have a deinit, because they are value types, basically anytime a struct is mutated the previous one is destroyed automatically
    }
    
    // either this
    func hideButton() {
        showButton = false
    }
    // or this
    func updateShowButton(newValue: Bool) {
        showButton = newValue
    }
}

// notice that we are using a let, because the object itself is not changing, the data inside the object is not changing
let viewModel: ScreenViewModel = ScreenViewModel(title: "screen 1", showButton: true)

viewModel.hideButton()
viewModel.updateShowButton(newValue: false)
