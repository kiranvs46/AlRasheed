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

        addBackButton()
        hideKeyboardWhenTappedAround()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    //MARK - IBAction
    
    
    @IBAction func submitAction() {
        
        successView.isHidden = false
    }

    //MARK -
    
    private func addBackButton() {
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(image: UIImage.init(named: "back_arrow"), style: .plain, target: self, action: #selector(backAction))
        self.navigationItem.rightBarButtonItem = nil
    }
    
    @objc func backAction() {
        self.navigationController?.popViewController(animated: true)
    }
}

