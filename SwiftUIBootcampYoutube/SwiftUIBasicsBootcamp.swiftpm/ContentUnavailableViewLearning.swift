//
//  ContentUnavailableViewLearning.swift
//  SwiftUIBasicsBootcamp
//
//  Created by Vedant Mistry on 18/03/24.
//

import SwiftUI

struct ContentUnavailableViewLearning: View {
    var body: some View {
        if #available(iOS 17.0, *) {
            ContentUnavailableView.search
            ContentUnavailableView("No more images", systemImage: "flame.fill", description: Text("Hmmm, no more images"))
        } else {
            // Fallback on earlier versions
        }
    }
}

#Preview {
    ContentUnavailableViewLearning()
}
