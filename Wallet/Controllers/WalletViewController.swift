//
//  WalletViewController.swift
//  Wallet
//
//  Created by Yansong Wang on 2022/5/23.
//

import UIKit

class WalletViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    private var viewModel: WalletViewModel!
    
    private var errorWallet = ""
    private var errorHistory = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.viewModel = WalletViewModel(delegate: self)
        
        self.viewModel.fetchWallet()
        self.viewModel.fetchHistory()
    }
}

extension WalletViewController: WalletViewModelDelegate {
    func onFetchWallet() {
        self.errorWallet = ""
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func onFetchWalletFailed(reason: String) {
        self.errorWallet = reason
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func onFetchHistory() {
        self.errorHistory = ""
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func onFetchHistoryFailed(reason: String) {
        self.errorHistory = reason
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}

extension WalletViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return self.viewModel.walletCount
        } else {
            return self.viewModel.historyCount
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = self.tableView.dequeueReusableCell(withIdentifier: WalletTableViewCell.cell_identifier, for: indexPath) as! WalletTableViewCell
            
            cell.configure(with: self.viewModel.wallet(at: indexPath.row), errorMessage: self.errorWallet)
            return cell
        } else {
            let cell = self.tableView.dequeueReusableCell(withIdentifier: HistoryTableViewCell.cell_identifier, for: indexPath) as! HistoryTableViewCell
            
            cell.configure(with: self.viewModel.history(at: indexPath.row), errorMessage: self.errorHistory)
            
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "My Wallets"
        } else {
            return "History"
        }
    }
}

extension WalletViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.tableView.deselectRow(at: indexPath, animated: true)
        if indexPath.section == 1, let history = self.viewModel.history(at: indexPath.row) {
            let detailVC = self.storyboard?.instantiateViewController(withIdentifier: HistoryDetailViewController.identifier) as! HistoryDetailViewController
            
            detailVC.history = history
            
            self.navigationController?.pushViewController(detailVC, animated: true)
        }
    }
}


