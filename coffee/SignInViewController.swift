//
//  SignInViewController.swift
//  coffee
//
//  Created by eunpa6 on 2017. 10. 22..
//  Copyright © 2017년 eunpa6. All rights reserved.
//

import UIKit
import Firebase

class SignInViewController: UIViewController {

    @IBOutlet weak var emailTextFiled: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func emailLoginBackButton(_ sender: Any) {
        if let nav = self.navigationController {
            nav.popViewController(animated: true)
        }
    }
    

    @IBAction func signInBtn(_ sender: Any) {
        guard let email = emailTextFiled.text, !email.isEmpty, let password = passwordTextField.text, !password.isEmpty else {
            AlertView.AlertSheet(view: self, title: StringDEF.EmptyField, message: StringDEF.EmptyTodo)
            return
        }
        
        AuthService.emailSignIn(email: email, password: password, onSuccess: {
            MoveToVC.SwitchToMainVC(view: self, identifier: ViewIdDEF.MainVC)
            
            print("로그인 성공")
        }) { (error) in
            
            AlertView.AlertSheet(view: self, title: StringDEF.SignErrorHead, message: StringDEF.EmailCheckMessage)
            
        }
       
   }

    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
