//
//  BaseViewController.swift
//  app
//
//  Created by Kiran on 13/09/18.
//  Copyright © 2018 AlRasheed. All rights reserved.
//

import UIKit
import KYDrawerController

enum TableType {
    case shipments
    case payments
}

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setUpNavigationBar()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func setUpNavigationBar() {
        
        let imgView = UIImageView.init(image: UIImage.init(named: "logo"))
        self.navigationItem.titleView = imgView
        
        self.navigationController?.navigationBar.barTintColor = UIColor.white
        self.navigationController?.navigationBar.tintColor = UIColor.init(red: 2/255, green: 24/255, blue: 85/255, alpha: 1)
        
        setBarButtons()
    }
    
    private func setBarButtons() {
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(image: UIImage.init(named: "menu"), style: .plain, target: self, action: #selector(showSlideMenu))
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(image: UIImage.init(named: "bell"), style: .plain, target: self, action: #selector(showNotificationView))
    }

    @objc func showSlideMenu() {
        
        let slideMenu = self.navigationController?.parent as! KYDrawerController
        slideMenu.setDrawerState(.opened, animated: true)
    }
    
    @objc private func showNotificationView() {
        
        let notificationVC = NotificationViewController.init(nibName:"NotificationViewController", bundle: nil)
        self.navigationController?.pushViewController(notificationVC, animated: true)
    }
}
