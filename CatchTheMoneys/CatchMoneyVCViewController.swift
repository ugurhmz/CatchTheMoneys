//
//  CatchMoneyVCViewController.swift
//  CatchTheMoneys
//
//  Created by ugur-pc on 6.02.2022.
//

import UIKit

class CatchMoneyVCViewController: UIViewController {
    
    // variables
    var timer = Timer()
    var sumCaughtMoneys = 0
    var hideTimer = Timer()
    var highestCaughtMoneys = 0
    
    
    
    // labels
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var moneyCaughtLabel: UILabel!
    @IBOutlet weak var highestMoneyLabel: UILabel!
    
    
    
    // 1. row moneys
    @IBOutlet weak var ten1Dollars: UIImageView!
    @IBOutlet weak var five1Dollars: UIImageView!
    @IBOutlet weak var hundred1Dollars: UIImageView!
    
    // 2. row moneys
    @IBOutlet weak var ten2Dollars: UIImageView!
    @IBOutlet weak var five2Dollars: UIImageView!
    @IBOutlet weak var hundred2Dollars: UIImageView!
    
    // 3. row moneys
    @IBOutlet weak var ten3Dollars: UIImageView!
    @IBOutlet weak var five3Dollars: UIImageView!
    @IBOutlet weak var hundred3Dollars: UIImageView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        moneyCaughtLabel.text = "Caught Moneys : \(sumCaughtMoneys)"
        
        let storedHighestCaughtMoneys = UserDefaults.standard.object(forKey: "highestMoneys")
        
        
        if storedHighestCaughtMoneys == nil {
            highestCaughtMoneys = 0
            highestMoneyLabel.text = "HighestMoneys : \(highestCaughtMoneys)"
        }
        
        
        if let newSumCaughtMoneys = storedHighestCaughtMoneys as? Int {
            highestCaughtMoneys = newSumCaughtMoneys
            highestMoneyLabel.text = "Caught Moneys : \(highestCaughtMoneys)"
        }
        
        
        // IMAGES
        ten1Dollars.isUserInteractionEnabled = true
        five1Dollars.isUserInteractionEnabled = true
        hundred1Dollars.isUserInteractionEnabled = true
        
        ten2Dollars.isUserInteractionEnabled = true
        five2Dollars.isUserInteractionEnabled = true
        hundred2Dollars.isUserInteractionEnabled = true
        
        ten3Dollars.isUserInteractionEnabled = true
        five3Dollars.isUserInteractionEnabled = true
        hundred3Dollars.isUserInteractionEnabled = true
        
        
        
        let recognizerTen1 = UITapGestureRecognizer(target: self, action : #selector(addTenMoney))
        
        let recognizerFive1 = UITapGestureRecognizer(target: self, action : #selector(addFiveMoney))
        
        let recognizerHunred1 = UITapGestureRecognizer(target: self, action : #selector(addHundredMoney))
        
        
        
        
        
        
    }
    
    // add 10
    @objc func addTenMoney() {
        sumCaughtMoneys += 10
        self.moneyCaughtLabel.text = "Sum Moneys : \(sumCaughtMoneys)"
    }
    
                                                       
    // add 5
    @objc func addFiveMoney() {
        sumCaughtMoneys += 5
        moneyCaughtLabel.text = "Sum Moneys : \(sumCaughtMoneys)"
    }
        

  // add 100
    @objc func addHundredMoney() {
        sumCaughtMoneys += 5
        moneyCaughtLabel.text = "Sum Moneys : \(sumCaughtMoneys)"
    }

}
