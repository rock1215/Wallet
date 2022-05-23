//
//  WalletTableViewCell.swift
//  Wallet
//
//  Created by Yansong Wang on 2022/5/23.
//

import UIKit

class WalletTableViewCell: UITableViewCell {

    static let cell_identifier = "CellWallet"
    
    @IBOutlet weak var labelName: UILabel!
    
    @IBOutlet weak var labelAmount: UILabel!
    
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.configure(with: .none)
    }
    
    func configure(with wallet: Wallet?, errorMessage: String = "") {
        if let wallet = wallet {
            self.labelName.text = wallet.wallet_name
            self.labelAmount.text = wallet.balance
            self.labelName.alpha = 1
            self.labelAmount.alpha = 1
            self.indicator.stopAnimating()
            self.indicator.alpha = 0
        } else {
            if (errorMessage == "") {
                self.labelName.alpha = 0
                self.labelAmount.alpha = 0
                self.indicator.startAnimating()
                self.indicator.alpha = 1
            } else {
                self.labelName.text = errorMessage
                self.labelName.alpha = 1
                self.labelAmount.alpha = 0
                self.indicator.stopAnimating()
                self.indicator.alpha = 0
            }
        }
    }
}
