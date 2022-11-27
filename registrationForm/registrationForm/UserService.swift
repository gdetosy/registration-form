//
//  UserService.swift
//  registrationForm
//
//  Created by tosy on 27.11.22.
//

import Foundation
 class UserService {
    
    static func saveUserModel(userModel: User) {
        UserDefaults.standard.set(userModel.name,
                                  forKey: UserDefaults.Keys.name.rawValue)
        UserDefaults.standard.set(userModel.email,
                                  forKey: UserDefaults.Keys.email.rawValue)
        UserDefaults.standard.set(userModel.password,
                                  forKey: UserDefaults.Keys.password.rawValue)
    }

    static func getUserModel() -> User? {
        let name = UserDefaults.standard.string(forKey: UserDefaults.Keys.name.rawValue)
        guard let email = UserDefaults.standard.string(forKey: UserDefaults.Keys.email.rawValue),
              let password = UserDefaults.standard.string(forKey: UserDefaults.Keys.password.rawValue)
        else {
            return nil
        }
        let userModel = User(name: name, email: email, password: password)
        return userModel
    }

    static func cleanUserDafauls() {
        UserDefaults.standard.reset()
    }

}
