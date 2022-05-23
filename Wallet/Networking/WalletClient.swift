//
//  WalletClient.swift
//  Wallet
//
//  Created by Yansong Wang on 2022/5/23.
//

import Foundation

final class WalletClient {
    private let baseURL = URL(string: "https://amock.io/api/Rock1215/")!
    
    let session: URLSession
    
    init(session: URLSession = URLSession.shared) {
        self.session = session
    }
    
    func fetchWallet(with request: WalletRequest, completion: @escaping (Result<WalletResponse, DataResponseError>) -> Void) {
        let urlRequest = URLRequest(url: baseURL.appendingPathComponent(request.path))
        
        self.session.dataTask(with: urlRequest) { data, response, error in
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.hasSuccessStatusCode, let data = data else {
                completion(Result.failure(DataResponseError.network))
                
                return
            }
            
            guard let wallets = try? JSONDecoder().decode(WalletResponse.self, from: data) else {
                completion(Result.failure(DataResponseError.decoding))
                return
            }
            
            completion(Result.success(wallets))
        }.resume()
    }
    
    func fetchHistory(with request: WalletRequest, completion: @escaping (Result<HistoryResponse, DataResponseError>) -> Void) {
        let urlRequest = URLRequest(url: baseURL.appendingPathComponent(request.path))
        
        self.session.dataTask(with: urlRequest) { data, response, error in
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.hasSuccessStatusCode, let data = data else {
                completion(Result.failure(DataResponseError.network))
                
                return
            }
            
            guard let histories = try? JSONDecoder().decode(HistoryResponse.self, from: data) else {
                completion(Result.failure(DataResponseError.decoding))
                return
            }
            
            completion(Result.success(histories))
        }.resume()
    }
}
