//
//  AllPurchasesView.swift
//  coreDataApp
//
//  Created by Vedant Mistry on 17/12/23.
//

import SwiftUI
import CoreData

struct AllPurchasesView: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(sortDescriptors: [SortDescriptor(\.date, order: .reverse)]) var purchases: FetchedResults<Purchase>

    @State private var searchText: String = ""
    
    var filteredPurchases: [Purchase] {
        guard !searchText.isEmpty else { return Array(purchases) }
        return purchases.filter {
            ($0.name?.localizedCaseInsensitiveContains(searchText) ?? false) ||
            ($0.purchase_desc?.localizedCaseInsensitiveContains(searchText) ?? false)
        }
    }

    @State private var showingAddPurchase: Bool = false
    @State private var showingEditPurchase: Bool = false
    @State private var selectedPurchase: Purchase?
    
    var body: some View {
        ZStack {
            NavigationStack {
                VStack(alignment: .leading) {
                    List {
                        ForEach(filteredPurchases) { purchase in
                            NavigationLink(destination: EmptyView()) {
                                VStack(alignment: .leading) {
                                    Text(purchase.spent_or_received ? "Received" : "Spent")
                                    Text(purchase.name!)
                                    Text(purchase.purchase_desc!)
                                    Text(purchase.amount!)
                                    Text(purchase.paid ? "Paid" : "Not Paid")
                                    Text(purchase.payment_method!)
                                }
                            }
//                            .swipeActions(edge: .leading) {
//                                Button {
//                                    reminder.completed.toggle()
//                                    print(reminder.completed)
//                                    print("Swipe action not configured!")
//                                } label: {
//                                    Label("Done", systemImage: "checklist.checked")
//                                }
//                            }
                        }
                        .onDelete(perform: deletePurchase)
                        .padding(.vertical)
                    }
                    .frame(maxWidth: .infinity)
                }
                .navigationTitle("Your Purchases")
                .toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        EditButton()
                    }
                }
            }
            .searchable(text: $searchText)

            VStack {
                Spacer()
                HStack {
                    Spacer()
                    VStack() {
                        Button(action: {
                            showingAddPurchase.toggle()
                        }) {
                            Image(systemName: "plus")
                        }
                        .sheet(isPresented: $showingAddPurchase) {
                            AddPurchaseView()
                        }
                    }
                    .font(.title)
                    .bold()
                    .padding()
                    .background(LinearGradient(colors: [Color(UIColor(hex: "D5D887")), Color(UIColor(hex: "A1CF6B")), Color(UIColor(hex: "7AC74F"))], startPoint: .topLeading, endPoint: .bottomTrailing))
                    .foregroundStyle(Color(UIColor(hex: "F8F7FF")))
                    .clipShape(RoundedRectangle(cornerRadius: 1000.0))
                    .shadow(radius: 30)
                }
            }
            .padding(30)
        }
    }
    
    private func deletePurchase(offsets: IndexSet) {
        withAnimation {
            offsets.map {
                purchases[$0]
            }.forEach(managedObjectContext.delete)
            
            DataController().save(context: managedObjectContext)
        }
    }
}

#Preview {
    AllPurchasesView()
}
