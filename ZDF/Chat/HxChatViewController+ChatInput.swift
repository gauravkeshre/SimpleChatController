//
//  HxChatViewController+ChatInput.swift
//  ZDF
//
//  Created by Gaurav Keshre on 21/09/17.
//  Copyright © 2017 GK. All rights reserved.
//

import Foundation
import  UIKit

extension HxChatViewController {
    @IBAction func handleSendButton(_ sender: UIButton) {
    shouldResign = true
     self.resignFirstResponder()
    }
    
    @IBAction func handleAddButton(_ sender: UIButton) {
        
    }

}
