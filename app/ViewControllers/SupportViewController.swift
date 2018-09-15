//
//  SupportViewController.swift
//  app
//
//  Created by Kiran on 13/09/18.
//  Copyright © 2018 AlRasheed. All rights reserved.
//

import UIKit

class SupportViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        addBackButton()
        hideKeyboardWhenTappedAround()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    //MARK -
    
    private func addBackButton() {
        
        self.navigationItem.leftBarButtonItem = nil//UIBarButtonItem.init(image: UIImage.init(named: "back_arrow"), style: .plain, target: self, action: #selector(backAction))
        //self.navigationItem.rightBarButtonItem = nil
    }
    
    @objc func backAction() {
        self.navigationController?.popViewController(animated: true)
    }

}
