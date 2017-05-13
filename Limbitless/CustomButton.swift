//
//  RoundButtonWithShadow.swift
//  shpe_test
//
//  Created by Sergio Perez-Aponte on 2/27/17.
//  Copyright © 2017 Sergio Perez-Aponte. All rights reserved.
//

import UIKit

@IBDesignable class CustomButton: UIButton {
    
    /*
     // Only override draw() if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func draw(_ rect: CGRect) {
     // Drawing code
     }
     */
    @IBInspectable var roundButton: Bool = false{
        didSet{
            if roundButton == true{
                self.layer.cornerRadius = frame.size.height / 2
            }
        }
    }
    
    @IBInspectable var CornerRadius: CGFloat = 0.0{
        didSet{
           self.layer.cornerRadius = CornerRadius
        }
    }
    @IBInspectable var borderWidth: CGFloat = 0.0{
        didSet{
            self.layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var borderColor: UIColor = UIColor.clear{
        
        didSet{
            self.layer.borderColor = borderColor.cgColor
            
        }
    }
    
    @IBInspectable var shadowColor: UIColor = UIColor.clear{
        didSet{
            self.layer.shadowColor = shadowColor.cgColor
        }
    }
    
    @IBInspectable var offset: CGSize{
        get{
            return layer.shadowOffset
        }
        set{
            layer.shadowOffset = newValue
        }
    }
    
    @IBInspectable var shadowRadius: CGFloat = 0.0{

        didSet{
            self.layer.shadowRadius = shadowRadius
        }
    }
    
    @IBInspectable var shadowOpacity: Float = 0.0{
       
        didSet{
            self.layer.shadowOpacity = shadowOpacity
        }
    }

}
