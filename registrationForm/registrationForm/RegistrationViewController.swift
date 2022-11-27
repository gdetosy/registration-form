//
//  RegistrationViewController.swift
//  registrationForm
//
//  Created by tosy on 20.11.22.
//

import UIKit

final class RegistrationViewController: UIViewController {
    
    @IBOutlet weak var emailTextF: UITextField!
    
    @IBOutlet weak var passTextF: UITextField!
    
    @IBOutlet weak var errorLbl: UILabel!
    
    @IBOutlet weak var signInButton: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideClaviature()
//        if let _ = UserService.getUserModel(){
//            performSegue(withIdentifier: "goToMainTBVC", sender: nil)
//        }
    }
//    override func viewWillAppear(_ animated: Bool) {
//        emailTextF.text = ""
//        passTextF.text = ""
//    }
    
    
    @IBAction func signIn() {
errorLbl.isHidden = false
        guard let email = emailTextF.text,
              let pass = passTextF.text,
              let userModel = UserService.getUserModel(),
              email == userModel.email,
              pass == userModel.password
        else {
            errorLbl.isHidden = false
            return
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

