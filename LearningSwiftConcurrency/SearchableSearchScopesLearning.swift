//
//  SearchableSearchScopesLearning.swift
//  LearningSwiftConcurrency
//
//  Created by Vedant Mistry on 24/04/24.
//

import Combine
import SwiftUI

struct Restaurant: Hashable, Identifiable {
    let id: String
    let title: String
    let cuisine: CuisineOption
}

// custom enum for all the possible cuisines in the application.
enum CuisineOption: String {
    case american, indian, japanese, french, italian
}

final class RestaurantManager {
    func getAllRestaurants() async throws -> [Restaurant] {
        return [
            Restaurant(id: "1", title: "McDonald's", cuisine: .american),
            Restaurant(id: "2", title: "Sushi Bar", cuisine: .japanese),
            Restaurant(id: "3", title: "Pizzeria", cuisine: .italian),
            Restaurant(id: "4", title: "Taqueria", cuisine: .indian),
            Restaurant(id: "5", title: "Boulangerie", cuisine: .french),
            Restaurant(id: "6", title: "Curry House", cuisine: .indian),
            Restaurant(id: "7", title: "BBQ Joint", cuisine: .american),
            Restaurant(id: "8", title: "Dim Sum Place", cuisine: .japanese),
            Restaurant(id: "9", title: "Gastropub", cuisine: .french),
            Restaurant(id: "10", title: "Tapas Bar", cuisine: .american),
            Restaurant(id: "11", title: "Thai Restaurant", cuisine: .indian),
            Restaurant(id: "12", title: "French Taverna", cuisine: .french)
        ]

    }
}

@MainActor
final class SearchableViewModel: ObservableObject {
    let manager = RestaurantManager()
    
    @Published private(set) var allRestaurants: [Restaurant] = []
    @Published private(set) var filteredRestaurants: [Restaurant] = []
    @Published var searchText: String = ""
    
    var isSearching: Bool {
        return !searchText.isEmpty
    }
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        addSubscribers()
    }
    
    // using combine to subscribe to the search text.
    private func addSubscribers() {
        $searchText
            .debounce(for: 0.3, scheduler: DispatchQueue.main, options: nil)
            .sink { [weak self] searchText in
                self?.filterRestaurants(searchText: searchText)
            }
            .store(in: &cancellables)
    }
    
    private func filterRestaurants(searchText: String) {
        guard !searchText.isEmpty else {
            filteredRestaurants = []
            return
        }
        
        let search = searchText.lowercased()
        filteredRestaurants = allRestaurants.filter({ restaurant in
            let titleContainsSearch = restaurant.title.lowercased().contains(search)
            let cuisineContainsSearch = restaurant.cuisine.rawValue.lowercased().contains(search)
            
            return titleContainsSearch || cuisineContainsSearch
        })
    }
    
    func loadRestaurants() async {
        do {
            allRestaurants = try await manager.getAllRestaurants()
        } catch {
            print(error)
        }
    }
}

struct SearchableSearchScopesLearning: View {
    @StateObject private var viewModel = SearchableViewModel()
    
    var body: some View {
        ScrollView {
            VStack {
                ForEach(viewModel.isSearching ? viewModel.filteredRestaurants : viewModel.allRestaurants) { restaurant in
                    restaurantRowView(restaurant: restaurant)
                }
            }
            .padding()
        }
        .task {
            await viewModel.loadRestaurants()
        }
        .searchable(text: $viewModel.searchText, placement: .automatic, prompt: "Search Restaurants...")
        
        .navigationTitle("Restaurants")
    }
    
    private func restaurantRowView(restaurant: Restaurant) -> some View {
        HStack {
            Text(restaurant.title)
                .font(.headline)
            
            Spacer()
            
            Text(restaurant.cuisine.rawValue.capitalized)
                .font(.subheadline)
        }
        .padding()
        .background(Color.teal.opacity(0.3))
        .clipShape(RoundedRectangle(cornerRadius: 10.0))
    }
}

#Preview {
    NavigationStack {
        SearchableSearchScopesLearning()
    }
}
