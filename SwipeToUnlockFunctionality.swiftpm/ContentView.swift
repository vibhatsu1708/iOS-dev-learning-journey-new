import SwiftUI

struct ContentView: View {
    @State private var showUnlockedView: Bool = false
    @State private var didUnlock: Bool = false
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [Color.yellow, Color.orange], startPoint: .topLeading, endPoint: .bottomTrailing)
            
            VStack {
                Spacer()
                if showUnlockedView {
                    SwipeToUnlockView()
                        .onSwipeSuccess {
                            self.didUnlock = true
                            self.showUnlockedView = false
                        }
                        .transition(AnyTransition.scale.animation(Animation.easeInOut))
                    
                }
            }
            .padding(.bottom, 200)
            
            if didUnlock {
                Text("hellooooooooooooooo")
                    .transition(AnyTransition.scale.animation(Animation.easeInOut))
            }
        }
        .ignoresSafeArea()
        .onAppear {
            self.showUnlockedView = true
        }
    }
}
