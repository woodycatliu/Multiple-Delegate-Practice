//
//  PinkViewController.swift
//  MutiDelegatesPractice
//
//  Created by Woody Liu on 2020/8/25.
//  Copyright © 2020 thisWhat. All rights reserved.
//

import UIKit

class PinkViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = ""
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setupDelegate()
    }
    
}

extension PinkViewController: LonlyChat{
    func reply(_ text: String) {
        guard text != "" else{ self.label.text = "你需要說點什麼" ; return }
        guard text != "我帥嗎?" else{self.label.text = "真的，就像金城武" ; return }
        self.label.text = "你真的\(text)"
    }
    
    func setupDelegate(){
        if let vc =  self.parent as? MainViewController{
            vc.delegateCenter.addDelegates(self)
            
        }
    }
    
    
}
