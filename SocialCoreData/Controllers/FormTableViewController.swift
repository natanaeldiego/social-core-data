//
//  FormTableViewController.swift
//  Network Social App
//
//  Created by Natanael Diego on 16/05/21.
//

import UIKit

class FormTableViewController: UITableViewController {

    @IBOutlet weak var nameField: UITextField!
    
    @IBOutlet weak var emailField: UITextField!
    
    @IBOutlet weak var senhaField: UITextField!
    
    @IBOutlet weak var checkPassword: UITextField!
    
    
    @IBOutlet var textField: [UITextField]! {
        didSet {
            textField.forEach { textFiel in
                textFiel.delegate = self
            }
        }
    }
}

extension FormTableViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        if textField == nameField {
            emailField.becomeFirstResponder()
        }
        if textField == emailField {
            senhaField.becomeFirstResponder()
        }
        if textField == senhaField {
            checkPassword.becomeFirstResponder()
        }
        
        return true
    }
}
