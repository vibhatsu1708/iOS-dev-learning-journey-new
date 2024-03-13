//
//  IntroView.swift
//  SwiftUIBasicsBootcamp
//
//  Created by Vedant Mistry on 14/03/24.
//

import SwiftUI

struct IntroView: View {
    @AppStorage("signedIn") var currenntUserSignedIn: Bool = false
    
    var body: some View {
        ZStack {
            RadialGradient(colors: [Color.indigo, Color.black], center: .center, startRadius: 500, endRadius: 1)
                .ignoresSafeArea()
            
            if currenntUserSignedIn {
                ProfileView()
                    .transition(.asymmetric(insertion: .move(edge: .bottom), removal: .opacity))
            } else {
                OnboardingView()
                    .transition(.asymmetric(insertion: .scale, removal: .move(edge: .top)))
            }
        }
    }
}

#Preview {
    IntroView()
}
