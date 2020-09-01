//
//  ConfirmationPopUpVC.swift
//  Ni-Pocket
//
//  Created by iMac on 12/03/20.
//  Copyright © 2020 Darshan. All rights reserved.
//

import UIKit

@objc protocol SendOTPDelegate: class {
    func sendButtonClickHandler(obj: UIButton)
    
}

class SendOTPVC: UIViewController {
    
    weak var delegate: SendOTPDelegate?
    @IBOutlet weak var btnSend: UIButton!
    @IBOutlet weak var viewBackground: UIView!
    @IBOutlet weak var txtAmount: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
        viewBackground.addGestureRecognizer(tap)
        
    }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer? = nil) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func btnSendClick(_ sender: UIButton) {
        delegate?.sendButtonClickHandler(obj: sender)
    }
    
}
