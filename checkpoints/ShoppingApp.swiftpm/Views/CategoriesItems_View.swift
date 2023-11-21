import SwiftUI

struct CategoriesItems_view: View {
    let category: Category
    @ObservedObject var cartModel: Cart_Model
    
    @State private var itemAddedIndication: Bool = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                VStack {
                    List {
                        ForEach(category.subCategoryValues.sorted(by: { $0.key < $1.key }), id: \.key) { subCategory in
                            HStack(alignment: .top) {
                                Image(category.categoryImage)
                                    .resizable()
                                    .frame(minWidth: 40, maxWidth: 80, minHeight: 40, maxHeight: 80)
                                    .aspectRatio(contentMode: .fit)
                                    .clipShape(RoundedRectangle(cornerRadius: 10.0))
                                
                                VStack(alignment: .leading) {
                                    Text(subCategory.key)
                                        .font(.title2)
                                        .fontWeight(.bold)
                                    ForEach(subCategory.value, id: \.self) { item in
                                        Text("\(item)")
                                    }
                                }
                                .padding(.leading)
                                .font(.subheadline)
                                
                                Spacer()
                                
                                Button {
                                    cartModel.cartItems[subCategory.key] = subCategory.value
                                    print(cartModel.cartItems)
                                    
                                    itemAddedIndication = true
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                        itemAddedIndication = false
                                    }
                                } label: {
                                    Image(systemName: "plus")
                                        .padding()
                                        .background(Color.green)
                                        .foregroundStyle(Color.black)
                                        .fontWeight(.bold)
                                        .clipShape(RoundedRectangle(cornerRadius: 5.0))
                                }
                            }
                        }
                    }
                }
                if itemAddedIndication {
                    Label("Item Added", systemImage: "checkmark.circle.fill")
                        .padding()
                        .background(Color.white)
                        .foregroundStyle(Color.black)
                        .font(.title3)
                        .fontWeight(.bold)
                        .clipShape(RoundedRectangle(cornerRadius: 7.5))
                        .shadow(radius: 10)
                    
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                itemAddedIndication = false
                            }
                        }
                }
            }
        }
        .navigationTitle(category.categoryName)
    }
}
