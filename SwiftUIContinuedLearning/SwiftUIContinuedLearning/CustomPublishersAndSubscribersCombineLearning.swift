//
//  CustomPublishersAndSubscribersCombine.swift
//  SwiftUIContinuedLearning
//
//  Created by Vedant Mistry on 02/04/24.
//

import SwiftUI
import Combine

class SubscriberViewModel: ObservableObject {
    @Published var count: Int = 0
//    var timer: AnyCancellable?
    // if there were mutliple cancellables
    // creating a set of any cancellables
    var cancellables = Set<AnyCancellable>()
    
    @Published var textFieldString: String = ""
    @Published var textIsValid: Bool = false
    @Published var showButton: Bool = false
    
    init() {
        setUpTimer()
        addTextfieldSubscriber()
        addButtonSubscriber()
    }
    
    func addTextfieldSubscriber() {
        $textFieldString
        // using a debounce basically waits for 0.5 seconds or whatever time is assigned before running this code after debounce, like checking for the length of the string in this case, because if the debounce weren't present, there would be multiple functions or tasks being carried out for this textfield with each character entry.
            .debounce(for: .seconds(0.5), scheduler: DispatchQueue.main)
            .map { text -> Bool in
                if text.count > 3 {
                    return true
                } else {
                    return false
                }
            }
        // try not to use .assign, because it doesn't support, weak self, better to use .sink.
//            .assign(to: \.textIsValid, on: self)
        
        // better to use .sink, for the weak self.
            .sink(receiveValue: { [weak self] isValid in
                self?.textIsValid = isValid
            })
            .store(in: &cancellables)
    }
    
    // since the onReceive calls can only be used in views and not view models. you will be using .sink
    func setUpTimer() {
        Timer.publish(every: 1.0,
                      on: .main,
                      in: .common)
        .autoconnect()
        .sink { [weak self] _ in
            // This is one way to do this. This is fine. But the second one is preferred, below this.
            // since the timer is of the any cancellable, it means that it can be cancelled at any point, for example:
            // using if let self?.count because count is an optional, when you set it to weak self.
            // using the cancel, stops the timer once it reaches 10.
//            self?.count += 1
//            if let count = self?.count, count >= 10 {
//                self?.timer?.cancel()
//            }
            
            
            // Preferred way.
            // this basically says, if the new variable self is a valid self, which is equal to the weak self, if this works then the timer would run, and all the functionalities related to it would work.
            guard let self = self else { return }
            self.count += 1
//            if self.count >= 5 {
//                for item in self.cancellables {
//                    item.cancel()
//                }
//            }
        }
        .store(in: &cancellables)
        
        
    }
    
    func addButtonSubscriber() {
        $textIsValid
        // .combine latest combines two publishers, so that they can be listened to.
            .combineLatest($count)
            .sink { [weak self] (isValid, count) in
                guard let self = self else { return }
                if isValid && self.count > 5 {
                    self.showButton = true
                } else {
                    self.showButton = false
                }
            }
            .store(in: &cancellables)
    }
}

struct CustomPublishersAndSubscribersCombineLearning: View {
    @StateObject var viewModel = SubscriberViewModel()
    
    var body: some View {
        VStack {
            Text("\(viewModel.count)")
                .font(.largeTitle)
            
            TextField("Type here...", text: $viewModel.textFieldString)
                .padding()
                .background(Color.secondary.opacity(0.2))
                .clipShape(RoundedRectangle(cornerRadius: 10.0))
                .overlay (
                    ZStack {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundStyle(Color.red)
                            .padding(.trailing)
                            .opacity(
                                viewModel.textFieldString != ""
                                ? (viewModel.textIsValid ? 0 : 1) : 0)
                        
                        Image(systemName: "checkmark.circle.fill")
                            .foregroundStyle(Color.green)
                            .padding(.trailing)
                            .opacity(viewModel.textIsValid ? 1 : 0)
                    }
                    ,alignment: .trailing
                )
            
            Button {
                
            } label: {
                Text("Submit")
                    .padding()
                    .font(.headline)
                    .foregroundStyle(Color.white)
                    .frame(maxWidth: .infinity)
                    .background(viewModel.showButton ? Color.teal : Color.gray)
                    .clipShape(RoundedRectangle(cornerRadius: 10.0))
            }
            .disabled(!viewModel.showButton)
        }
        .padding()
    }
}

#Preview {
    CustomPublishersAndSubscribersCombineLearning()
}
