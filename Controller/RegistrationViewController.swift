//
//  RegistrationViewController.swift
//  FlashChat
//
//  Created by Ruby Mahto on 26/07/19.
//  Copyright © 2019 Ruby Mahto. All rights reserved.
//

import UIKit
import Firebase
class RegistrationViewController: UIViewController {

    @IBOutlet weak var EmailId: UITextField!
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
    @IBAction func RegisterButtonPressed(_ sender: Any) {
        Auth.auth().createUser(withEmail: EmailId.text!, password: password.text!) { (user, error) in
            if error != nil {
                print(error!)
            }
            else {
               // print("registrartion sucessfull")
               // let ref = Database.database().reference(fromURL: <#T##String#>)
              //  guard let uid = Auth.auth().currentUser?.uid else { return }
                self.performSegue(withIdentifier: "goToChat", sender: self)
            
            }
        }
       
    }
    
}
