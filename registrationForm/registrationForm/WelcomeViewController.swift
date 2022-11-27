//
//  WelcomeViewController.swift
//  registrationForm
//
//  Created by tosy on 27.11.22.
//

import UIKit

class WelcomeViewController: UIViewController {
    var userModel: User?
    @IBOutlet var welcomeUserLbl: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        welcome()
        // Do any additional setup after loading the view.
    }

    func welcome() {
        guard (userModel?.name?.count)! > 0 else { welcomeUserLbl.text = "Hello user, please enter secret code"
            return
        }
        welcomeUserLbl.text = "Hello \(userModel?.name ?? ""), please enter secret code"
    }

    @IBAction func ContinueButton() {}
    /*
     // MARK: - Navigation

     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         // Get the new view controller using segue.destination.
         // Pass the selected object to the new view controller.
     }
     */
}
