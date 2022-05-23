//
//  Result.swift
//  Wallet
//
//  Created by Yansong Wang on 2022/5/23.
//

import Foundation

enum Result<T, U: Error> {
    case success(T)
    case failure(U)
}
