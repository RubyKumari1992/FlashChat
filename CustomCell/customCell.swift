//
//  customCell.swift
//  FlashChat
//
//  Created by Ruby Mahto on 27/07/19.
//  Copyright © 2019 Ruby Mahto. All rights reserved.
//

import Foundation
import UIKit

class CustomMessageCell: UITableViewCell {
    
    @IBOutlet weak var chatImage: UIImageView!
    @IBOutlet weak var chatName: UILabel!
    @IBOutlet weak var messageBackgroundView: UIView!
    @IBOutlet weak var message: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
