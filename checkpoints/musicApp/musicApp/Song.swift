//
//  Song.swift
//  musicApp
//
//  Created by Vedant Mistry on 23/11/23.
//

import Foundation

struct Song: Codable, Identifiable {
    let id: Int
    let name: String
    let artist: String
    let accent: String
    let top_track: Bool
    let cover: String
    let url: String
}
