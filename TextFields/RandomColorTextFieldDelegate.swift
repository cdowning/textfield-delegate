//
//  RandomColorTextFieldDelegate.swift
//  TextFields
//
//  Created by Caitlin on 8/29/18.
//  Copyright © 2018 Udacity. All rights reserved.
//

import Foundation
import UIKit

// subclass NSObject
// declaring UITextFieldDelegate protocol
class RandomColorTextFieldDelegate: NSObject, UITextFieldDelegate {
    
    
    let colors:[UIColor] = [.red, .orange, .yellow, .green, .blue, .purple, .brown]
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {

        textField.textColor = randomColor()
        return true
    }
    
    
    func randomColor() -> UIColor {
        let randomIndex = Int(arc4random() % UInt32(colors.count))
        
        return colors[randomIndex]
        
        // return a random color not in an array
        // let hue : CGFloat = CGFloat(arc4random() % 256) / 256 // use 256 to get full range from 0.0 to 1.0
        //let saturation : CGFloat = CGFloat(arc4random() % 128) / 256 + 0.5 // from 0.5 to 1.0 to stay away from white
        //let brightness : CGFloat = CGFloat(arc4random() % 128) / 256 + 0.5 // from 0.5 to 1.0 to stay away from black
        //return UIColor(hue: hue, saturation: saturation, brightness: brightness, alpha: 1)
    }
    
}
