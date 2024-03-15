//
//  AuthenticationView.swift
//  SwiftFirebaseBootcamp
//
//  Created by Vedant Mistry on 16/03/24.
//

import SwiftUI

struct AuthenticationView: View {
    var body: some View {
        VStack {
            NavigationLink {
                SignInEmailView()
            } label: {
                Text("Sign in with Email")
                    .font(.headline)
                    .foregroundStyle(Color.white)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(Color.indigo)
                    .clipShape(RoundedRectangle(cornerRadius: 10.0))
                    .padding()
            }
        }
        .navigationTitle("Sign in")
    }
}

#Preview {
    NavigationStack {
        AuthenticationView()
    }
}
