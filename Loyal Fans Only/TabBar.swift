//
//  AppTabVC.swift
//  TOI
//
//  Created by Darshan Gajera on 28/02/19.
//  Copyright © 2019 Darshan Gajera. All rights reserved.
//

import UIKit


class TabBar: UITabBarController, UITabBarControllerDelegate {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.tabBar.backgroundColor = .white
        self.tabBar.tintColor = .white
        self.tabBar.barTintColor = .white
        self.tabBar.barStyle = .default
        
        DispatchQueue.main.async { [weak self] in
            self?.tabBar.backgroundColor = .white
        }
        
        self.selectedIndex = 0
        self.delegate = self
    }


    
    override func viewDidAppear(_ animated: Bool) {
        self.setTabBarItems()
    }
    
    func setTabBarItems(){
        self.tabBar.barTintColor = Color.WhiteDarkMode.color()
        let myTabBarItem1 = (self.tabBar.items?[0])! as UITabBarItem
        myTabBarItem1.image = UIImage(named: TabbarIcon.Home)?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        myTabBarItem1.selectedImage = UIImage(named: TabbarIcon.HomeSelected)?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)

        myTabBarItem1.imageInsets = UIEdgeInsets(top: 12, left: 12, bottom: 12, right: 12)

        let myTabBarItem2 = (self.tabBar.items?[1])! as UITabBarItem
        myTabBarItem2.image = UIImage(named: TabbarIcon.Search)?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        myTabBarItem2.selectedImage = UIImage(named: TabbarIcon.SearchSelected)?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        myTabBarItem2.title = ""
        myTabBarItem2.imageInsets = UIEdgeInsets(top: 12, left: 12, bottom: 12, right: 12)
        
//        let myTabBarItem3 = (self.tabBar.items?[2])! as UITabBarItem
//        myTabBarItem3.image = UIImage(named: TabbarIcon.Add)?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
//        myTabBarItem3.selectedImage = UIImage(named:TabbarIcon.AddSelected)?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
//        myTabBarItem3.title = ""
//        myTabBarItem3.imageInsets = UIEdgeInsets(top: 12, left: 12, bottom: 12, right: 12)

        let myTabBarItem4 = (self.tabBar.items?[3])! as UITabBarItem
        myTabBarItem4.image = UIImage(named: TabbarIcon.Notification)?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        myTabBarItem4.selectedImage = UIImage(named: TabbarIcon.NotificationSelected)?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        myTabBarItem4.title = ""
        myTabBarItem4.imageInsets = UIEdgeInsets(top: 12, left: 12, bottom: 12, right: 12)
        
        let myTabBarItem5 = (self.tabBar.items?[4])! as UITabBarItem
        
        myTabBarItem5.image = UIImage(named: TabbarIcon.Profile)?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        myTabBarItem5.selectedImage = UIImage(named: TabbarIcon.ProfileSelected)?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        myTabBarItem5.title = ""
        myTabBarItem5.imageInsets = UIEdgeInsets(top: 12, left: 12, bottom: 12, right: 12)
        
        self.setupMiddleButton()
        
    }
    
    func setupMiddleButton() {
        let menuButton = UIButton(frame: CGRect(x: 0, y: 0, width: 56, height: 56))

        var menuButtonFrame = menuButton.frame
        menuButtonFrame.origin.y = view.bounds.height - menuButtonFrame.height - 12
        menuButtonFrame.origin.x = view.bounds.width/2 - menuButtonFrame.size.width/2
        menuButton.frame = menuButtonFrame

//        menuButton.backgroundColor = UIColor.red
        menuButton.layer.cornerRadius = menuButtonFrame.height/2
        view.addSubview(menuButton)

        menuButton.setImage(UIImage(named: TabbarIcon.AddSelected), for: .normal)
//        menuButton.addTarget(self, action: #selector(menuButtonAction(sender:)), for: .touchUpInside)

        view.layoutIfNeeded()
    }

}
