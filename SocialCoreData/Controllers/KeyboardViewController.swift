//
//  KeyboardViewController.swift
//  Network Social App
//
//  Created by Natanael Diego on 15/05/21.
//

import UIKit

//class KeyboardViewController: UICollectionViewController {
class KeyboardViewController: UIViewController {

    
    @IBOutlet weak var textField: UITextField! {
        didSet {
            textField.delegate = self
        }
    }
    
    @IBOutlet weak var textFieldBottomConstraint: NSLayoutConstraint! {
        didSet {
            initialValue = textFieldBottomConstraint.constant
        }
    }
    
    private var initialValue: CGFloat = 0
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardDidAppear(_:)),
                                               name: UIResponder.keyboardDidShowNotification,
                                               object: view.window)
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardDidDisapper(_:)),
                                               name: UIResponder.keyboardDidHideNotification,
                                               object: view.window)
        
        let tapGesture = UITapGestureRecognizer(target: textField, action: #selector(UITextField.resignFirstResponder))
        self.view.addGestureRecognizer(tapGesture)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc private func keyboardDidAppear(_ sender: Notification) {
        if let frame = sender.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect {
            textFieldBottomConstraint.constant = initialValue + frame.size.height
        }
    }
    
    @objc private func keyboardDidDisapper(_ sender: Notification) {
        textFieldBottomConstraint.constant = initialValue
    }
    
}

extension KeyboardViewController: UISearchTextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}
