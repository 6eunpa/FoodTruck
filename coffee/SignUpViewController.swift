//
//  SignUpViewController.swift
//  coffee
//
//  Created by eunpa6 on 2017. 10. 22..
//  Copyright © 2017년 eunpa6. All rights reserved.
//

import UIKit
import Firebase

class SignUpViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var constraintToBottom: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow(_:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide(_:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        // Do any additional setup after loading the view.
    }
    
    @IBAction func SignUpBackButtonTapped(_ sender: Any) {
        if let nav = self.navigationController {
            nav.popViewController(animated: true)
        }
        
    }
    
    
    @IBAction func SignUpBtn(_ sender: Any) {
        
        guard let name = nameTextField.text, !name.isEmpty, let email = emailTextField.text, !email.isEmpty, let password = passwordTextField.text, !password.isEmpty else {
            
            AlertView.AlertSheet(view: self, title: StringDEF.EmptyField, message: StringDEF.EmptyTodo)
            return
        }
        
        AuthService.emailSignUp(userName: name, email: email, password: password, onSucess: {

            Auth.auth().currentUser?.sendEmailVerification { (error) in
                
                if error != nil {
                    print(error?.localizedDescription)
                    return
                }
            }

            
            
            
            AlertView.AlertSheet(view: self, title: StringDEF.EmailCheckHead, message: StringDEF.EmailCheckMessage)
            
            if let nav = self.navigationController {
                nav.popViewController(animated: true)
            }
            
            //MoveToVC.SwitchToMainVC(view: self, identifier: ViewIdDEF.MainVC)
            
        }) { (error) in
            AlertView.AlertSheet(view: self, title: StringDEF.SignErrorHead, message: error)
        }
    }
    
        override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            view.endEditing(true)
        }
    
        @objc func keyboardWillShow(_ notification: NSNotification) {
            print(notification)
            let keyboardFrame = (notification.userInfo?[UIKeyboardFrameEndUserInfoKey] as AnyObject).cgRectValue
            UIView.animate(withDuration: 0.3) {
                self.constraintToBottom.constant = keyboardFrame!.height
                self.view.layoutIfNeeded()
                
            }
        }
    
        @objc func keyboardWillHide(_ notification: NSNotification) {
            UIView.animate(withDuration: 0.3) {
                self.constraintToBottom.constant = 0
                self.view.layoutIfNeeded()
                
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
