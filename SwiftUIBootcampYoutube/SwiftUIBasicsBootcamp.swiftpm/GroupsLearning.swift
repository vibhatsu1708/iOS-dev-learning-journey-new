//
//  GroupsLearning.swift
//  SwiftUIBasicsBootcamp
//
//  Created by Vedant Mistry on 18/03/24.
//

import SwiftUI

struct GroupsLearning: View {
    var body: some View {
        VStack(spacing: 20) {
            Group {
                Text("hello world")
                Text("hello world")
                Text("hello world")
            }
            .padding()
            .font(.headline)
            .background(Color.indigo)
        }
    }
}

#Preview {
    GroupsLearning()
}
