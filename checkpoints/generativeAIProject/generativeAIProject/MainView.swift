//
//  MainView.swift
//  generativeAIProject
//
//  Created by Vedant Mistry on 15/01/24.
//

import SwiftUI
import GoogleGenerativeAI

struct MainView: View {
    let model = GenerativeModel(name: "gemini-pro", apiKey: APIKey.default)
    
    @State private var textInput: String = ""
    @State private var AIResponse: String = "Hi, What do you wanna talk about?"
    
    var body: some View {
        VStack {
            Group {
                HStack {
                    Circle()
                        .foregroundStyle(Color.blue)
                    Circle()
                        .foregroundStyle(Color.red)
                    Circle()
                        .foregroundStyle(Color.yellow)
                    Circle()
                        .foregroundStyle(Color.green)
                }
            }
            .frame(height: 10)
            
            ScrollView {
                Text(AIResponse)
                    .font(.headline)
                    .multilineTextAlignment(.leading)
            }
            
            HStack {
                TextField("Enter a message", text: $textInput)
                    .textFieldStyle(.roundedBorder)
                    .foregroundStyle(Color.black)
                Button(action: sendMessage) {
                    Image(systemName: "paperplane.fill")
                }
            }
        }
        .padding()
    }
    
    private func sendMessage() {
        AIResponse = ""
        
        Task {
            do {
                let response = try await model.generateContent(textInput)
                guard let text = response.text else {
                    textInput = "Sorry, that couldn'e be processed.\nPlease try again."
                    return
                }
                
                textInput = ""
                AIResponse = text
            } catch {
                AIResponse = "Hmm, something went wrong, Error: \(error.localizedDescription)"
            }
        }
        print(AIResponse)
    }
}

#Preview {
    MainView()
}
