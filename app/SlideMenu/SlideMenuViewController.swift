//
//  SlideMenuViewController.swift
//  app
//
//  Created by Kiran on 02/09/18.
//  Copyright © 2018 AlRasheed. All rights reserved.
//

import UIKit
import KYDrawerController



protocol SlideMenuDelegate {
    
    func didTapVisitProfile()
    func didTapSearchShipment()
    func didTapShipInfo()
    func didTapDocuments()
    func didTapSupport()
    func didTapAbout()
    func didTapLogOut()
}

class SlideMenuViewController: UIViewController {

    @IBOutlet weak var nameLabel:UILabel!
    @IBOutlet weak var descriptionLabel:UILabel!
    @IBOutlet weak var profileImage:UIImageView!
    @IBOutlet weak var visitProfileButton:UIButton!
    
    var slideMenuDelegate:SlideMenuDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //MARK - IBActions
    
    @IBAction func visitProfileAction() {
        
        if let delegate = slideMenuDelegate {
            delegate.didTapVisitProfile()
        }
        
    }
    
    @IBAction func searchShipmentAction() {
        
        if let delegate = slideMenuDelegate {
            delegate.didTapSearchShipment()
        }
    }
    
    @IBAction func shipInfoAction() {
        
    }
    
    @IBAction func documentsAction() {
        
        if let delegate = slideMenuDelegate {
            delegate.didTapDocuments()
        }
    }
    
    @IBAction func supportAction() {
        
        if let delegate = slideMenuDelegate {
            delegate.didTapSupport()
        }
    }
    
    @IBAction func aboutAction() {
        
        if let delegate = slideMenuDelegate {
            delegate.didTapAbout()
        }
    }
    
    @IBAction func logout() {
        
    }
    
    //MARK -
    
}
