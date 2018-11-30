//
//  CashTextFieldDelegate.swift
//  TextFields
//
//  Created by Caitlin on 8/30/18.
//  Copyright © 2018 Udacity. All rights reserved.
//

import Foundation
import UIKit

class CashTextFieldDelegate: NSObject, UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        // Construct the text that will be in the field if this change is accepted
        let oldText = textField.text! as NSString
        var newText = oldText.replacingCharacters(in: range, with: string)
        var newTextString = String(newText)
        
        let digits = CharacterSet.decimalDigits
        var digitText = ""
        
        for c in newTextString.unicodeScalars {
            if digits.contains(UnicodeScalar(c.value)!) {
                digitText.append("\(c)")
            }
        }
    
        let formatter = NumberFormatter()
        formatter.numberStyle = NumberFormatter.Style.currency
        formatter.locale = Locale(identifier: "en_US")
    
        var numberFromField = (NSString(string: digitText).doubleValue)/100
    
        textField.text = newText
    
        return false
    }
    
}
