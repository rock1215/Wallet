//
//  WalletViewModel.swift
//  Wallet
//
//  Created by Yansong Wang on 2022/5/23.
//

import Foundation

protocol WalletViewModelDelegate {
    func onFetchWallet()
    func onFetchWalletFailed(reason: String)
    func onFetchHistory()
    func onFetchHistoryFailed(reason: String)
}

final class WalletViewModel {
    private var delegate: WalletViewModelDelegate?
    
    private var wallets: [Wallet] = []
    private var histories: [History] = []
    private var isLoadingWallet = false
    private var isLoadingHistory = false
    
    private let client = WalletClient()
    
    var walletCount: Int {
        return self.wallets.count == 0 ? 1 : self.wallets.count
    }
    
    var historyCount: Int {
        return self.histories.count == 0 ? 1 : self.histories.count
    }
    
    init(delegate: WalletViewModelDelegate) {
        self.delegate = delegate
    }
    
    func wallet(at index: Int) -> Wallet? {
        if index < self.wallets.count {
            return self.wallets[index]
        } else {
            return .none
        }
    }
    
    func history(at index: Int) -> History? {
        if index < self.histories.count {
            return self.histories[index]
        } else {
            return .none
        }
    }
    
    func fetchWallet() {
        guard !self.isLoadingWallet else {
            return
        }
        
        self.isLoadingWallet = true
        
        self.client.fetchWallet(with: WalletRequest.wallet()) { result in
            self.isLoadingWallet = false
            
            switch(result) {
            case .failure(let error):
                self.delegate?.onFetchWalletFailed(reason: error.reason)
                break
            case .success(let response):
                self.wallets = response.wallets
                self.delegate?.onFetchWallet()
                break
            }
        }
    }
    
    func fetchHistory() {
        guard !self.isLoadingHistory else {
            return
        }
        
        self.isLoadingHistory = true
        
        self.client.fetchHistory(with: WalletRequest.history()){ result in
            self.isLoadingWallet = false
            
            switch(result) {
            case .failure(let error):
                self.delegate?.onFetchHistoryFailed(reason: error.reason)
                break
            case .success(let response):
                self.histories = response.histories
                self.delegate?.onFetchHistory()
                break
            }
        }
    }
}
