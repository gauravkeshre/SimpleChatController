//
//  HxChatViewController.swift
//  ZDF
//
//  Created by Gaurav Keshre on 21/09/17.
//  Copyright © 2017 GK. All rights reserved.
//

import UIKit

class HxChatViewController: UIViewController {

    @IBOutlet fileprivate weak var collectionView: UICollectionView!
    var shouldResign: Bool = false
    
    fileprivate var chats: [ChatModel] = []
    
    lazy var chatAccessoryView: UIView  = {
        let acc = UINib(nibName: "ChatTextInputView", bundle: nil).instantiate(withOwner: self, options: nil).first!
        return acc as! UIView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let lNib = UINib(nibName: "LeftChatCell", bundle: nil)
        let rNib = UINib(nibName: "RightChatCell", bundle: nil)
        collectionView.register(lNib, forCellWithReuseIdentifier: "LeftChatCell")
        collectionView.register(rNib, forCellWithReuseIdentifier: "RightChatCell")
        
        if let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.estimatedItemSize = CGSize(width: 1, height:1)
        }
        
        chats.append(contentsOf: fetchFakeChat())
        collectionView.reloadData()
        
        var inset = collectionView.contentInset
        inset.bottom += 80
        collectionView.contentInset = inset        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override var canBecomeFirstResponder: Bool {
        return  true
    }
    
    override var inputAccessoryView: UIView? {
        return self.chatAccessoryView
    }
}


extension HxChatViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        collectionView.layoutIfNeeded() // Patch: only to solve UIKit crash on Plus models
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return chats.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let chat = chats[indexPath.item]
        let chatCell: ChatCell
        
        if chat.isSentByMe {
            chatCell = collectionView.dequeueReusableCell(withReuseIdentifier: "RightChatCell", for: indexPath) as! ChatCell
        }else{
            chatCell = collectionView.dequeueReusableCell(withReuseIdentifier: "LeftChatCell", for: indexPath) as! ChatCell
        }
        chatCell.configure(chat: chat)
        return chatCell
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: collectionView.bounds.width - 100, height: 200)
//    }
}


fileprivate extension HxChatViewController {
    func loadKeyboardAccessoryView () {
        
    }
}
