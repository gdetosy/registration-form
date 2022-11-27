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
    @IBOutlet var errorSecretCodeLbl: UILabel!
    @IBOutlet var secretCodeTextField: UITextField!
    var userModel: User?
    let secretCode = Int.random(in: 100000 ... 999999)
    var sleepTime = 3
    override func viewDidLoad() {
        super.viewDidLoad()
        userCode()
        helloNameLbl() // Do any additional setup after loading the view.
        hideClaviature()
    }
    
    @IBAction func secretCodeTextField(_ sender: UITextField) {
        guard let text = sender.text,
              !text.isEmpty, text == secretCode.description
        else {
            errorSecretCodeLbl.text = "Error code. Plese wait \(sleepTime) seconds"
            sender.isUserInteractionEnabled = false
            errorSecretCodeLbl.isHidden = false
            let dispatchAfter = DispatchTimeInterval.seconds(sleepTime)
            let deadline = DispatchTime.now() + dispatchAfter
            DispatchQueue.main.asyncAfter(deadline: deadline) {
                sender.isUserInteractionEnabled = true
                self.errorSecretCodeLbl.isHidden = true
                self.sleepTime *= 2
            }
            return
        }
        performSegue(withIdentifier: "WelcomeViewController", sender: userModel)
    }
    
    // MARK: -
    
    func helloNameLbl() {
        guard (userModel?.name?.count)! > 0 else { headText.text = "Hello user, please enter secret code"
            return
        }
        headText.text = "Hello \(userModel?.name ?? ""), please enter secret code"
    }
    
    func userCode() {
        secretCodeText.text = " secret code \(secretCode) for \(userModel?.email ?? " ")"
    }
 override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            guard let destVC = segue.destination as? WelcomeViewController else { return }
     let userModel = sender as? User
     destVC.userModel = userModel
        }
    }

