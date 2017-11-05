//
//  PreFoodTypeViewController.swift
//  coffee
//
//  Created by eunpa6 on 2017. 10. 30..
//  Copyright © 2017년 eunpa6. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class PreFoodTypeViewController: UIViewController {

    var customerType : String = ""
    
    
    @IBOutlet weak var koreaLabel: UIButton!
    
    @IBOutlet weak var chinaLabel: UIButton!
    
    @IBOutlet weak var japanLabel: UIButton!
    
    @IBOutlet weak var italyLabel: UIButton!
    
    @IBOutlet weak var vietnamLabel: UIButton!
    
    @IBOutlet weak var mexicoLabel: UIButton!

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        koreaLabel.setTitle("한식", for: .normal)
        koreaLabel.setTitle("한식", for: .selected)
        koreaLabel.tintColor = UIColor.white
        koreaLabel.setTitleColor(UIColor.subGray, for: .normal)
        koreaLabel.titleColor(for: .normal)
        
        chinaLabel.setTitle("중식", for: .normal)
        chinaLabel.setTitle("중식", for: .selected)
        chinaLabel.tintColor = UIColor.purple
        chinaLabel.setTitleColor(UIColor.subGray, for: .normal)
        
        japanLabel.setTitle("일본", for: .normal)
        japanLabel.setTitle("일본", for: .selected)
        japanLabel.tintColor = UIColor.purple
        japanLabel.setTitleColor(UIColor.subGray, for: .normal)
        
        italyLabel.setTitle("이태리", for: .normal)
        italyLabel.setTitle("이태리", for: .selected)
        italyLabel.tintColor = UIColor.purple
        italyLabel.setTitleColor(UIColor.subGray, for: .normal)
        
        vietnamLabel.setTitle("배트남", for: .normal)
        vietnamLabel.setTitle("배트남", for: .selected)
        vietnamLabel.tintColor = UIColor.purple
        vietnamLabel.setTitleColor(UIColor.subGray, for: .normal)
        
        mexicoLabel.setTitle("멕시코", for: .normal)
        mexicoLabel.setTitle("멕시코", for: .selected)
        mexicoLabel.tintColor = UIColor.purple
        mexicoLabel.setTitleColor(UIColor.subGray, for: .normal)
        
        // Do any additional setup after loading the view.
    }


    @IBAction func koreaButton(_ sender: UIButton) {
                sender.isSelected = !sender.isSelected
                self.customerType = "chinaButton"
    }
    @IBAction func chinaButton(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        self.customerType = "chinaButton"

    }
    
    @IBAction func japenButton(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        self.customerType = "chinaButton"

    }

    @IBAction func italyButton(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        self.customerType = "chinaButton"

    }
    
    @IBAction func vietnamButton(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        self.customerType = "chinaButton"

    }
    
    
    @IBAction func mexicoButton(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        self.customerType = "chinaButton"

    }
    
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
