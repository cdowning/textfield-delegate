//
//  DollarSignTextFieldDelegate.swift
//  TextFields
//
//  Created by Caitlin on 8/29/18.
//  Copyright © 2018 Udacity. All rights reserved.
//

import Foundation
import UIKit

class DollarSignTextFieldDelegate: NSObject, UITextFieldDelegate {
    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let oldText = textField.text! as NSString
        var newText = oldText.replacingCharacters(in: range, with: string) // $x.xxx
        var newTextString = String(newText) // create new string variable - $x.xxx
        
        let digits = CharacterSet.decimalDigits
        var digitText = ""
        for character in (newTextString.unicodeScalars) {
            if digits.contains(UnicodeScalar(character.value)!) {
                digitText.append("\(character)")
            }
        }
        
        // Format the new string
        if let numOfPennies = Int(digitText) {
            newText = "$" + self.dollarStringFromInt(numOfPennies) + "." + self.centsStringFromInt(numOfPennies)
        } else {
            newText = "$0.00"
        }
        
        textField.text = newText
        
        return false
    }
    
    // if field is empty show $0.00
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField.text!.isEmpty {
            textField.text = "$0.00"
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
    
    // Convert Dollar String from Integer
    func dollarStringFromInt(_ value: Int) -> String {
        // return value / 100 - minus 2 decimal places
        return String(value / 100)
    }
    
    // Convert Cents String from Integer
    func centsStringFromInt(_ value: Int) -> String {
        
        // get the remainder from value
        let cents = value % 100
        var centsString = String(cents) // convert to string
        
        // Add a zero at the beginning if it's less than 10
        if cents < 10 {
            centsString = "0" + centsString
        }
        
        return centsString
    }
    
    
}
