//
//  Sheets.swift
//  SwiftUIBasicsBootcamp
//
//  Created by Vedant Mistry on 07/03/24.
//

import SwiftUI

struct Sheets: View {
    @State var showSheet: Bool = false
    
    var body: some View {
        ZStack {
            Color.indigo
                .ignoresSafeArea()
            
            Button {
                showSheet.toggle()
            } label: {
                Text("Button")
                    .padding()
                    .foregroundStyle(Color.white)
                    .background(Color.black)
                    .clipShape(RoundedRectangle(cornerRadius: 10.0))
            }
//            .sheet(isPresented: $showSheet, content: {
//                // If you want to add some conditional logic here to present different sheets, do not add the conditional logic inside the .sheet, it would lead to a lot of errors.
//                // This is for a single sheet
//                Sheet()
//            })
            .fullScreenCover(isPresented: $showSheet, content: {
                // The difference between .sheet and .fullScreenCover is that, the .sheet can be dismissed with a swipe, whereas the .fullScreenCover can't, you will need a dismiss button for that, and the .fullScreenCover covers the entire screen and doesn't leave any gap at the top like the .sheet.
                
                Sheet()
            })
        }
    }
}

#Preview {
    Sheets()
}

struct Sheet: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            Color.blue
                .ignoresSafeArea()
            
            Button {
                dismiss()
            } label: {
                Image(systemName: "xmark")
                    .bold()
                    .foregroundStyle(Color.white)
                    .padding()
            }
        }
    }
}
