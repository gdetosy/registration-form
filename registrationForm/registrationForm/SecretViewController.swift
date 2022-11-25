//
//  SecretViewController.swift
//  registrationForm
//
//  Created by tosy on 25.11.22.
//

import UIKit

class SecretViewController: UIViewController {
    @IBOutlet var headText: UILabel!
    @IBOutlet var secretCodeText: UILabel!
    @IBOutlet var secretCodeTextField: UITextField!
    var userModel: User?
    let secretCode = Int.random(in: 100000...999999)
    
    override func viewDidLoad() {
        super.viewDidLoad()
       userCode()
        // Do any additional setup after loading the view.
    }
    
    
    
    // MARK: - Navigation
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destVC = segue.destination as? SecretViewController,
              let userModel = sender as? User
        else {return
        }
        destVC.userModel = userModel
    }
    func userCode(){
        secretCodeText.text = "Your secret code \(secretCode) for \(userModel?.email ?? "")"
    }
    
}
