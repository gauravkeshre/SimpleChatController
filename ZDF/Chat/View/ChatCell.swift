//
//  LeftChatCell.swift
//  ZDF
//
//  Created by Gaurav Keshre on 21/09/17.
//  Copyright © 2017 GK. All rights reserved.
//

import UIKit

class ChatCell: UICollectionViewCell {
    @IBOutlet private weak var lblSender: UILabel!
    @IBOutlet private weak var lblMessage: UILabel!
    @IBOutlet private weak var lblDate: UILabel!
    @IBOutlet private weak var widthConstraint: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.translatesAutoresizingMaskIntoConstraints = false
        let screenwidth = UIScreen.main.bounds.size.width
        widthConstraint.constant = screenwidth - (2 * 10)
        
    }
    func configure(chat: ChatModel) {
        lblSender.text =  chat.senderName
        lblMessage.text =  chat.message
        lblDate.text =  chat.date
    }
}
