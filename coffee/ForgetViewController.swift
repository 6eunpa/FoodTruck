//
//  ForgetViewController.swift
//  coffee
//
//  Created by eunpa6 on 2017. 10. 24..
//  Copyright © 2017년 eunpa6. All rights reserved.
//

import UIKit
import FirebaseAuth

class ForgetViewController: UIViewController {

    @IBOutlet weak var forgetTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func forgetLoginBackButtonTapped(_ sender: Any) {
        if let nav = self.navigationController {
            nav.popViewController(animated: true)
        }
    }
    
    
    @IBAction func forgetSendButtonTapped(_ sender: Any) {
        guard let email = forgetTextField.text, !email.isEmpty else {
            AlertView.AlertSheet(view: self, title: StringDEF.EmptyField, message: StringDEF.EmptyTodo)
            return
        }

        AuthService.ForgetPassword(email: email, onSuccess: {
            self.dismiss(animated: true, completion: nil)
            AlertView.AlertSheet(view: self, title: StringDEF.SignErrorHead, message: StringDEF.SignErrorMessage)
            
        }) { (error) in
      
            AlertView.AlertSheet(view: self, title: StringDEF.SignErrorHead, message: StringDEF.SignErrorMessage)
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
