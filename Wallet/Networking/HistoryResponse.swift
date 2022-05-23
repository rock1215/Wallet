//
//  HistoryResponse.swift
//  Wallet
//
//  Created by Yansong Wang on 2022/5/23.
//

import Foundation

struct HistoryResponse: Decodable {
    let histories: [History]
    
    enum CodingKeys: String, CodingKey {
      case histories
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.histories = try container.decode([History].self, forKey: .histories)
    }
}
