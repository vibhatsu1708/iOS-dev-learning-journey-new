//
//  ContentView.swift
//  passingData
//
//  Created by Vedant Mistry on 01/11/23.
//

import SwiftUI

struct ContentView: View {
    @State var showLogo = false
    
    var body: some View {
        VStack {
            if showLogo {
                SpidermanLogo(bindingShowLogo: $showLogo)
            }
        }
    }
}

#Preview {
    ContentView(showLogo: false)
}
