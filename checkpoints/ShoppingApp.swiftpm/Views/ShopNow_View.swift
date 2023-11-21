import SwiftUI

struct ShopNow_View: View {
    @ObservedObject var categories_model: Categories_Model
    @ObservedObject var cartModel: Cart_Model
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                List(categories_model.categories) { category in
                    NavigationLink(destination: CategoriesItems_view(category: category, cartModel: cartModel)) {
                        HStack {
                            Image(category.categoryImage)
                                .resizable()
                                .frame(minWidth: 40, maxWidth: 80, minHeight: 40, maxHeight: 80)
                                .aspectRatio(contentMode: .fit)
                                .clipShape(RoundedRectangle(cornerRadius: 10.0))
                            VStack(alignment: .leading) {
                                Text(category.categoryName)
                                    .font(.title2)
                                    .fontWeight(.bold)
                                Text(category.categoryMessage)
                            }
                            .padding(.leading)
                        }
                    }
                }
            }
            .navigationTitle("Categories")
        }
    }
}
