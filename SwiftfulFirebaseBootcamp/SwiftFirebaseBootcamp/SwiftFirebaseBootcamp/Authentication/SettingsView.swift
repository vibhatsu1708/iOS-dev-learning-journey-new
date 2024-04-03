//
//  SettingsView.swift
//  SwiftFirebaseBootcamp
//
//  Created by Vedant Mistry on 16/03/24.
//

import SwiftUI

@MainActor
final class SettingsViewModel: ObservableObject {
    func signout() throws {
        try AuthenticationManager.shared.signOut()
    }
    
    func resetPassword() async throws {
        let authUser = try AuthenticationManager.shared.getAuthenticatedUser()
        guard let email = authUser.email else {
            throw URLError(.fileDoesNotExist)
        }
        try await AuthenticationManager.shared.resetPassword(email: email)
    }
}

struct SettingsView: View {
    @StateObject private var viewModel = SettingsViewModel()
    @Binding var showSignInView: Bool
    
    var body: some View {
        List {
            Button {
                Task {
                    do {
                        try viewModel.signout()
                        showSignInView = true
                    } catch {
                        print("Error: \(error)")
                    }
                }
            } label: {
                Text("Log out")
            }
            
            Button {
                Task {
                    do {
                        try await viewModel.resetPassword()
                        print("Password reset done!")
                    } catch {
                        print("Error: \(error)")
                    }
                }
            } label: {
                Text("Reset password")
            }
        }
        .navigationTitle("Settings")
    }
}

#Preview {
    NavigationStack {
        SettingsView(showSignInView: .constant(false))
    }
}
