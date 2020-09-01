//
//  HomeVC.swift
//  Loyal Fans Only
//
//  Created by iMac on 25/08/20.
//  Copyright © 2020 Chirag Bhojani. All rights reserved.
//

import UIKit

class HomeCell: UITableViewCell {
    @IBOutlet weak var imgProfile: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblUserName: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var imgPost: UIImageView!
    @IBOutlet weak var lblLike: UILabel!
    @IBOutlet weak var lblComment: UILabel!
    @IBOutlet weak var btnSaveForLater: UIButton!
    @IBOutlet weak var btnSendOTP: UIButton!
    @IBOutlet weak var viewBackground: UIView!
}


class HomeVC: BaseVC {
    
    var confirm1: SendOTPVC!
    
    
    @IBOutlet weak var tblView: UITableView!
    @IBOutlet weak var btnMessageClick: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tblView.delegate = self
        self.tblView.dataSource = self 

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
    
    @IBAction func btnMessageClick(_ sender: UIButton){
        
    }
}

extension HomeVC: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Identifier.HomeCell.rawValue, for: indexPath) as! HomeCell
        
        cell.btnSendOTP.addTarget(self, action: #selector(btnSendOtpClick), for: .touchUpInside)
        self.setShadow(view: cell.viewBackground)
        
        return cell
    }
    
    @objc func btnSendOtpClick(_sender: UIButton) {
        self.confirm1 = (Storyboard.main.storyboard().instantiateViewController(withIdentifier: Identifier.sendOtp.rawValue) as! SendOTPVC)
        
        
        self.confirm1.modalPresentationStyle = .overFullScreen
        self.confirm1.delegate = self
        self.present(self.confirm1, animated: true, completion: nil)
    }
    
}

extension HomeVC: SendOTPDelegate {
    func sendButtonClickHandler(obj: UIButton) {
        self.delayWithSeconds(2.0) {
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    
}




