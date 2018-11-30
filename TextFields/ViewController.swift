//
//  ViewController.swift
//  TextFields
//
//  Created by Jason on 11/11/14.
//  Copyright (c) 2014 Udacity. All rights reserved.
//

import UIKit

// MARK: - ViewController: UIViewController, UITextFieldDelegate

class ViewController: UIViewController, UITextFieldDelegate {

    // MARK: Outlets
    @IBOutlet weak var textField1: UITextField!
    @IBOutlet weak var textField2: UITextField!
    @IBOutlet weak var textField3: UITextField!
    @IBOutlet weak var characterCountLabel: UILabel!
    @IBOutlet weak var editingSwitch: UISwitch!
    
    
    // MARK: Text Field Delegate objects
    // EmojiTextFieldDelegate() is in /Text Field Delegates/EmojiTextFieldDelegate.swift
    let emojiDelegate = EmojiTextFieldDelegate()
    
    // colorizerDelegate() is in /Text Field Delegates/ColorizerTextFieldDelegate.swift
    let colorizerDelegate = ColorizerTextFieldDelegate()
    
    // RandomColorTextFieldDelegate() in RandomColorTextFieldDelegate.swift
    let randomColorDelegate = RandomColorTextFieldDelegate()
    
    // ZipCodeTextFieldDelegate
    let zipCodeDelegate = ZipCodeTextFieldDelegate()
    
    // CashTextFieldDelegate
    let cashFieldDelegate = CashTextFieldDelegate()
    
    // DollarSignTextFieldDelegate
    let dollarSignDelegate = DollarSignTextFieldDelegate()
    
    // MARK: Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        // set the label to be hidden
        self.characterCountLabel.isHidden = true
        
        // Set the three delegates
        self.textField1.delegate = zipCodeDelegate
        
        self.textField2.delegate = dollarSignDelegate
        //self.textField2.delegate = cashFieldDelegate
        
        //self.textField2.delegate = randomColorDelegate
        //self.textField2.delegate = colorizerDelegate
        self.textField3.delegate = self
        
        // Default to switch off
        self.editingSwitch.setOn(false, animated: false)
    }
    
    // IBAction for editing switch
    @IBAction func toggleTextInput(_ sender: Any) {
        
        // if it is not turned on
        if !(sender as! UISwitch).isOn {
            self.textField3.resignFirstResponder()
            self.textField3.text = "" // reset text to empty
        }
        
    }
    
    // Return if the switch is on or not
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        // return if toggle is on
        return self.editingSwitch.isOn
    }
    
    // MARK: Text Field Delegate Methods
    
    // func textField - Asks the delegate if the specified text should be changed. The text field calls this method whenever user actions cause its text to change. Use this method to validate text as it is typed by the user
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        // Figure out what the new text will be, if we return true
        // NSString - A static, plain-text Unicode string object that bridges to String; use NSString when you need reference semantics or other Foundation-specific behavior.
        var newText = textField.text! as NSString
        newText = newText.replacingCharacters(in: range, with: string) as NSString
        
        // hide the label if the newText will be an empty string
        self.characterCountLabel.isHidden = (newText.length == 0)
        
        // Write the length of newText into the label
        self.characterCountLabel.text = String(newText.length)
        
        // returning true gives the text field permission to change its text
        return true
    }
}

