//
//  SignupLoginScreen.swift
//  AppFirebaseProject
//
//  Created by Vedant Mistry on 04/02/24.
//

import Firebase
import SwiftUI

struct SignupScreen: View {
    @EnvironmentObject var userDetails: UserDetails
    
    @State private var email: String = ""
    @State private var password: String = ""
    
    @State private var userIsLoggedIn: Bool = false
    
    var body: some View {
        if userIsLoggedIn == true {
            LoggedInView()
        } else {
            VStack(spacing: 50) {
                Text("Welcome")
                    .font(.system(size: 40))
                    .bold()
                VStack(spacing: 20) {
                    TextField("Email", text: $email)
                        .padding()
                        .overlay {
                            RoundedRectangle(cornerRadius: 10.0)
                                .strokeBorder(Color.secondary)
                        }
                    SecureField("Password", text: $password)
                        .padding()
                        .overlay {
                            RoundedRectangle(cornerRadius: 10.0)
                                .strokeBorder(Color.secondary)
                        }
                }
                
                VStack(spacing: 50) {
                    Button {
                        register()
                    } label: {
                        Text("Sign Up")
                            .bold()
                    }
                    .frame(width: 200, height: 50)
                    .foregroundStyle(Color.white)
                    .background(Color.blue)
                    .clipShape(Capsule())
                    
                    Button {
                        login()
                    } label: {
                        Text("Already have an account? Login")
                            .foregroundStyle(Color.blue)
                            .underline()
                    }
                }
            }
            .padding()
            .ignoresSafeArea()
            .background(Color.white)
        }
    }
    
    func register() {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if error != nil {
                print(error!.localizedDescription)
            } else {
                userDetails.userEmail = email
                print(userDetails.userEmail!)
                self.userIsLoggedIn = true
            }
        }
    }
    
    func login() {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if error != nil {
                print(error!.localizedDescription)
            } else {
                userDetails.userEmail = email
                print(userDetails.userEmail!)
                self.userIsLoggedIn = true
            }
        }
    }
}

#Preview {
    SignupScreen()
}
