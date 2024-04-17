//
//  StructClassActorLearning.swift
//  LearningSwiftConcurrency
//
//  Created by Vedant Mistry on 18/04/24.
//

import SwiftUI

struct StructClassActorLearning: View {
    var body: some View {
        Text("Hello, World!")
            .onAppear {
                runTest()
            }
    }
}

//MARK: - Custom classes
// by default structs have their own initialisers, but classes require an explicit one.
class MyClass {
    var title: String
    
    init(title: String) {
        self.title = title
    }
    // mutating won't work here, because mutating only works on value types and not reference types.
    // no mutating because you are not changing the object, but just the value.
    func updateTitle(newTitle: String) {
        title = newTitle
    }
}

//MARK: - Custom structs
struct MyStruct {
    var title: String
}

//MARK: - Actors
// Actors are basically the same as classes, except they use the actor keyword and the await keyword.
actor MyActor {
    var title: String
    
    init(title: String) {
        self.title = title
    }
    
    func updateTitle(newTitle: String) {
        title = newTitle
    }
}

struct MyCustomStruct {
//    var title: String
    private(set) var title: String
    
    // if this struct had a function that would return a new struct when called to
//    func changeTitle1() -> MyCustomStruct {
//        return MyCustomStruct(title: "Title2")
//    }
    
    // if the struct was safe and only allowed changing the value of the title from inside the struct and not outside, by setting the title to private(set), basically the setting property is private but it can be 'get' from anywhere in the code.
    // attaching a mutating basically dictates to the struct that the struct's properties are mutable.
    mutating func changeTitle2(newTitle: String) {
        title = newTitle
    }
}

//MARK: - extension for the main struct
extension StructClassActorLearning {
    private func runTest() {
        print("Test started!")
//        structTest1()
//        structTest2()
//        classTest2()
        actorTest1()
    }
    
    // structs are value types, there are no instances, its different values.
    private func structTest1() {
        let objectA = MyStruct(title: "Starting title!")
        print("ObjectA: \(objectA.title)")
        
        var objectB = objectA
        print("ObjectB: \(objectB.title)")
        objectB.title = "Second title"
        print("ObjectB title changed")
        
        
        print("ObjectA: \(objectA.title)")
        print("ObjectB: \(objectB.title)")
    }
    
    // when trying to change the value of the objectB which was of the same value of objectA, when using Structs, the objectB is also meant to be of var and not let, because up there, when you are changing the value of the title, you are creating a completely new struct, whereas below, you don't have to change the objectB from let to var is because you are not creating a new class, you are changing the underlying value of the variables in that instance.
    // In structs you are passing the value from objectA to objectB, but in classes, you are passing the reference from objectA to objectB, that is why when changing the value of objectB, you are also changing the value of objectA's title, in classes you are changing the underlying reference.
    
    // classes are reference types
    private func classTest1() {
        let objectA = MyClass(title: "Starting title")
        print("ObjectA: \(objectA.title)")
        
        let objectB = objectA
        objectB.title = "Second title"
        print("ObjectB: \(objectB.title)")
    }
    
    
    private func classTest2() {
        print("Class test 2")
        
        let class1 = MyClass(title: "Title1")
        print("Class 1 title: \(class1.title)")
        class1.title = "Title2"
        print("Class 1 title: \(class1.title)")
        
        let class2 = MyClass(title: "Title1")
        print("Class 2 title: \(class2.title)")
        class2.updateTitle(newTitle: "Title2")
        print("Class 2 title: \(class2.title)")
    }
}

extension StructClassActorLearning {
    private func structTest2() {
        print("struct test 2")
        
        // different ways to change the value of structs.
        
        // 1) by changing the value of the struct tile itself
        var struct1 = MyStruct(title: "Title1")
        print("struct 1 title: \(struct1.title)")
        struct1.title = "Title2"
        print("struct 1 title: \(struct1.title)")
        
        // 2) by assigning the struct to a completely new struct
        var struct2 = MyStruct(title: "Title1")
        print("struct 2 title: \(struct2.title)")
        struct2 = MyStruct(title: "Title2")
        print("struct 2 title: \(struct2.title)")
        
        // 3) by adding a function to the struct that can change the title value, by returning a completely new struct when the function is called
        var struct3 = MyCustomStruct(title: "Title1")
        print("struct 3 title: \(struct3.title)")
//        struct3 = struct3.changeTitle1()
        print("struct 3 title: \(struct3.title)")
        
        // 4) By setting the title to private(set), so that it can only be changed or accessed, the title, from inside the struct and if the value has to be changed it can be changed using the mutating function inside the struct.
        var struct4 = MyCustomStruct(title: "Title1")
        print("struct 4 title: \(struct4.title)")
        struct4.changeTitle2(newTitle: "Title2")
        print("struct 4 title: \(struct4.title)")
    }
}

extension StructClassActorLearning {
    private func actorTest1() {
        // Here everytime you want to access something, you have to await.
        Task {
            let objectA = MyActor(title: "Title1")
            await print("ObjectA title: \(objectA.title)")
            
            let objectB = objectA
            await print("ObjectB title: \(objectB.title)")
            
            await objectB.updateTitle(newTitle: "Title2")
            await print("ObjectB title: \(objectB.title)")
            
            await print("ObjectA title: \(objectA.title)")
            await print("ObjectB title: \(objectB.title)")
        }
    }
}

//MARK: - Preview for the main struct
#Preview {
    StructClassActorLearning()
}
