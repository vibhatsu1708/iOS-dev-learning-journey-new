//
//  ContentView.swift
//  musicApp
//
//  Created by Vedant Mistry on 22/11/23.
//

import SwiftUI

struct ContentView: View {
    @State private var data: [Song] = []
    @State private var topTracks: [Song] = []
    
    @State private var songID: Int = 0
    @State private var songName: String = "Not Playing"
    @State private var songArtist: String = ""
    @State private var songCoverImage: String = ""
    @State private var songAccentColor: String = ""
    @State private var songURL: String = ""
    
    var body: some View {
        TabView {
            ForYou_View(data: $data, songID: $songID, songName: $songName, songArtist: $songArtist, songCoverImage: $songCoverImage, songAccentColor: $songAccentColor, songURL: $songURL)
                .tabItem {
                    Label("For You", systemImage: "music.note")
                        .imageScale(.large)
                        .labelStyle(.titleAndIcon)
                }

            TopTracks_View(topTracks: $topTracks, songID: $songID, songName: $songName, songArtist: $songArtist, songCoverImage: $songCoverImage, songAccentColor: $songAccentColor, songURL: $songURL)
                .tabItem {
                    Label("Top Tracks", systemImage: "music.mic.circle")
                        .imageScale(.large)
                        .labelStyle(.titleAndIcon)
                }
        }
        .tint(Color.red)
        .safeAreaInset(edge: .bottom) {
            MiniPlayer_View(data: $data, songID: $songID, songName: $songName, songArtist: $songArtist, songCoverImage: $songCoverImage, songAccentColor: $songAccentColor, songURL: $songURL)
        }
        .onAppear {
            fetchData()
        }
    }
    
    private func fetchData() {
        guard let url = URL(string: "https://cms.samespace.com/items/songs") else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { return }
            do {
                let decodedData = try JSONDecoder().decode(SongResponse.self, from: data)
                
                
                DispatchQueue.main.async {
                    self.data = decodedData.data
                    self.topTracks = self.data.filter { $0.top_track }
                }
            } catch {
                print(error.localizedDescription)
            }
        }.resume()
    }
}

extension Color {
    init(hex: String, opacity: Double = 1) {
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")

        var rgb: UInt64 = 0

        Scanner(string: hexSanitized).scanHexInt64(&rgb)

        self.init(
            .sRGB,
            red: Double((rgb & 0xFF0000) >> 16) / 255.0,
            green: Double((rgb & 0x00FF00) >> 8) / 255.0,
            blue: Double(rgb & 0x0000FF) / 255.0,
            opacity: opacity
        )
    }
}

#Preview {
    ContentView()
}
