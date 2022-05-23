//
//  HTTPURLResponse.swift
//  Wallet
//
//  Created by Yansong Wang on 2022/5/23.
//

import Foundation

extension HTTPURLResponse {
    var hasSuccessStatusCode: Bool {
        return 200 == statusCode
    }
}
