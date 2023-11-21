import SwiftUI

struct Favourites_View: View {
    @ObservedObject var favourites_model: Favourites_Model
    @State private var itemID: UUID?
    
    var body: some View {
        NavigationStack {
            VStack {
                List(favourites_model.Favourites_data) { favourite in 
                    NavigationLink(destination: Recipe_View(favourite: favourite)) {
                        HStack {
                            VStack(alignment: .leading) {
                                Text(favourite.title)
                                    .bold()
                                    .font(.title2)
                                Text(favourite.cuisine)
                                    .font(.subheadline)
                                    .foregroundStyle(Color.gray)
                            }
                            Spacer()
                            Label("\(favourite.timeToMake) minutes", systemImage: "clock.circle.fill")
                        }
                    }
                }
            }
            .navigationTitle("Favourites")
        }
    }
}
