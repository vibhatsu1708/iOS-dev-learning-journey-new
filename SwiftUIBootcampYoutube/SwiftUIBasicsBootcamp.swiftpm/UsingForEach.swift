//
//  UsingForEach.swift
//  SwiftUIBasicsBootcamp
//
//  Created by Vedant Mistry on 04/03/24.
//

import SwiftUI

struct UsingForEach: View {
    let data: [String] = ["albert", "robert", "bruce", "tony", "steve"]
    let myString = "hello"
    
    var body: some View {
        VStack {
            ForEach(data, id: \.self) { user in
                Text("user: \(user)")
            }
        }
    }
}

#Preview {
    UsingForEach()
}
