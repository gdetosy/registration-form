//
//  Specials.swift
//  registrationForm
//
//  Created by tosy on 21.11.22.
//

import Foundation
enum PasswordStrongs: Int {
    case veryWeak
    case weak
    case notVeryWeak
    case notVeryStrong
    case strong
}

final class Specials {

    static func isValidEmail(email: String) -> Bool {
            let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
            let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
            return emailPred.evaluate(with: email)
        }
    
    
    
}
