//
//  CaptionPhoto.swift
//  CaptionPhoto
//
//  Created by Vedant Mistry on 06/10/23.
//

import SwiftUI

struct CaptionPhoto: View {
    let imageName: String
    let captionText: String
    var body: some View {
        Image(imageName)
            .resizable()
            .scaledToFit()
            .overlay(alignment: .bottom) {
                Caption(text: captionText)
            }
            .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
            .padding()
    }
}

struct Caption: View {
    let text: String
    var body: some View {
        Text(text)
            .padding()
            .foregroundStyle(Color.white)
            .background(Color.black.opacity(0.75),
                        in: RoundedRectangle(cornerRadius: 10, style: .continuous))
            .padding()
    }
}

struct CaptionPhoto_Previews: PreviewProvider {
    static let landscape = "landscape"
    static let landscapeCaption = "landscape photo"
    static let portrait = "portrait"
    static let portraitPhoto = "portrait photo"
    
    static var previews: some View {
        CaptionPhoto(imageName: landscape, captionText: landscapeCaption)
        CaptionPhoto(imageName: portrait, captionText: portraitPhoto)
    }
}
