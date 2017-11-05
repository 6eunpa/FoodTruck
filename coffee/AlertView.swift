//
//  AlertView.swift
//  coffee
//
//  Created by eunpa6 on 2017. 10. 25..
//  Copyright © 2017년 eunpa6. All rights reserved.
//

import UIKit
import Foundation
import MIAlertController
import EMAlertController

class AlertView {

    static func AlertSheet(view: UIViewController, title: String, message: String){
    
            let alert = EMAlertController(icon: UIImage(named: "AlertIcon"), title: title, message: message)
            
            //let action1 = EMAlertAction(title: "CANCEL", style: .cancel)
            let action2 = EMAlertAction(title: "확인", style: .normal) {
                // Perform Action
            }
            
            //alert.addAction(action: action1)
            alert.addAction(action: action2)
        
        view.present(alert, animated: true, completion: nil)
    }
    
    
//    static func signUp(view: UIViewController, title: String, message: String){
//
//        let alert = EMAlertController(icon: UIImage(named: "AlertIcon"), title: title, message: message)
//
//        let action2 = EMAlertAction(title: "확인", style: .normal) {
//        }
//
//        alert.addAction(action: action2)
//
//        view.present(alert, animated: true, completion: nil)
//    }
//
//
//
//
//    static func backAlert(view: UIViewController, title: String, message: String){
//
//        var customAlertControllerConfig: MIAlertController.Config!
//        let option1 = MIAlertController.Button(title: "확인", type: .default, action: nil)
//
//        MIAlertController(
//            title: title, message: message, buttons: [option1], config: customAlertControllerConfig
//
//            ).presentOn(view)
//    }
//
//    static func socialError(view: UIViewController, title: String, message: String){
//
//        var customAlertControllerConfig: MIAlertController.Config!
//        let option1 = MIAlertController.Button(title: "확인", type: .default, action: nil)
//
//        MIAlertController(
//            title: title, message: message, buttons: [option1], config: customAlertControllerConfig
//            ).presentOn(view)
//    }
//
//    static func logOutMessage(view: UIViewController, title: String, message: String){
//        var customAlertControllerConfig: MIAlertController.Config!
//        let option1 = MIAlertController.Button(title: "확인", type: .default, action: nil)
//
//        MIAlertController(
//
//            title: title, message: message, buttons: [option1], config: customAlertControllerConfig
//
//            ).presentOn(view)
//    }
//
//    static func signError(view: UIViewController, title: String, message: String){
//
//        var customAlertControllerConfig: MIAlertController.Config!
//        let option1 = MIAlertController.Button(title: "확인", type: .default, action: nil)
//
//        MIAlertController(
//
//            title: title, message: message, buttons: [option1], config: customAlertControllerConfig
//
//            ).presentOn(view)
//    }
//
//
//    static func emailCheck(view: UIViewController, title: String, message: String){
//
//        var customAlertControllerConfig: MIAlertController.Config!
//        let option1 = MIAlertController.Button(title: "확인", type: .default, action: nil)
//
//        MIAlertController(
//
//            title: title, message: message, buttons: [option1], config: customAlertControllerConfig
//            ).presentOn(view)
//
//    }
//
//
    
    
    
    
    
    
    
}
