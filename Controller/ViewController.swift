//
//  ViewController.swift
//  FlashChat
//
//  Created by Ruby Mahto on 26/07/19.
//  Copyright © 2019 Ruby Mahto. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func loginPressed(_ sender: Any) {
        performSegue(withIdentifier: "goToLogin", sender: self)
    }
    
    @IBAction func RegisterPressed(_ sender: Any) {
        performSegue(withIdentifier: "goToRegistration", sender: self)
    }
    
}

