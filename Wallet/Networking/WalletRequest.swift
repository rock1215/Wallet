//
//  WalletRequest.swift
//  Wallet
//
//  Created by Yansong Wang on 2022/5/23.
//

import Foundation

struct WalletRequest {
    let path: String
  
    private init(path: String) {
        self.path = path
    }
}

extension WalletRequest {
    
    static func from(path: String) -> WalletRequest {
        return WalletRequest(path: path)
    }
    
    static func wallet() -> WalletRequest {
        return WalletRequest(path: "wallets")
    }
    
    static func history() -> WalletRequest {
        return WalletRequest(path: "histories")
    }
    
    static func error() -> WalletRequest {
        return WalletRequest(path: "errors")
    }
}
