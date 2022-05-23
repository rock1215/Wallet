//
//  History.swift
//  Wallet
//
//  Created by Yansong Wang on 2022/5/23.
//

import Foundation

struct History: Decodable {
    let id: String
    let entry: String
    let amount: String
    let currency: String
    let sender: String
    let recipient: String
    
    var received: Bool {
        return self.recipient == "You"
    }
    
    enum CodingKeys: String, CodingKey {
      case id, entry, amount, currency, sender, recipient
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.id = try container.decode(String.self, forKey: .id)
        self.entry = try container.decode(String.self, forKey: .entry)
        self.amount = try container.decode(String.self, forKey: .amount)
        self.currency = try container.decode(String.self, forKey: .currency)
        self.sender = try container.decode(String.self, forKey: .sender)
        self.recipient = try container.decode(String.self, forKey: .recipient)
    }
}
