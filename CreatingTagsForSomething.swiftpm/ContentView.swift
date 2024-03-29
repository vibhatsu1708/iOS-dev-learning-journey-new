import SwiftUI

struct ContentView: View {
    @State private var textFieldtext: String = ""
    @State private var tags: Set<String> = []
    
    var body: some View {
        VStack {
            LazyHStack {
                ForEach(tags.sorted(by: <), id: \.self) { tag in
                    Text(tag)
                        .padding(.vertical, 5)
                        .padding(.horizontal, 15)
                        .background(Color.yellow)
                        .clipShape(RoundedRectangle(cornerRadius: 10.0))
                }
            }
            
            if #available(iOS 17.0, *) {
                TextField("Enter your tags", text: $textFieldtext, axis: .vertical)
                    .padding()
                    .background(Color.secondary.opacity(0.3))
                    .clipShape(RoundedRectangle(cornerRadius: 10.0))
                    .padding()
                    .onChange(of: textFieldtext) {
                        getTags(textfieldText: textFieldtext)
                    }
            } else {
                // Fallback on earlier versions
            }
        }
    }
    
    func getTags(textfieldText: String) {
        for ch in textfieldText {
            if ch == " " && !textfieldText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
                tags.insert(textfieldText.trimmingCharacters(in: .whitespacesAndNewlines))
                textFieldtext.removeAll()
            }
        }
    }
}
