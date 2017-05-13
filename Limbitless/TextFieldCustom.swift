//
//  TextFieldCustom.swift
//  shpe_test
//
//  Created by Sergio Perez-Aponte on 2/27/17.
//  Copyright © 2017 Sergio Perez-Aponte. All rights reserved.
//

import UIKit
import QuartzCore


@IBDesignable class TextFieldCustom: UITextField {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.masksToBounds = true
        //self.clipsToBounds = true
    }
    

    @IBInspectable var roundButton: Bool = false{
        didSet{
            if roundButton == true{
                self.layer.cornerRadius = frame.size.height / 2
            }
        }
    }
        
        @IBInspectable var cornerRadius: CGFloat{
            get{
                return layer.cornerRadius
            }
            set{
                layer.cornerRadius = newValue
            }
        }
    @IBInspectable var masksToBounds:Bool{
        get{
            return false
        }
        set{
            layer.masksToBounds = newValue
        }
    }
        @IBInspectable var borderWidth: CGFloat{
            get{
                return layer.borderWidth
            }
            set{
                layer.borderWidth = newValue
            }
        }
        
        @IBInspectable var borderColor: UIColor{
            get{
                return UIColor.black
            }
            set{
                layer.borderColor = newValue.cgColor
                
            }
    }
    
    @IBInspectable var shadowColor: UIColor{
        get{
            return UIColor.black
        }
        set{
            layer.shadowColor = newValue.cgColor
            
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
