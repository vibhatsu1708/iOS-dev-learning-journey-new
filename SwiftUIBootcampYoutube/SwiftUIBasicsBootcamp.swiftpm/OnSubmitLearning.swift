//
//  OnSubmitLearning.swift
//  SwiftUIBasicsBootcamp
//
//  Created by Vedant Mistry on 15/03/24.
//

import SwiftUI

struct OnSubmitLearning: View {
    enum OnboardingFields {
        case username
        case password
    }
    
    @State private var username: String = ""
    @State private var password: String = ""
    
    @FocusState private var fieldFocus: OnboardingFields?
    
    var body: some View {
        VStack {
            TextField("Your username...", text: $username)
//                .focused($usernameFocus)
                .submitLabel(.next)
                .focused($fieldFocus, equals: .username)
                .padding(.leading)
                .frame(height: 55)
                .background(Color.gray.brightness(0.30))
                .foregroundStyle(Color.black)
                .clipShape(RoundedRectangle(cornerRadius: 10.0))
                .padding()
                .onSubmit {
                    fieldFocus = .password
                }
            
            
            TextField("Your username...", text: $password)
                .submitLabel(.done)
                .focused($fieldFocus, equals: .password)
                .padding(.leading)
                .frame(height: 55)
                .background(Color.gray.brightness(0.30))
                .foregroundStyle(Color.black)
                .clipShape(RoundedRectangle(cornerRadius: 10.0))
                .padding()
            
            Button("Toggle username focus state") {
                fieldFocus = .username
            }
            
            Button("Toggle password focus state") {
                fieldFocus = .password
            }
        }
        .onAppear {
            fieldFocus = .username
        }
    }
}

#Preview {
    OnSubmitLearning()
}
