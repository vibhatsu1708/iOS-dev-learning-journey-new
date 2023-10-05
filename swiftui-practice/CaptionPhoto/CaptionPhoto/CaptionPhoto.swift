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
            .clipShape(RoundedRectangle(cornerRadius: 30.0, style: .continuous))
            .padding()
    }
}

struct Caption: View {
    let text: String
    
    var body: some View {
        Text(text)
            .padding()
            .background(Color.black.opacity(0.75), in: RoundedRectangle(cornerRadius: 10, style: .continuous))
            .foregroundStyle(Color.white)
            .bold()
            .padding()
    }
}

struct CaptionPhoto_Previews: PreviewProvider {
    static let landscape = "landscape"
    static let landscapeCaption = "Width is greater than height."
    static let portrait = "portrait"
    static let portraitCaption = "Height is greater than width."
    
    static var previews: some View {
        CaptionPhoto(imageName: landscape, captionText: landscapeCaption)
        CaptionPhoto(imageName: portrait, captionText: portraitCaption)
    }
}
