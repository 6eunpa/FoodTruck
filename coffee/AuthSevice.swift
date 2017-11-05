//
//  AuthSevice.swift
//  coffee
//
//  Created by eunpa6 on 2017. 10. 22..
//  Copyright © 2017년 eunpa6. All rights reserved.
//

import Foundation
import Firebase
import GoogleSignIn
import FBSDKLoginKit
import SVProgressHUD
import FirebaseDatabase

class AuthService {
    
    
    // gjfghjkjhjkhhljlhklkhlkhklhlhkhlkjlh
    static func googleLogin(authenticaion: GIDAuthentication, onSuccess: @escaping () -> Void, onError: @escaping (_ errorMessage: String) -> Void) {

        let credential = GoogleAuthProvider.credential(withIDToken: authenticaion.idToken, accessToken: authenticaion.accessToken)
        Auth.auth().signIn(with: credential) { (user, error) in
            
            if error != nil {
                onError(error!.localizedDescription)
                return
            }
            onSuccess()
        }
        
    }
    
    static func facebookLogin(onSuccess: @escaping () -> Void, onError: @escaping (_ errorMessage: String) -> Void ){
        
        let credential = FacebookAuthProvider.credential(withAccessToken: FBSDKAccessToken.current().tokenString)
        Auth.auth().signIn(with: credential) { (user, error) in
            
            if error != nil {
                onError(error!.localizedDescription)
                return
            }
            onSuccess()
        }
        
    }
    
    static func emailSignUp(userName: String, email: String, password: String, onSucess: @escaping () -> Void, onError: @escaping (_ errorMessage: String) -> Void  ) {
    
        SVProgressHUD.show()
        Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
            
            if error != nil {
                
                onError(error!.localizedDescription)
                SVProgressHUD.dismiss()
                return
        
            }

            DispatchQueue.main.async {
                
                user?.sendEmailVerification(completion: { (err) in
                    
                    if err != nil {
                        
                        print(err!.localizedDescription)
                        return
                    }
                    
                    onSucess()
                    
                })
                
            }


//            SetUserInfomtion(email: email, userName: userName, uid: user!.uid, onSuccess: {
//
//                onSucess()
//
//            })

            SVProgressHUD.dismiss()
            
        }
    
    }
    
    static func emailSignIn(email: String, password: String, onSuccess: @escaping () -> Void, onError: @escaping (_ errorMessage: String) -> Void ) {
    
        SVProgressHUD.show()
        Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
            
            if error != nil {
                onError(error!.localizedDescription)
                SVProgressHUD.dismiss()
                return
            }

            user?.reload(completion: { (err) in
                
                if self.checkUserValidate(user: user!) {
                    
                    print("체크 이메일 성공")
                    onSuccess()
                    return
                }
                
            })

                print("이메일 확인 안됨!!!!!")

            
            SVProgressHUD.dismiss()
            
        }
    
    }
    
    static func ForgetPassword(email: String, onSuccess: @escaping () -> Void, onError: @escaping (_ errorMessage: String) -> Void ){
        
        Auth.auth().sendPasswordReset(withEmail: email) { (error) in
        
            if error != nil  {
                
                onError(error!.localizedDescription)
                return
            }
            
            onSuccess()
            
        }
        
    }
    
   static func SetUserInfomtion(email: String, userName: String, uid: String, onSuccess: @escaping () -> Void ){
    
        let ref = Database.database().reference()
        let userReference = ref.child("users")
        let newUserRef = userReference.child(uid)
        newUserRef.setValue(["email": email, "userName": userName])
    
        onSuccess()
    
    }

    static func checkUserValidate(user: User) -> Bool {
    
        return user.isEmailVerified
    
    }
    
}





