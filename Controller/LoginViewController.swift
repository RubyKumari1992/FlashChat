//
//  LoginViewController.swift
//  FlashChat
//
//  Created by Ruby Mahto on 26/07/19.
//  Copyright © 2019 Ruby Mahto. All rights reserved.
//

import UIKit
import Firebase
class LoginViewController: UIViewController {

    @IBOutlet weak var emailId: UITextField!
    @IBOutlet weak var password: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func LoginButtonPressed(_ sender: Any) {
        Auth.auth().signIn(withEmail: emailId.text!, password: password.text!) { (user, error) in
            if error != nil {
                print("error while login")
            }
            else {
                print("sucessfull login")
               self.performSegue(withIdentifier: "goToChat", sender: self)
            }
        }
    }
}
