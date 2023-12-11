//
//  ForYou_View.swift
//  musicApp
//
//  Created by Vedant Mistry on 23/11/23.
//

import SwiftUI

struct ForYou_View: View {
    @Binding var data: [Song]

    @State private var isPlaying: Bool = false
    
    @Binding var songID: Int
    @Binding var songName: String
    @Binding var songArtist: String
    @Binding var songCoverImage: String
    @Binding var songAccentColor: String
    @Binding var songURL: String
    
    @ObservedObject private var miniPlayer_Model = MiniPlayer_Model()
    
    var body: some View {
        ZStack {
            ScrollView {
                VStack(alignment: .leading) {
                    ForEach($data, id: \.id) { $song in
                        HStack {
                            AsyncImage(url: URL(string: "https://cms.samespace.com/assets/\(song.cover)")) { image in
                                image.resizable()
                            } placeholder: {
                                ProgressView()
                            }
                            .frame(width: 50, height: 50)
                            .clipShape(RoundedRectangle(cornerRadius: 10.0))
                            
                            VStack(alignment: .leading) {
                                Text(song.name)
                                    .font(.title3)
                                    .fontWeight(.semibold)
                                Text(song.artist)
                                    .font(.subheadline)
                                    .foregroundStyle(.secondary)
                            }
                            .padding(.leading)
                            Spacer()
                            EmptyView()
                        }
                        .padding()
                        .onTapGesture {
                            miniPlayer_Model.resetTime()
                            miniPlayer_Model.currentTime = 0.0
                            miniPlayer_Model.isPlaying = false
                            miniPlayer_Model.player?.pause()
                            songTapped(song: song)
                            print("new song: \(miniPlayer_Model.currentTime)")
                        }
                    }
                }
                .frame(maxWidth: .infinity)
            }
        }
        .padding(.bottom, 100)
    }
    
    private func songTapped(song: Song) {
        miniPlayer_Model.resetTime()
        miniPlayer_Model.isPlaying = false
        miniPlayer_Model.player?.pause()
        
        songID = song.id
        songName = song.name
        songArtist = song.artist
        songCoverImage = song.cover
        songAccentColor = song.accent
        songURL = song.url
    }
}

#Preview {
    ForYou_View(data: .constant([]), songID: .constant(0), songName: .constant("hello world"), songArtist: .constant("apple inc"), songCoverImage: .constant("4f718272-6b0e-42ee-92d0-805b783cb471"), songAccentColor: .constant("#331E00"), songURL: .constant("https://pub-172b4845a7e24a16956308706aaf24c2.r2.dev/august-145937.mp3"))
}
