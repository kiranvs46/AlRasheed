//
//  NotificationViewController.swift
//  app
//
//  Created by Kiran on 13/09/18.
//  Copyright © 2018 AlRasheed. All rights reserved.
//

import UIKit

class NotificationViewController: BaseViewController {

    
    @IBOutlet weak var notificationTableView:UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        addBackButton()
        self.notificationTableView.register(UINib.init(nibName: "NotificationTableViewCell", bundle: Bundle.main), forCellReuseIdentifier: "NotificationCellIdentifier")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    //MARK -
    
    private func addBackButton() {
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(image: UIImage.init(named: "back_arrow"), style: .plain, target: self, action: #selector(backAction))
    }
    
    @objc func backAction() {
        self.navigationController?.popViewController(animated: true)
    }
}

extension NotificationViewController:UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 10;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let notificationCell = tableView.dequeueReusableCell(withIdentifier: "NotificationCellIdentifier", for: indexPath) as! NotificationTableViewCell
        return notificationCell
    }
    
}

extension NotificationViewController:UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
