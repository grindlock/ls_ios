//
//  ViewController.swift
//  Limbitless
//
//  Created by Sergio Perez-Aponte on 5/4/17.
//  Copyright © 2017 Limbitless Solutions. All rights reserved.
//

import UIKit
import Foundation

class LogInVC: UIViewController {

    @IBOutlet weak var scroll_view: UIScrollView!
    @IBOutlet weak var serial_code: UITextField!
    @IBOutlet weak var email: TextFieldCustom!
    @IBOutlet weak var password: TextFieldCustom!
    @IBOutlet weak var reg_btn: CustomButton!
    @IBOutlet weak var log_btn: CustomButton!
    
    weak var bottomConstraint:NSLayoutConstraint?
    weak var active_field: UITextField?
    
    
    
    
    
    
    //weak var activeField: UITextField?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //bottomConstraint = serial_code.layoutMarginsGuide.
        
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
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    //move the textfield when keyboard cover them
    func handle_keyboard(notification: Notification){
        
        if let userInfo = notification.userInfo{
            
            let keyboard_size = (userInfo[UIKeyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
            
          
            
            let isKeyboardShowing = notification.name == Notification.Name.UIKeyboardWillShow
            
            let ori = active_field?.frame.origin.y
         
            
            if self.active_field?.tag == 0{
                self.active_field?.frame.origin.y = isKeyboardShowing ? keyboard_size.origin.y - (self.active_field?.frame.height)! - 15 : ori!
            }
            
            if self.active_field?.tag == 1{
                 self.active_field?.frame.origin.y = isKeyboardShowing ? keyboard_size.origin.y - (self.active_field?.frame.height)! - 15 : ori!
                //self.serial_code?.frame.origin.y = (self.active_field?.frame.origin.y)! - 70
                if !self.serial_code.isHidden{
                    self.serial_code.isHidden = true
                }
                else{
                    self.serial_code.isHidden = false
                }
            }
            else if (self.active_field?.tag == 2){
                 self.active_field?.frame.origin.y = isKeyboardShowing ? keyboard_size.origin.y - (self.active_field?.frame.height)! - 15 : ori!
                
                self.email?.frame.origin.y = (self.active_field?.frame.origin.y)! - ((self.email?.frame.height)! + 30)
                
                self.serial_code?.frame.origin.y = (self.email?.frame.origin.y)!  - ((self.serial_code?.frame.height)! + 30)
                
            }
            
            UIView.animate(withDuration: 0, delay: 0, options: UIViewAnimationOptions.curveEaseOut, animations: {
                self.view.layoutIfNeeded()
            }, completion: { (completed) in
                
                //scrool the other things in the view
                
                
            })
            
            
            
        }
    }
}

