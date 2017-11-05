//
//  StartingViewController.swift
//  coffee
//
//  Created by eunpa6 on 2017. 10. 22..
//  Copyright © 2017년 eunpa6. All rights reserved.
//

import UIKit
import Firebase
import GoogleSignIn
import FBSDKLoginKit
import EMAlertController

class StartingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        GIDSignIn.sharedInstance().delegate = self
        GIDSignIn.sharedInstance().uiDelegate = self
        print(UserDefaults.standard.object(forKey: "type"))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func facebookSigninBtnTapped(_ sender: Any) {
        
        let fbLoginManager = FBSDKLoginManager()
        fbLoginManager.logIn(withReadPermissions: ["email","public_profile","user_friends"], from: self) { (result, error) in
            
            if error != nil {
                AlertView.AlertSheet(view: self, title: StringDEF.SignErrorHead, message: StringDEF.SignErrorHead)
                return
                
            } else if result!.isCancelled {
                fbLoginManager.logOut()
            }
            
            guard (FBSDKAccessToken.current()) != nil else {
                print(error!.localizedDescription)
                return
            }

            AuthService.facebookLogin(onSuccess: {
            MoveToVC.SwitchToMainVC(view: self, identifier: ViewIdDEF.MainVC)
                
            }, onError: { (error) in
                print(error)
            })
            
        }
        
        
    }
    
    
    @IBAction func googleSigninBtnTapped(_ sender: Any) {
        GIDSignIn.sharedInstance().signIn()
    }
}

extension StartingViewController: GIDSignInDelegate, GIDSignInUIDelegate {

    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
    
        if error != nil {            
            AlertView.AlertSheet(view: self, title: StringDEF.ErrorHead, message: error.localizedDescription)
            return
        }
        
        guard let authentication = user.authentication else {
            return
        }

        AuthService.googleLogin(authenticaion: authentication, onSuccess: {
        MoveToVC.SwitchToMainVC(view: self, identifier: ViewIdDEF.MainVC)
            
        }) { (error) in
            print(error)
            
        }

    }
    
    func sign(_ signIn: GIDSignIn!, didDisconnectWith user: GIDGoogleUser!, withError error: Error!) {
    }
    
}






