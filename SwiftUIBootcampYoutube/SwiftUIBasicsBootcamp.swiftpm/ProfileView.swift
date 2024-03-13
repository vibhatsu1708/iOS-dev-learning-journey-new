//
//  ProfileView.swift
//  SwiftUIBasicsBootcamp
//
//  Created by Vedant Mistry on 14/03/24.
//

import SwiftUI

struct ProfileView: View {
    // App storage
    @AppStorage("name") var currentUserName: String?
    @AppStorage("age") var currentUserAge: Int?
    @AppStorage("gender") var currentUserGender: String?
    @AppStorage("signedIn") var currenntUserSignedIn: Bool = false
    
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "person.circle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
            
            // The fallback name won't actually come up, because the name already has been set.
            Text(currentUserName ?? "Your name here")
            
            Text("User is \(currentUserAge ?? 0) years old")
            
            Text("User's current gender is \(currentUserGender ?? "unknown")")
            
            Button {
                
            } label: {
                Text("Signout")
                    .padding()
                    .font(.headline)
                    .foregroundStyle(Color.white)
                    .background(Color.black)
                    .clipShape(RoundedRectangle(cornerRadius: 10.0))
                    .onTapGesture {
                        signout()
                    }
            }
        }
        .padding()
        .padding(.vertical, 40)
        .font(.title)
        .multilineTextAlignment(.center)
        .frame(maxWidth: .infinity)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 10.0))
        .shadow(radius: 10, y: 10)
    }
    
    func signout() {
        currentUserName = nil
        currentUserAge = nil
        currentUserGender = nil
        withAnimation {
            currenntUserSignedIn = false
        }
    }
}

#Preview {
    ProfileView()
}
