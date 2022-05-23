//
//  WalletResponse.swift
//  Wallet
//
//  Created by Yansong Wang on 2022/5/23.
//

import Foundation

struct WalletResponse: Decodable {
    let wallets: [Wallet]
    
    enum CodingKeys: String, CodingKey {
      case wallets
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.wallets = try container.decode([Wallet].self, forKey: .wallets)
    }
}
