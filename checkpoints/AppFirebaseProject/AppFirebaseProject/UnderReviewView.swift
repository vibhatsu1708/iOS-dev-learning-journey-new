//
//  UnderReviewView.swift
//  AppFirebaseProject
//
//  Created by Vedant Mistry on 08/02/24.
//

import SwiftUI
import Firebase

struct UnderReviewView: View {
    @EnvironmentObject var userDetails: UserDetails
    @EnvironmentObject var dataManager: DataManager
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("You have submitted your form, your application is under review.")
                    .font(.largeTitle)
                    .bold()
            }
            .padding()
            
            .navigationTitle("Welcome")
            .toolbar {
                Button {
                    signout()
                    userDetails.userIsLoggedIn = false
                } label: {
                    Text("Sign Out")
                        .padding()
                        .background(Color.orange)
                        .foregroundStyle(Color.white)
                }
            }
        }
    }
    
    func signout() {
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
            
        } catch let SignOutError as NSError {
            print("error: \(SignOutError)")
        }
    }
}

#Preview {
    UnderReviewView()
}
