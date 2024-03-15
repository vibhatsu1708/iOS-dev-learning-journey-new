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
        }
        .navigationTitle("Settings")
    }
}

#Preview {
    NavigationStack {
        SettingsView(showSignInView: .constant(false))
    }
}
