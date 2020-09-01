//
//  ForgotPasswordVC.swift
//  Loyal Fans Only
//
//  Created by iMac on 25/08/20.
//  Copyright © 2020 Chirag Bhojani. All rights reserved.
//

import UIKit

class ForgotPasswordVC: BaseVC {
    
    @IBOutlet weak var txtEmailAddress: UITextField!
    @IBOutlet weak var btnForgotPassword: UIButton!
    @IBOutlet weak var btnLogin: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
    
    @IBAction func btnLoginClick(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func btnForgotPasswordClick(_ sender: UIButton) {
        //call forgot password api
    }
    
    
    
}
