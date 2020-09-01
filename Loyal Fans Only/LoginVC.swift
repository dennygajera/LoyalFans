//
//  ViewController.swift
//  Loyal Fans Only
//
//  Created by Chirag Bhojani on 8/22/20.
//  Copyright © 2020 Chirag Bhojani. All rights reserved.
//

import UIKit

class LoginVC: BaseVC {
    
    @IBOutlet weak var txtUssername: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var btnRegister: UIButton!
    @IBOutlet weak var btnForgotPassword: UIButton!
    @IBOutlet weak var btnLoginWithGoogle: UIButton!
    @IBOutlet weak var btnLoginWithFacebook: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
    
    @IBAction func btnLoginClick(_ sender: UIButton) {
        let home = Storyboard.main.storyboard().instantiateViewController(withIdentifier: Identifier.tab.rawValue) as! TabBar
        self.navigationController?.pushViewController(home, animated: true)
    }
    
    @IBAction func btnRegisterClick(_ sender: UIButton) {
        let register = Storyboard.main.storyboard().instantiateViewController(withIdentifier: Identifier.signup.rawValue) as! SignupVC
        self.navigationController?.pushViewController(register, animated: true)
    }
    
    @IBAction func btnLoginWithGoogleClick(_ sender: UIButton) {
        
    }
    
    @IBAction func btnForgotPasswordClick(_ sender: UIButton) {
        let home = Storyboard.main.storyboard().instantiateViewController(withIdentifier: Identifier.forgotPassword.rawValue) as! ForgotPasswordVC
        self.navigationController?.pushViewController(home, animated: true)
    }
    
    @IBAction func btnLoginWithFacebookClick(_ sender: UIButton) {
        
    }
    
}

