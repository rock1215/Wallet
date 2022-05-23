//
//  HistoryTableViewCell.swift
//  Wallet
//
//  Created by Yansong Wang on 2022/5/23.
//

import UIKit

class HistoryTableViewCell: UITableViewCell {

    static let cell_identifier = "CellHistory"
    
    @IBOutlet weak var labelState: UILabel!
    
    @IBOutlet weak var labelAmount: UILabel!
    
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func prepareForReuse() {
        
    }
    
    func configure(with history: History?, errorMessage: String = "") {
        if let history = history {
            self.labelState.text = history.received ? "You've received payment" : "You've cashed out to \(history.recipient)"
            self.labelAmount.text = "\(history.received ? "" : "-")\(history.amount) \(history.currency)"
            self.labelState.alpha = 1
            self.labelAmount.alpha = 1
            self.indicator.stopAnimating()
            self.indicator.alpha = 0
        } else {
            if (errorMessage == "") {
                self.labelState.alpha = 0
                self.labelAmount.alpha = 0
                self.indicator.startAnimating()
                self.indicator.alpha = 1
            } else {
                self.labelState.text = errorMessage
                self.labelState.alpha = 1
                self.labelAmount.alpha = 0
                self.indicator.stopAnimating()
                self.indicator.alpha = 0
            }
        }
    }
}
