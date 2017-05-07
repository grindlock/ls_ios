//
//  ViewController.swift
//  Limbitless
//
//  Created by Sergio Perez-Aponte on 5/4/17.
//  Copyright © 2017 Sergio Perez-Aponte. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {

    @IBOutlet weak var scroll_view: UIScrollView!
    @IBOutlet weak var serial_code: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var log_reg_btn: UIButton!
    
    weak var bottomConstraint:NSLayoutConstraint?
    weak var active_field: UITextField?
    
    
    
    
    
    
    //weak var activeField: UITextField?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        NotificationCenter.default.addObserver(self, selector: #selector(handle_keyboard(notification:)), name: Notification.Name.UIKeyboardWillShow, object: nil)
        
         NotificationCenter.default.addObserver(self, selector: #selector(handle_keyboard(notification:)), name: Notification.Name.UIKeyboardWillHide, object: nil)
   
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        active_field = textField
        
        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        active_field = nil
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func handle_keyboard(notification: Notification){
        if let userInfo = notification.userInfo{
            let keyboard_size = userInfo[UIKeyboardFrameEndUserInfoKey] as? CGRect
            let isKeyboardShowing = notification.name == Notification.Name.UIKeyboardWillShow
            
            //self.view.frame = CGRect(x: self.view.frame.origin.x, y: self.view.frame.origin.y, width: self.view.frame.width, height: isKeyboardShowing ? (self.view.window?.frame.origin.y)! + (self.view.window?.frame.height)! - ((active_field?.frame.origin.y)! + (keyboard_size?.height)!): self.view.frame.height + (keyboard_size?.height)!)
            
            let ori = active_field?.frame.origin.y
            
            active_field?.frame.origin.y = isKeyboardShowing ? (keyboard_size?.height)! : ori!
                
            
            
            UIView.animate(withDuration: 0, delay: 0, options: UIViewAnimationOptions.curveEaseOut, animations: {
                self.view.layoutIfNeeded()
            }, completion: { (completed) in
                
                //scrool the other things in the view
                if self.active_field?.tag == 1{
                    self.serial_code?.frame.origin.y = (self.active_field?.frame.origin.y)! - 70
                }
                
                
            })
            
            
            
        }
    }
    
//(self.view.window?.frame.height)!
}

