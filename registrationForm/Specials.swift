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
        static let weakRegex          = "^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{8,}$"
            static let notVeryWeakRegex   = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)[a-zA-Z\\d]{8,}$"
            static let notVeryStrongRegex = "^(?=.*[A-Za-z])(?=.*\\d)(?=.*[$@$!%*#?&])[A-Za-z\\d$@$!%*#?&]{8,}$"
            static let strongRegex        = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[d$@$!%*?&#])[A-Za-z\\dd$@$!%*?&#]{8,}"
            
    static func confirmPassword(pass: String) -> PasswordStrongs {
        if NSPredicate(format: "SELF MATCHES %@", strongRegex).evaluate(with: pass) {
            return .strong
        } else if NSPredicate(format: "SELF MATCHES %@", notVeryStrongRegex).evaluate(with: pass) {
            return .notVeryStrong
        } else if NSPredicate(format: "SELF MATCHES %@", notVeryWeakRegex).evaluate(with: pass) {
            return .notVeryWeak
        } else if NSPredicate(format: "SELF MATCHES %@", weakRegex).evaluate(with: pass) {
            return .weak
        } else {
            return .veryWeak
        }
    }
        
    static func passConfirm(pass1: String, pass2: String)->Bool {
        pass1 == pass2
    }
        
    }
    
    
    

