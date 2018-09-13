//
//  BaseView.swift
//  app
//
//  Created by Kiran on 07/09/18.
//  Copyright © 2018 AlRasheed. All rights reserved.
//

import UIKit

class BaseView: UIView {
    
    
    var view:UIView!
    
    //MARK: View Initialization Methods
    
    func xibSetup() {
        
        view = loadViewFromNib()
        
        // use bounds not frame or it'll be offset
        view.frame = bounds
        
        // Make the view stretch with containing view
        view.autoresizingMask = [UIViewAutoresizing.flexibleWidth, UIViewAutoresizing.flexibleHeight]
        
        // Adding custom subview on top of our view (over any custom drawing > see note below)
        addSubview(view)
    }
    
    func loadViewFromNib() -> UIView {
        
        let nibName = getNibName()
        let bundle = Bundle(for: type(of: self))
        let nib = UINib( nibName: nibName, bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        
        return view
    }
    
    override init(frame: CGRect) {
        
        // 1. setup any properties here
        
        // 2. call super.init(frame:)
        super.init(frame: frame)
        
        // 3. Setup view from .xib file
        xibSetup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        // 1. setup any properties here
        
        // 2. call super.init(coder:)
        super.init(coder: aDecoder)
        
        // 3. Setup view from .xib file
        xibSetup()
        
    }
    
    //**** Must be overridden *****//
    func getNibName() -> String {
        return ""
    }
}
