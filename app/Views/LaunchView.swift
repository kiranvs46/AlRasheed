//
//  LaunchView.swift
//  app
//
//  Created by Kiran on 07/09/18.
//  Copyright © 2018 AlRasheed. All rights reserved.
//

import UIKit

class LaunchView: BaseView {

    
    @IBOutlet weak var progressBar:UIProgressView!
    
    override func getNibName() -> String {
        return "LaunchView"
    }
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
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
