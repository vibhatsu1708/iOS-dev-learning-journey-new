//
//  CodableLearning.swift
//  SwiftUIContinuedLearning
//
//  Created by Vedant Mistry on 30/03/24.
//

import SwiftUI

// Model
// The codable includes both the decodable and the encodable protocol,
struct CustomerModel: Identifiable, Codable /*Decodable, Encodable*/ {
    // usually when dealing with own data it would be UUID.uuidString, but since we are downloading data from the internet, the id is set to a type of String, since the data would contain its own id for each element of the model type.
    let id: String
    let name: String
    let points: Int
    let isPremium: Bool
    
    // This is the magic with using the Codable protocol, all the below code is managed automatically, so no need to explicitly write anything like below.
    
    // when the customer model was created using the newCustomer, it basically creates a new initialiser, it basically has the id, name, points and the isPremium.
//    init(id: String, name: String, points: Int, isPremium: Bool) {
//        self.id = id
//        self.name = name
//        self.points = points
//        self.isPremium = isPremium
//    }
//    
    // to conform to the decodable, we need a new initialiser that has the from decoder in it init.
//    enum CodingKeys: CodingKey {
//        case id
//        case name
//        case points
//        case isPremium
//        
        // if you want to change the name of the variable compared to the actual variable, you could do this, for example, if you want to customise it.
//        case isPremium = "is_premium"
//    }
    
//    init(from decoder: any Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        self.id = try container.decode(String.self, forKey: .id)
//        self.name = try container.decode(String.self, forKey: .name)
//        self.points = try container.decode(Int.self, forKey: .points)
//        self.isPremium = try container.decode(Bool.self, forKey: .isPremium)
//    }
    
    
    // Tp be able to conform to the encodable protocol, you need a function, its basically an opposite of the decoder
//    func encode(to encoder: Encoder) throws {
//        var container = encoder.container(keyedBy: CodingKeys.self)
//        try container.encode(id, forKey: .id)
//        try container.encode(name, forKey: .name)
//        try container.encode(points, forKey: .points)
//        try container.encode(isPremium, forKey: .isPremium)
//    }
}

// View model
class CodeableViewModel: ObservableObject {
    @Published var customer: CustomerModel? = nil
    
    init() {
        getData()
    }
    
    func getData() {
        guard let data = getJSONData() else { return }
        
        
        // if you have a model that conforms to the decodable protocol, you can use this method down here by using the decoder.
        do {
            self.customer = try JSONDecoder().decode(CustomerModel.self, from: data)
        } catch let error {
            print("Error: \(error)")
        }
        
        
        
//        if 
//            let localData = try? JSONSerialization.jsonObject(with: data, options: []),
//            let dictionary = localData as? [String: Any],
//            let id = dictionary["id"] as? String,
//            let name = dictionary["name"] as? String,
//            let points = dictionary["points"] as? Int,
//            let isPremium = dictionary["isPremium"] as? Bool {
//            
            // after getting the data, and then destructuring the data into the variables with the above method is fine, as long as the data is small, but if the data is bigger, the above method can be quite inefficient and difficult to follow along. This is where the decodable protocol comes in use.
//            
//            let newCustomer = CustomerModel(id: id, name: name, points: points, isPremium: isPremium)
//            customer = newCustomer
//        }
    }
    
    func getJSONData() -> Data? {
        // since the model conforms to the encodable protocol, no need to create the dictionary
        let customer = CustomerModel(id: "111", name: "Tony", points: 3000, isPremium: false)
        let jsonData = try? JSONEncoder().encode(customer)
        
//        let dictionary: [String: Any] = [
//            "id": "12",
//            "name": "Thor",
//            "points": 10,
//            "isPremium": true
//        ]
//        let jsonData = try? JSONSerialization.data(withJSONObject: dictionary, options: [])
        
        return jsonData
    }
}

// View
struct CodableLearning: View {
    @StateObject var viewModel = CodeableViewModel()
    
    var body: some View {
        VStack {
            if let customer = viewModel.customer {
                Text(customer.id)
                Text(customer.name)
                Text("\(customer.points)")
                Text(customer.isPremium.description)
            }
        }
    }
}

#Preview {
    CodableLearning()
}
