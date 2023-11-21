import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            Favourites_View(favourites_model: Favourites_Model())
                .tabItem { 
                    Image(systemName: "star.circle")
                    Text("Favourites")
                }
            Text("All Recipes")
                .tabItem { 
                    Image(systemName: "fork.knife.circle")
                    Text("All Recipes")
                }
        }
    }
}
