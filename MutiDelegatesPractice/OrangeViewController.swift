//
//  OrangeViewController.swift
//  MutiDelegatesPractice
//
//  Created by Woody Liu on 2020/8/25.
//  Copyright © 2020 thisWhat. All rights reserved.
//

import UIKit

class OrangeViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = ""
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.setupDelegate()
    }
    
}

extension OrangeViewController: LonlyChat{
    func reply(_ text: String) {
        guard text != "" else{ self.label.text = "你有說話嗎 ?" ;return }
        guard text != "我帥嗎?" else{self.label.text = "你真的很帥" ; return }
        self.label.text = "不用擔心，你很\(text)"
    }
    
    func setupDelegate(){
        if let vc = self.parent as? MainViewController{
            vc.delegateCenter.addDelegates(self)
        }
    }
    
    
}
