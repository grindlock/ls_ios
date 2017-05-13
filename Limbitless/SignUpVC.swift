//
//  SignUpVC.swift
//  Limbitless
//
//  Created by Sergio Perez-Aponte on 5/10/17.
//  Copyright © 2017 Sergio Perez-Aponte. All rights reserved.
//

import Foundation
import UIKit

class SignUpVC: UIViewController{
    
    @IBOutlet weak var serial_code: TextFieldCustom!
    @IBOutlet weak var email: TextFieldCustom!
    @IBOutlet weak var password: TextFieldCustom!
    @IBOutlet weak var reg_btn: CustomButton!
    @IBOutlet weak var close: CustomButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func cancelRegistration(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func createUserAccount(_ sender: Any) {
        
    }
    
    
}
