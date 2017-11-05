//
//  ChangeVC.swift
//  coffee
//
//  Created by eunpa6 on 2017. 10. 22..
//  Copyright © 2017년 eunpa6. All rights reserved.
//
import UIKit
import Foundation

class MoveToVC {
    
    static func SwitchToMainVC(view: UIViewController, identifier: String){
        
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let mainVC = storyBoard.instantiateViewController(withIdentifier: identifier)
        let appledelegate = UIApplication.shared.delegate as! AppDelegate
        appledelegate.window?.rootViewController = mainVC
        
    }
    
    
    
}
