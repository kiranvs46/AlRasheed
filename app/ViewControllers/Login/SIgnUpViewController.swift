//
//  SIgnUpViewController.swift
//  app
//
//  Created by Kiran on 15/09/18.
//  Copyright © 2018 AlRasheed. All rights reserved.
//

import UIKit

class SIgnUpViewController: UIViewController {

    
    @IBOutlet weak var scrollView:UIScrollView!
    @IBOutlet weak var successView:UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        addBackButton()
        setScrollView()
        hideKeyboardWhenTappedAround()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    //MARK -
    
    private func setScrollView() {
        
        scrollView.contentSize = CGSize.init(width: self.view.bounds.width, height: 1000)
    }
    
    private func addBackButton() {
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(image: UIImage.init(named: "back_arrow"), style: .plain, target: self, action: #selector(backAction))
        self.navigationItem.rightBarButtonItem = nil
    }
    
    @objc func backAction() {
        self.navigationController?.popViewController(animated: true)
    }

    //MARK - IBActions
    
    @IBAction func signupAction() {
        
        self.successView.isHidden = false
    }
}

