//
//  RegistrationFormViewController.swift
//  registrationForm
//
//  Created by tosy on 20.11.22.
//

import UIKit

class RegistrationFormViewController: UIViewController {
    @IBOutlet var textFieldMail: UITextField!
    
    @IBOutlet var errorMail: UILabel!
    
    
    
    @IBOutlet var textFieldPassword: UITextField!
    
    @IBOutlet var errorPasword: UILabel!
    
    @IBOutlet var colorIndicatorPassword: [UIView]!
    
    @IBOutlet var textFieldConfirmPassword: UITextField!
    
    @IBOutlet var errorConfirm: UILabel!
    @IBOutlet var creatAcountButton: UIButton!
    
    @IBOutlet var scrollView: UIScrollView!
    
    @IBOutlet var nameTextField: UITextField!
    
    private var isValidEmail = false { didSet { buttonState() }}
    private var isConfPass = false { didSet { buttonState() }}
    private var passwordStrongs: PasswordStrongs = .veryWeak { didSet { buttonState() }}
    
    //    MARK: - Func
    func buttonState(){
        creatAcountButton.isEnabled = isValidEmail && isConfPass && passwordStrongs != .veryWeak
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        colorIndicatorPassword.forEach { view in
            view.alpha = 0.1
        }     // Do any additional setup after loading the view.
    }
    
    
    //MARK: - IBA Func
    @IBAction func emailTextField(_ sender: UITextField) {
        
        if let email = sender.text,
           !email.isEmpty,
           Specials.isValidEmail(email: email) {
            isValidEmail = true
        } else {
            isValidEmail = false
        }
        errorMail.isHidden = isValidEmail
    }
    
    @IBAction func passwordTextField(_ sender: UITextField) {
        if let passwordText = sender.text,
           !passwordText.isEmpty {
            passwordStrongs = Specials.confirmPassword(pass: passwordText)
        }
        errorPasword.isHidden = passwordStrongs != .veryWeak
        passwordIndicator()
    }
    
    @IBAction func nameTextField(_ sender: UITextField) {
        
        
        
        
        
    }
    
    
    @IBAction func confirmPasswordTextField(_ sender: UITextField) {
        if let confPassText = sender.text,
           !confPassText.isEmpty,
           let passText = textFieldPassword.text,
           !passText.isEmpty {
            isConfPass = Specials.passConfirm(pass1: passText,
                                              pass2: confPassText)
        } else {
            isConfPass = false
        }
        creatAcountButton.isEnabled = isConfPass
        
        
        
        
        
        
    }
    
    
    @IBAction func creatAccountButton(_ sender: UIButton) {
        
        
        
        
        
        
    }
    
    
    @IBAction func signIn(_ sender: UIButton) {
    }
    
    
    private func passwordIndicator() {
        for (index, view) in colorIndicatorPassword.enumerated() {
            if index <= (passwordStrongs.rawValue - 1) {
                view.alpha = 1
            } else {
                view.alpha = 0.1
            }
        }
        
        
        /*
         // MARK: - Navigation
         
         // In a storyboard-based application, you will often want to do a little preparation before navigation
         override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         // Get the new view controller using segue.destination.
         // Pass the selected object to the new view controller.
         }
         */
    }
}
