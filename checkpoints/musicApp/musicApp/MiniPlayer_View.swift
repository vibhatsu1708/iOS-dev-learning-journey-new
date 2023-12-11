//
//  MiniPlayer_View.swift
//  musicApp
//
//  Created by Vedant Mistry on 26/11/23.
//

import SwiftUI

struct MiniPlayer_View: View {
    @Binding var data: [Song]
    
    @Binding var songID: Int
    @Binding var songName: String
    @Binding var songArtist: String
    @Binding var songCoverImage: String
    @Binding var songAccentColor: String
    @Binding var songURL: String
    
    @ObservedObject var miniPlayer_Model = MiniPlayer_Model()
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(.ultraThickMaterial)
                .overlay {
                    HStack {
                        HStack {
                            ZStack {
                                GeometryReader {
                                    let size = $0.size
                                    
                                    AsyncImage(url: URL(string: "https://cms.samespace.com/assets/\(songCoverImage)")) { image in
                                        image.resizable()
                                    } placeholder: {
                                        RoundedRectangle(cornerRadius: 10.0)
                                            .fill(LinearGradient(colors: [Color.gray], startPoint: .topLeading, endPoint: .bottomTrailing))
                                            .overlay {
                                                Image(systemName: "waveform")
                                                    .foregroundStyle(Color("MediaPlaybackControls"))
                                                    .font(.title)
                                            }
                                    }
                                    .frame(width: size.width, height: size.height)
                                    .clipShape(RoundedRectangle(cornerRadius: 10.0))
                                }
                            }
                            .frame(width: 50, height: 50)
                            
                            Text(songName)
                                .fontWeight(.semibold)
                                .lineLimit(1)
                        }
                        
                        Spacer()
                        
                        HStack(spacing: 15) {
                            Button(action: {
                                if let songPlayerURL = URL(string: songURL) {
                                    miniPlayer_Model.togglePlayPause(url: songPlayerURL)
                                } else {
                                    print("Invalid URL: \(songURL)")
                                }
                                
                                UIImpactFeedbackGenerator(style: .medium).impactOccurred()
                            }) {
                                Image(systemName: miniPlayer_Model.isPlaying ? "pause.circle.fill" : "play.circle.fill")
                            }
                            .onReceive(miniPlayer_Model.$currentTime) { newTime in
                                print("Current time \(newTime)")
                            }
                            
                            Button(action: {
                                songURL = ""
                                miniPlayer_Model.isPlaying = false
                                miniPlayer_Model.player?.pause()
                                
                                if songID == data.count-1 {
                                    songID = 0
                                } else {
                                    songID += 1
                                }
                                let songReference = data[songID]
                                songName = songReference.name
                                songArtist = songReference.artist
                                songCoverImage = songReference.cover
                                songAccentColor = songReference.accent
                                songURL = songReference.url
                                
                                UIImpactFeedbackGenerator(style: .medium).impactOccurred()
                            }) {
                                Image(systemName: "forward.circle.fill")
                            }
                        }
                        .font(.system(size: 35))
                        .foregroundStyle(Color("MediaPlaybackControls"))
                    }
                    .padding()
                }
        }
        .background(Color.init(hex: songAccentColor))
        .frame(height: 80)
        .contentShape(Rectangle())
        .overlay(alignment: .bottom, content: {
            Rectangle()
                .fill(Color.gray.opacity(0.3))
                .frame(height: 1)
        })
        .offset(y: -50)
        
        .onTapGesture {
            print("Tapped!")
        }
    }
}

#Preview {
    MiniPlayer_View(data: .constant([]), songID: .constant(0), songName: .constant("hello world"), songArtist: .constant("apple inc"), songCoverImage: .constant("4f718272-6b0e-42ee-92d0-805b783cb471"), songAccentColor: .constant("#331E00"), songURL: .constant("https://pub-172b4845a7e24a16956308706aaf24c2.r2.dev/august-145937.mp3"))
}
