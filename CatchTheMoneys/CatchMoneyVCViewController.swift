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
    var moneyArr = [UIImageView]()
    var counter = 0
    
    
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
        

        let recognizerTen2 = UITapGestureRecognizer(target: self, action : #selector(addTenMoney))
        let recognizerFive2 = UITapGestureRecognizer(target: self, action : #selector(addFiveMoney))
        let recognizerHunred2 = UITapGestureRecognizer(target: self, action : #selector(addHundredMoney))
        
        let recognizerTen3 = UITapGestureRecognizer(target: self, action : #selector(addTenMoney))
        let recognizerFive3 = UITapGestureRecognizer(target: self, action : #selector(addFiveMoney))
        let recognizerHunred3 = UITapGestureRecognizer(target: self, action : #selector(addHundredMoney))
        
        
        
        // 1.row gesture
        ten1Dollars.addGestureRecognizer(recognizerTen1)
        five1Dollars.addGestureRecognizer(recognizerFive1)
        hundred1Dollars.addGestureRecognizer(recognizerHunred1)
        
        
        // 2.row gesture
        ten2Dollars.addGestureRecognizer(recognizerTen2)
        five2Dollars.addGestureRecognizer(recognizerFive2)
        hundred2Dollars.addGestureRecognizer(recognizerHunred2)
        
        
        // 3.row gesture
        ten3Dollars.addGestureRecognizer(recognizerTen3)
        five3Dollars.addGestureRecognizer(recognizerFive3)
        hundred3Dollars.addGestureRecognizer(recognizerHunred3)
        
        
        
        // money array
        moneyArr = [ten1Dollars, five1Dollars, hundred1Dollars,
                    ten2Dollars, five2Dollars, hundred2Dollars,
                    ten3Dollars, five3Dollars, hundred3Dollars,
        ]
        
        
        
        // TIMERS
        counter = 10
        timeLabel.text = String(counter)
        
        timer = Timer.scheduledTimer(timeInterval: 1,
                                     target: self,
                                     selector: #selector(timerCount),
                                     userInfo: nil,
                                     repeats: true)
        
        
        hideTimer = Timer.scheduledTimer(timeInterval: 0.4,
                                         target: self,
                                         selector : #selector(hideMoneyImages),
                                         userInfo: nil, repeats: true)
        
        
        hideMoneyImages()
        
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
        sumCaughtMoneys += 100
        moneyCaughtLabel.text = "Sum Moneys : \(sumCaughtMoneys)"
    }
    
    
    
    
    // Random Money visible
    @objc func hideMoneyImages(){
        
        for item in moneyArr {
            item.isHidden = true
        }
        
        
        // Select random money
        let randomMoney = Int(arc4random_uniform(UInt32(moneyArr.count - 1)))
        moneyArr[randomMoney].isHidden = false
        
    }
    
    
    
    
    
    // Timer func
    @objc func timerCount() {
        counter -= 1
        timeLabel.text = String(counter)
        
        
        if counter == 0 {
            timer.invalidate()
            hideTimer.invalidate()
            
            
            
            for mon in moneyArr {
                mon.isHidden = true // Tüm ImageView'lar kapalı, yukarda counter -> 0
            }
            
            
            
            // sum caught money check
            if self.sumCaughtMoneys > self.highestCaughtMoneys {
                self.highestCaughtMoneys = self.sumCaughtMoneys
                highestMoneyLabel.text = "CaughtHighest Money : \(self.highestCaughtMoneys)"
                UserDefaults.standard.set(self.highestCaughtMoneys, forKey: "highestMoneys")
            }
            
            
            // Alert
            let alert = UIAlertController(title: "Times Up!",
                                          message: "play Again ? ",
                                          preferredStyle: UIAlertController.Style.alert)
            
            
            let noBtn = UIAlertAction(title: "No",
                                       style: UIAlertAction.Style.cancel, handler: nil)
            
            
            let againBtn = UIAlertAction(title: "Again",
                                         style: UIAlertAction.Style.default) { (UIAlertAction) in
                
                
                self.sumCaughtMoneys = 0
                self.moneyCaughtLabel.text = "Sum Moneys : \(self.sumCaughtMoneys)"
                self.counter = 10
                
                self.timeLabel.text = String(self.counter)
                
                
                self.timer = Timer.scheduledTimer(timeInterval: 1,
                                                  target: self,
                                                  selector: #selector(self.timerCount),
                                                  userInfo: nil,
                                                  repeats: true)
                
                
                
                self.hideTimer = Timer.scheduledTimer(timeInterval: 0.4,
                                                      target: self,
                                                      selector: #selector(self.hideMoneyImages),
                                                      userInfo: nil, repeats: true)
                
                
            }
            
            alert.addAction(noBtn)
            alert.addAction(againBtn)
            self.present(alert, animated: true, completion: nil)
            
            
        }
    }
    
    

}
