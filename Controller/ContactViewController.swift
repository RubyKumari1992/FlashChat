//
//  ContactViewController.swift
//  FlashChat
//
//  Created by Ruby Mahto on 24/09/19.
//  Copyright © 2019 Ruby Mahto. All rights reserved.
//

import UIKit
import Firebase
class ContactViewController: UIViewController {
    
    

    // MARK: Outlets
    @IBOutlet weak var contactTableView: UITableView!
    
    // MARK: variables
    private var database = Database.database()
    private var url = "https://flashchat-7202c-f81a2.firebaseio.com/"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.contactTableView.dataSource = self
        self.contactTableView.delegate = self
    }
    
    //MARK: Establish connection to firebase
    private func connectToDatabase() {
        self.database.reference(fromURL: url)
       print(Auth.auth().app)
    }
}
extension ContactViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let cell = contactTableView.dequeueReusableCell(withIdentifier: "customMessageCell", for: indexPath) as! CustomMessageCell
        return cell
    }
}
