import SwiftUI

struct Cart_View: View {
    @Binding var cartItems: [String: [String]]
    @StateObject private var cartModel = Cart_Model()
    
    @State private var itemRemovedIndication: Bool = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                VStack {
                    List {
                        if cartItems.isEmpty {
                            VStack(alignment: .center) {
                                Text("Oh so empty...")
                                    .font(.title2)
                                Text("Click on ")
                                    .font(.title2)
                                +
                                Text("Shop Now")
                                    .font(.title2)
                                    .fontWeight(.bold)
                                +
                                Text(" to get started.")
                                    .font(.title2)
                            }
                            .frame(maxWidth: .infinity)
                            .padding()
                        }
                        ForEach(cartItems.sorted(by: { $0.key > $1.key }), id: \.key) { cartItem in
                            HStack(alignment: .top) {
                                VStack(alignment: .leading) {
                                    Text(cartItem.key)
                                        .font(.title2)
                                        .fontWeight(.bold)
                                    
                                    ForEach(cartItem.value, id: \.self) { item in
                                        Text(item)
                                    }
                                }
                                
                                Spacer()
                                
                                Button {
                                    cartItems.removeValue(forKey: cartItem.key)
                                    
                                    itemRemovedIndication = true
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                        itemRemovedIndication = false
                                    }
                                } label: {
                                    Image(systemName: "minus")
                                        .padding()
                                        .background(Color.orange)
                                        .foregroundStyle(Color.black)
                                        .fontWeight(.bold)
                                        .clipShape(RoundedRectangle(cornerRadius: 5.0))
                                }
                            }
                        }
                    }
                }
                if itemRemovedIndication {
                    Label("Item Removed", systemImage: "trash.circle.fill")
                        .padding()
                        .background(Color.red)
                        .foregroundStyle(Color.white)
                        .font(.title3)
                        .fontWeight(.bold)
                        .clipShape(RoundedRectangle(cornerRadius: 7.5))   
                        .shadow(radius: 10)
                    
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                itemRemovedIndication = false
                            }
                        }
                }
            }
            .navigationTitle("Cart")
        }
    }
}
