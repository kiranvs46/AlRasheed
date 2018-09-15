//
//  LaunchViewController.swift
//  app
//
//  Created by Kiran on 15/09/18.
//  Copyright © 2018 AlRasheed. All rights reserved.
//

import UIKit
import KYDrawerController

class LaunchViewController: UIViewController {

    
    @IBOutlet weak var progressBar:UIProgressView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        animateProgressBar()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    //MARK -
    
    private func animateProgressBar() {
        
        UIView.animate(withDuration: 5, animations: {
            self.progressBar.setProgress(1.0, animated: true)
            self.view.layoutIfNeeded()
        }) { (finished) in
            self.setHomeVC()
        }
    }
    
    @objc private func setHomeVC() {
        
        let homeViewController = HomeViewController()
        let drawerViewController = SlideMenuViewController()
        let drawerController     = KYDrawerController.init(drawerDirection: .left, drawerWidth: 250)
        drawerController.mainViewController = UINavigationController(
            rootViewController: homeViewController
        )
        drawerController.drawerViewController = drawerViewController
        
        let window = UIApplication.shared.windows[0]
        window.rootViewController = drawerController
    }
}
