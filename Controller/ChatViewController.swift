//
//  ChatViewController.swift
//  FlashChat
//
//  Created by Ruby Mahto on 27/07/19.
//  Copyright © 2019 Ruby Mahto. All rights reserved.
//

import UIKit
import Firebase
import ChameleonFramework
class ChatViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate{
    
    //MARK:- variables
    var message: [Message] = [Message]()
    var messageArray: [String] = [String]()
    var messageDictionary: Dictionary<String,Any> = [:]
    var userMessage: DatabaseReference!
    @IBOutlet weak var heightConstraints: NSLayoutConstraint!
    @IBOutlet weak var chatTableView: UITableView!
    @IBOutlet weak var sendButton: UIButton!
    @IBOutlet weak var chatTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // TableView dataSource and delegate
        chatTableView.delegate = self
        chatTableView.dataSource = self
        
        // Register custom cell customCell.xib
        chatTableView.register(UINib(nibName: "customCell", bundle: nil), forCellReuseIdentifier: "customMessageCell")
        
        // TextField delegate
        chatTextField.delegate = self
        
        // Set Tap Gesture here
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tableViewTapped))
        chatTableView.addGestureRecognizer(tapGesture)
        chatTableView.separatorStyle = .none
         receiveMessage()
        configureTableView()
     
    }
   
    @objc func tableViewTapped() {
        chatTextField.endEditing(true)
    }
    
    //  Button: Logout button action
    @IBAction func logoutPressed(_ sender: Any) {
        do {
            try Auth.auth().signOut()
            navigationController?.popToRootViewController(animated: true)
        }
        catch {
            print("error while signing out")
        }
        guard (navigationController?.popToRootViewController(animated: true)) != nil
            else {
                print("no view to pop")
                return
        }
    }
    
    
    // MARK:- TableView DataSource and Delegate
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messageArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = chatTableView.dequeueReusableCell(withIdentifier: "customMessageCell", for: indexPath) as! CustomMessageCell
//        for i in messageArray {
//            cell.message.text = i
//        }
        cell.message.text =  messageArray[indexPath.row]
//        cell.message.text = message[indexPath.row].message
//        cell.chatName.text = message[indexPath.row].sender
        if cell.chatName.text == Auth.auth().currentUser?.email as String! {
           // cell.messageBackgroundView.backgroundColor = UIColor.flatBlue()
        }
        else {
            //cell.messageBackgroundView.backgroundColor = UIColor.flatLime()
        }
       
        return cell
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        UIView.animate(withDuration: 0.5) {
           self.heightConstraints.constant = 308
           self.view.layoutIfNeeded()
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        UIView.animate(withDuration: 0.5) {
            self.heightConstraints.constant = 50
            self.view.layoutIfNeeded()
        }
    }
    
    func configureTableView() {
       // chatTableView.rowHeight = UITableView.automaticDimension
        chatTableView.estimatedRowHeight = 100
        
    }
    
    func receiveMessage() {
        let messageDB = Database.database().reference().child("MEssage").child((Auth.auth().currentUser?.uid)!).child("messageBody")
        messageDB.observe(.value, with: { snapshot in
            if  let msgArr = snapshot.value as? [String] {
                print("msgArr", msgArr)
                for array in msgArr {
                    self.messageArray.append(array)
                }
                self.chatTableView.reloadData()
            }
        } )
        

    }
    // MARK:- Button Action
    
    @IBAction func sendButtonPressed(_ sender: Any) {
        if let app = Auth.auth().app {
            print(app)
        }
        chatTextField.endEditing(true)
        chatTextField.isEnabled = false
        sendButton.isEnabled = false
        let ref = Database.database().reference(fromURL: "https://flashchat-7202c-f81a2.firebaseio.com/")
        userMessage = ref.child("MEssage").child((Auth.auth().currentUser?.uid)!)
        print("Message saved sucessfully")
        messageArray.append(chatTextField.text!)
        messageDictionary.updateValue(messageArray, forKey: "messageBody")
        userMessage.updateChildValues(messageDictionary)
        self.messageArray.removeAll()
        self.chatTextField.isEnabled = true
        self.sendButton.isEnabled = true
        self.chatTextField.text = ""
        self.chatTableView.reloadData()
        
    }
}
