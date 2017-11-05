//
//  MainViewController.swift
//  coffee
//
//  Created by eunpa6 on 2017. 10. 22..
//  Copyright © 2017년 eunpa6. All rights reserved.
//

import UIKit
import FirebaseAuth

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func logOutButton(_ sender: Any) {
    
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
        
            AlertView.AlertSheet(view: self, title: StringDEF.LogOutHead, message: StringDEF.EmailCheckMessage)
            MoveToVC.SwitchToMainVC(view: self, identifier: ViewIdDEF.StartingVC)
            
//            let storyBoard = UIStoryboard(name: "Main", bundle: nil)
//            let mainVC = self.storyboard?.instantiateViewController(withIdentifier: ViewIdDEF.StartingVC) as! UIViewController
//            let appDelegate = UIApplication.shared.delegate as! AppDelegate
//            appDelegate.window?.rootViewController = mainVC
        
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
        
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
