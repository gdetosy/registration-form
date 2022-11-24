//
//  extension.swift
//  registrationForm
//
//  Created by tosy on 24.11.22.
//

import UIKit

extension UIViewController {
    func hideClaviature() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
 
