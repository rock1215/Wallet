//
//  Wallet.swift
//  Wallet
//
//  Created by Yansong Wang on 2022/5/23.
//

import Foundation

struct Wallet: Decodable {
    let id: String
    let wallet_name: String
    let balance: String
    
    enum CodingKeys: String, CodingKey {
      case id, wallet_name, balance
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.id = try container.decode(String.self, forKey: .id)
        self.wallet_name = try container.decode(String.self, forKey: .wallet_name)
        self.balance = try container.decode(String.self, forKey: .balance)
    }
}
