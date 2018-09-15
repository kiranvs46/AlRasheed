//
//  ForgotPasswordViewController.swift
//  app
//
//  Created by Kiran on 15/09/18.
//  Copyright © 2018 AlRasheed. All rights reserved.
//

import UIKit

class ForgotPasswordViewController: BaseViewController {

    
    @IBOutlet weak var successView:UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    //MARK - IBAction
    
    
    @IBAction func submitAction() {
        
        successView.isHidden = false
    }

}
