import SwiftUI

struct Recipe_View: View {
    let favourite: Favourites
    let imageMaxWidth = 500
    
    var body: some View {
        NavigationStack {
            ScrollView {
                Image("\(favourite.imageName)")
                    .resizable()
                    .scaledToFit()
                    .frame(minWidth: 400)
                    .frame(maxWidth: 800)
                    .clipShape(RoundedRectangle(cornerRadius: 7.5))
                
                VStack(alignment: .leading) {
                    Group {
                        Group {
                            HStack {
                                Label("\(favourite.cuisine) dish", systemImage: "fork.knife")
                                    .font(.title3)
                                    .fontWeight(.bold)
                                    .foregroundStyle(Color.gray)
                                Spacer()
                                Label("\(favourite.timeToMake) minutes", systemImage: "clock.fill")
                                    .padding()
                                    .background(Color.yellow)
                                    .foregroundStyle(Color.black)
                                    .fontWeight(.bold)
                                    .clipShape(RoundedRectangle(cornerRadius: 500.0))
                            }
                        }
                        Group {
                            VStack(alignment: .leading) {
                                Label("Ingredients", systemImage: "carrot.fill")
                                    .padding(.bottom)
                                    .font(.title)
                                    .fontWeight(.bold)
                                Text(favourite.ingredients.joined(separator: "\n"))
                            }
                        }
                        Group {
                            VStack(alignment: .leading) {
                                Label("Instructions", systemImage: "list.clipboard.fill")
                                    .padding(.bottom)
                                    .font(.title)
                                    .fontWeight(.bold)
                                Text(favourite.instructions.joined(separator: "\n"))
                            }
                        }
                    }
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(.quaternary)
                    .clipShape(RoundedRectangle(cornerRadius: 10.0))
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding()
            .navigationTitle(favourite.title)
        }
    }
}
