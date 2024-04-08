//
//  TypeAliasLearning.swift
//  SwiftUIContinuedLearning
//
//  Created by Vedant Mistry on 31/03/24.
//

import SwiftUI

struct MovieModel {
    let title: String
    let director: String
    let count: Int
}

typealias TVModel = MovieModel

struct TypeAliasLearning: View {
//    @State var item: MovieModel = MovieModel(title: "Avengers Endgame", director: "Joe Russo", count: 12000)
    @State var item: TVModel = TVModel(title: "Avengers Endgame", director: "Joe Russo", count: 12000)
    
    var body: some View {
        VStack {
            Text(item.title)
            Text(item.director)
            Text("\(item.count)")
        }
    }
}

#Preview {
    TypeAliasLearning()
}
