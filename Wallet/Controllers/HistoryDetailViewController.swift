//
//  HistoryDetailViewController.swift
//  Wallet
//
//  Created by Yansong Wang on 2022/5/23.
//

import UIKit

class HistoryDetailViewController: UIViewController {

    static let identifier = "historyVC"
    
    @IBOutlet weak var labelState: UILabel!
    
    @IBOutlet weak var labelSendReceive: UILabel!
    
    @IBOutlet weak var labelSender: UILabel!
    
    @IBOutlet weak var labelAmount: UILabel!
    
    @IBOutlet weak var buttonBack: UIButton!
    
    
    var history: History?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.buttonBack.layer.borderColor = UIColor.black.cgColor
        self.buttonBack.layer.borderWidth = 1
        self.navigationItem.hidesBackButton = true
        
        self.title = "History Detail"
        
        self.configure()
    }
    
    func configure() {
        if let history = history {
            self.labelState.text = history.received ? "You've received payment" : "You've cashed out to \(history.recipient)"
            self.labelSendReceive.text = history.received ? "Sender" : "Receiver"
            self.labelSender.text = history.received ? history.sender : history.recipient
            self.labelAmount.text = "\(history.received ? "" : "-")\(history.amount) \(history.currency)"
        }
    }
    
    
    @IBAction func actionBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
