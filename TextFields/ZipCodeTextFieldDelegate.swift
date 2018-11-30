//
//  ZipCodeTextFieldDelegate.swift
//  TextFields
//
//  Created by Caitlin on 8/29/18.
//  Copyright © 2018 Udacity. All rights reserved.
//

import Foundation
import UIKit

class ZipCodeTextFieldDelegate: NSObject, UITextFieldDelegate {
    
    let maxLength = 5
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        var newText = textField.text! as NSString
        newText = newText.replacingCharacters(in: range, with: string) as NSString
        
        let currentLength = newText.length
        
        if currentLength > maxLength {
            return false
        } else {
            return true
        }
        
    }
    
    
}
