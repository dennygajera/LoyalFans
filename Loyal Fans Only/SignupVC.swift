//
//  SignupVC.swift
//  Loyal Fans Only
//
//  Created by Chirag Bhojani on 8/22/20.
//  Copyright © 2020 Chirag Bhojani. All rights reserved.
//

import UIKit

class SignupVC: BaseVC {
    
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    
    @IBOutlet weak var btnSignup: UIButton!
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var btnLoginWithGoogle: UIButton!
    @IBOutlet weak var btnLoginWithFacebook: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
    
    @IBAction func btnLoginClick(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func btnRegisterClick(_ sender: UIButton) {
        
    }
    
    @IBAction func btnLoginWithGoogleClick(_ sender: UIButton) {
        
    }
    
    @IBAction func btnLoginWithFacebookClick(_ sender: UIButton) {
        
    }
    
    
    
}
