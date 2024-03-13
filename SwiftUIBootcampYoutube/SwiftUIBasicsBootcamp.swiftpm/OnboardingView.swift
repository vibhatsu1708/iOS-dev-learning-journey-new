//
//  OnboardingView.swift
//  SwiftUIBasicsBootcamp
//
//  Created by Vedant Mistry on 14/03/24.
//

import SwiftUI

struct OnboardingView: View {
    // Onboarding states
    /*
     0 - Welcome Screen
     1 - Add name
     2 - Add age
     3 - Add gender
     */
    @State var onBoardingState: Int = 0
    
    let transition: AnyTransition = .asymmetric(
        insertion: .move(edge: .trailing),
        removal: .move(edge: .leading))
    
    // Onboarding inputs
    @State var name: String = ""
    @State var age: Int = 18
    @State var gendersArray: [String] = ["Male", "Female", "Invalid"]
    @State var gender: String = "Male"
    
    // For the alert
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    
    // App storage
    @AppStorage("name") var currentUserName: String?
    @AppStorage("age") var currentUserAge: Int?
    @AppStorage("gender") var currentUserGender: String?
    @AppStorage("signedIn") var currenntUserSignedIn: Bool = false
    
    var body: some View {
        ZStack {
            // content layer
            ZStack {
                switch onBoardingState {
                case 0:
                    welcomeSection
                        .transition(transition)
                case 1:
                    addNameSection
                        .transition(transition)
                case 2:
                    addAgeSection
                        .transition(transition)
                case 3:
                    addGenderSection
                        .transition(transition)
                default:
                    RoundedRectangle(cornerRadius: 25.0)
                        .foregroundStyle(Color.green)
                }
            }
            
            // buttons layer
            VStack {
                Spacer()
                
                bottomButton
            }
            .padding()
        }
        .alert(isPresented: $showAlert, content: {
            return Alert(title: Text(alertTitle))
        })
    }
}

#Preview {
    OnboardingView()
        .background(Color.indigo)
}

//MARK: - Components for the main view
extension OnboardingView {
    private var bottomButton: some View {
        Text(
            onBoardingState == 0 ? "Sign up" :
            onBoardingState == 3 ? "Finish" :
            "Next"
        )
            .padding()
            .font(.headline)
            .foregroundStyle(Color.indigo)
            .frame(maxWidth: .infinity)
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 10.0))
            .onTapGesture {
                handleNextButtonPressed()
            }
    }
    
    private var welcomeSection: some View {
        VStack(spacing: 30) {
            Spacer()
            
            Image(systemName: "apple.terminal.on.rectangle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
                .foregroundStyle(Color.white)
            Text("Tech gets better!")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(Color.white)
                .overlay(alignment: .bottom) {
                    Capsule(style: .continuous)
                        .frame(height: 3)
                        .offset(y: 5)
                        .foregroundStyle(Color.white)
                }
            Text("The No.1 for getting your daily dose of Tech updates. This tutorial is for practicing app storage, and how to navigation around an app.")
                .fontWeight(.medium)
                .foregroundStyle(Color.white)
            
            Spacer()
            Spacer()
        }
        .multilineTextAlignment(.center)
        .padding()
    }
    
    private var addNameSection: some View {
        VStack(spacing: 30) {
            Spacer()
            
            Text("What's your name?")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(Color.white)
            
            TextField("Your name here...", text: $name)
                .font(.headline)
                .frame(height: 55)
                .background(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 10.0))
            
            Spacer()
            Spacer()
        }
        .multilineTextAlignment(.center)
        .padding()
    }
    
    private var addAgeSection: some View {
        VStack(spacing: 30) {
            Spacer()
            
            Text("What's your age?")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(Color.white)
            
            Picker(
                "Your age?",
                selection: $age) {
                    ForEach(18..<100) { ageCounter in
                        Text("\(ageCounter) years")
                            .fontWeight(.bold)
                            .foregroundStyle(Color.white)
                    }
                }
                .pickerStyle(.inline)
            
            Spacer()
            Spacer()
        }
        .multilineTextAlignment(.center)
        .padding()
    }
    
    private var addGenderSection: some View {
        VStack(spacing: 30) {
            Spacer()
            
            Text("What's your gender?")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(Color.white)
            
            Picker(
                "Your gender?",
                selection: $gender) {
                    ForEach(gendersArray, id: \.self) { genderItem in
                        Text(genderItem)
                            .fontWeight(.bold)
                            .foregroundStyle(Color.white)
                    }
                }
                .pickerStyle(.inline)
            
            Spacer()
            Spacer()
        }
    }
}

//MARK: - Functions for the Onboarding View
extension OnboardingView {
    func handleNextButtonPressed() {
        // check inputs
        switch onBoardingState {
        case 1:
            guard name.trimmingCharacters(in: .whitespacesAndNewlines) != "" && name.count >= 2 else {
                showAlert(title: "Please enter a valid name, your name must be atleast 2 characters long")
                return
            }
            
            
        default:
            break
        }
        
        // Go to next section
        if onBoardingState == 3 {
            // sign in
            signIn()
        }
        
        withAnimation(.spring) {
            onBoardingState += 1
        }
    }
    
    func signIn() {
        currentUserName = name
        currentUserAge = age
        currentUserGender = gender
        withAnimation(.spring) {
            currenntUserSignedIn = true
        }
    }
    
    func showAlert(title: String) {
        alertTitle = title
        showAlert.toggle()
    }
}
