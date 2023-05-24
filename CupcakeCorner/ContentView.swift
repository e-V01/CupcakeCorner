//
//  ContentView.swift
//  CupcakeCorner
//
//  Created by Y K on 21.05.2023.
//

import SwiftUI


//class User: ObservableObject, Codable {
//
//    enum CodingKeys: CodingKey {
//        case name
//    }
//    @Published var name = "Yurii Kukhta"
//
//    required init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        name = try container.decode(String.self, forKey: .name)
//    }
//    func encode(to encoder: Encoder) throws {
//        var container = encoder.container(keyedBy: CodingKeys.self)
//        try container.encode(name, forKey: .name)
//    }
//}

//struct Response: Codable {
//    var results: [Result]
//}
//
//struct Result: Codable {
//    var trackID: Int
//    var trackName: String
//    var collectionName: String
//}


struct ContentView: View {
    @StateObject var order = TotalOrder()
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Picker("Select your cake type", selection: $order.type) {
                        ForEach(TotalOrder.types.indices) {
                            Text(TotalOrder.types[$0])
                        }
                    }
                    
                    Stepper("Number of cakes: \(order.quantity)", value: $order.quantity, in: 3...20)
                }
                Section {
                    Toggle("Any special requests?", isOn: $order.specialRequestEnabled.animation())
                    
                    if order.specialRequestEnabled {
                        Toggle("Add extra frosting", isOn: $order.extraFrosting)
                        Toggle("Add extra sprinkles", isOn: $order.addSprinkles)

                    }
                }
                Section {
                    NavigationLink {
                        AddressView(order: order)
                    } label: {
                        Text("Delivery details")
                    }
                }
            }
            .navigationTitle("Cupcake Corner")
        }
    }
}








struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
