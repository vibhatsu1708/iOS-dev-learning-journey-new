//
//  APIKey.swift
//  generativeAIProject
//
//  Created by Vedant Mistry on 15/01/24.
//

import Foundation

enum APIKey {
    static var `default`: String {
        guard let filePath = Bundle.main.path(forResource: "GenerativeAI-Info", ofType: "plist") else {
            fatalError("Couldn't file GenerativeAI-Info.plist file.")
        }
        let plist = NSDictionary(contentsOfFile: filePath)
        guard let value = plist?.object(forKey: "API_KEY") as? String else {
            fatalError("Couldn't find key API_KEY in GenerativeAI-Info.plist file.")
        }
        if value.starts(with: "_") {
            fatalError("Follow the instructions at the google dev tutorials website to get an API Key.")
        }
        return value
    }
}
