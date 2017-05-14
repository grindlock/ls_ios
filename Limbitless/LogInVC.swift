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

    @IBOutlet weak var email: TextFieldCustom!
    @IBOutlet weak var password: TextFieldCustom!
    @IBOutlet weak var reg_btn: CustomButton!
    @IBOutlet weak var log_btn: CustomButton!
    @IBOutlet weak var topStackView: UIStackView!
    @IBOutlet weak var topStackViewTopConstraint: NSLayoutConstraint!
    var topStackViewTopConstraintConstant:CGFloat!
    

    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //bottomConstraint = serial_code.layoutMarginsGuide.
        
        topStackViewTopConstraintConstant = topStackViewTopConstraint.constant
        print("CONSTANT  \(topStackViewTopConstraintConstant)")
        
        let dismiss: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(dismiss)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: Notification.Name.UIKeyboardWillShow, object: self.view.window)
        
         NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: Notification.Name.UIKeyboardWillHide, object: self.view.window)
   
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func dismissKeyboard(){
        view.endEditing(true)
    }
    
    func keyboardWillShow(sender: Notification){
        let userInfo = sender.userInfo
    
        let keyboardSize = (userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue
        
       let offset: CGSize = (userInfo![UIKeyboardFrameEndUserInfoKey] as! NSValue).cgRectValue.size
        
        if keyboardSize?.height == offset.height{
            if self.view.frame.origin.y == 0{
                UIView.animate(withDuration: 0.1, animations: { ()-> Void in
                    
                    self.topStackViewTopConstraint.constant -= (keyboardSize?.height)!/2
                    
                    self.view.frame.origin.y -= (keyboardSize?.height)! - self.email.frame.origin.y
                    
                    self.view.layoutIfNeeded()
                })
            }
        }else{
            UIView.animate(withDuration: 0.1, animations: {() -> Void in
            
            self.topStackViewTopConstraint.constant += (keyboardSize?.height)! - offset.height
            self.view.frame.origin.y += (keyboardSize?.height)! - offset.height})
            self.view.layoutIfNeeded()
        }
                   // self.topStackViewTopConstraint.constant = 16 - keyboardSize.height
                   // self.view.layoutIfNeeded()
                
        
        
        
        print(self.view.frame.origin.y)
    }
    
    func keyboardWillHide(sender: Notification){
         let userInfo = sender.userInfo
        
        let keyboardSize: CGSize = (userInfo![UIKeyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue.size
        
        if self.view.frame.origin.y != 0{
            self.view.frame.origin.y += keyboardSize.height
            self.topStackViewTopConstraint.constant = topStackViewTopConstraintConstant //+= keyboardSize.height * 2
            self.view.layoutIfNeeded()
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        NotificationCenter.default.removeObserver(self, name: Notification.Name.UIKeyboardWillShow, object: self.view.window)
         NotificationCenter.default.removeObserver(self, name: Notification.Name.UIKeyboardWillHide, object: self.view.window)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool{
        if let nextTextField = textField.superview?.viewWithTag(textField.tag + 1) as? UITextField{
            nextTextField.becomeFirstResponder()
        }
        else{
            textField.resignFirstResponder()
        }
        return false
    }
    
    /*func textFieldDidBeginEditing(_ textField: UITextField) {
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
    }*/
}

