//
//  HomeViewController.swift
//  app
//
//  Created by Kiran on 02/09/18.
//  Copyright © 2018 AlRasheed. All rights reserved.
//

import UIKit
import KYDrawerController

class HomeViewController: BaseViewController {

    @IBOutlet weak var launchView:UIView!
    @IBOutlet weak var progressBar:UIProgressView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        showLaunchScreen()
        setUpNavigationBar()
        setSlideMenuDelegate()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    //MARK -
    
    
    private func showLaunchScreen() {
        
        
        //animateProgressView()
    }
    
    private func setSlideMenuDelegate() {
        
        let slideMenu = (self.navigationController?.parent as! KYDrawerController).drawerViewController as! SlideMenuViewController
        slideMenu.slideMenuDelegate = self
    }
    
    private func hideSlideMenu() {
        
        let slideMenu = self.navigationController?.parent as! KYDrawerController
        slideMenu.setDrawerState(.closed, animated: true)
    }
    
    private func setViewControllerAsMain(vc:UIViewController) {
        
        if let drawer:KYDrawerController = self.navigationController?.parent as? KYDrawerController {
         
            drawer.mainViewController = vc
            drawer.setDrawerState(.closed, animated: true)
        }
    }
    
    //MARK -
    
    func animateProgressView() {
        
        while progressBar.progress != 100 {
            
            UIView.animate(withDuration: 0.1, animations: {
                self.progressBar.setProgress(self.progressBar.progress + 0.1, animated: true)
            })
            
        }
    }
}


extension HomeViewController:SlideMenuDelegate {
    
    func didTapVisitProfile() {
        
        hideSlideMenu()
        let profileVC = ProfileViewController.init(nibName: "ProfileViewController", bundle: nil)
        setViewControllerAsMain(vc: profileVC)
    }
    
    func didTapSearchShipment() {
        
        hideSlideMenu()
    }
    
    func didTapShipInfo() {
        
        hideSlideMenu()
    }
    
    func didTapDocuments() {
        
        hideSlideMenu()
    }
    
    func didTapSupport() {
        
        hideSlideMenu()
    }
    
    func didTapAbout() {
        
        hideSlideMenu()
        let aboutVC = AboutViewController.init(nibName: "AboutViewController", bundle: nil)
        self.navigationController?.pushViewController(aboutVC, animated: true)
    }
    
    func didTapLogOut() {
        
    }
    
    
}
