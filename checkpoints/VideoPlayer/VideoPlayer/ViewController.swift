//
//  ViewController.swift
//  VideoPlayer
//
//  Created by Vedant Mistry on 28/10/23.
//

import UIKit
import AVKit
import AVFoundation

class ViewController: UIViewController {
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidLoad()
        
        playVideo()
    }
    
    private func playVideo() {
        guard let path = Bundle.main.path(forResource: "test", ofType: "mp4")
        else {
            debugPrint("mp4 file not found.")
            return
        }
        
        let player = AVPlayer(url: URL(fileURLWithPath: path))
        let playerController = AVPlayerViewController()
        playerController.player = player
        present(playerController, animated: true)
        player.play()
    }


}

