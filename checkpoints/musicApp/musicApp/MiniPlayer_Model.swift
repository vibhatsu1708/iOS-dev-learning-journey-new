//
//  MiniPlayer_Model.swift
//  musicApp
//
//  Created by Vedant Mistry on 26/11/23.
//

import Foundation
import AVFoundation

class MiniPlayer_Model: ObservableObject {
    var player: AVPlayer?
    @Published var isPlaying: Bool = false
    @Published var currentTime: Double = 0.0
    
    func togglePlayPause(url: URL) {
        if isPlaying {
            player?.pause()
            currentTime = player?.currentItem?.currentTime().seconds ?? 0.0
        } else {
            let playerItem = AVPlayerItem(url: url)
            
            player = AVPlayer(playerItem: playerItem)
            
            if currentTime > 0.0 {
                player?.seek(to: CMTime(seconds: currentTime, preferredTimescale: 1))
            }
            
            player?.play()
        }
        
        isPlaying.toggle()
    }
    
    func resetTime() {
        self.currentTime = 0.0
    }
}
