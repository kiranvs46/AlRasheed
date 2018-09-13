//
//  BaseViewController.swift
//  app
//
//  Created by Kiran on 13/09/18.
//  Copyright © 2018 AlRasheed. All rights reserved.
//

import UIKit
import KYDrawerController

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
        setBarButtons()
    }
    
    private func setBarButtons() {
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(image: UIImage.init(named: "menu"), style: .plain, target: self, action: #selector(showSlideMenu))
    }

    @objc private func showSlideMenu() {
        
        let slideMenu = self.navigationController?.parent as! KYDrawerController
        slideMenu.setDrawerState(.opened, animated: true)
    }
}
