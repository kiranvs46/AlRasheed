//
//  DocumentsViewController.swift
//  app
//
//  Created by Kiran on 13/09/18.
//  Copyright © 2018 AlRasheed. All rights reserved.
//

import UIKit

class DocumentsViewController: BaseViewController {

    
    @IBOutlet weak var tableView:UITableView!
    @IBOutlet weak var requestContainerView:UIView!
    @IBOutlet weak var segmentedControl:UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        addBackButton()
        self.tableView.register(UINib.init(nibName:"DocumentsTableViewCell", bundle: nil), forCellReuseIdentifier: "DocumentsCellIdentifier")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    //MARK - IBAction
    
    @IBAction func segmentedControlAction(segmentedControl:UISegmentedControl) {
        
        let selectedIndex = segmentedControl.selectedSegmentIndex
        switch selectedIndex {
        case 0:
            
            requestContainerView.isHidden = false
            break
        case 1:
            
            requestContainerView.isHidden = true
            break
        case 2:
            
            requestContainerView.isHidden = true
            break
        default:
            break
        }
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

extension DocumentsViewController:UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 135
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "DocumentsCellIdentifier", for: indexPath) as! DocumentsTableViewCell
        return cell
    }
}

extension DocumentsViewController:UITableViewDelegate {
    
}
