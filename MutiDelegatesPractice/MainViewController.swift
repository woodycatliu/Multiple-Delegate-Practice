//
//  ViewController.swift
//  MutiDelegatesPractice
//
//  Created by Woody Liu on 2020/8/25.
//  Copyright © 2020 thisWhat. All rights reserved.
//

import UIKit

class MainViewController: UIViewController , UITextFieldDelegate{
    
    let delegateCenter = DelegatesCenter<LonlyChat>()
    
    @IBOutlet weak var textFild: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        textFild.delegate = self
    }

    @IBAction func sendWapped(){
        guard let text = self.textFild?.text else{ return }
        self.delegateCenter.deliveryDelegate({
            $0.reply(text) })
    }

}


protocol LonlyChat: class {
    func reply(_ text:String)
}





class DelegatesCenter<Protocol>{
    
    private class WrappedDelegates{ //delegate 貨運人員
        weak var delegate: AnyObject?
        init(delegate:AnyObject) { self.delegate = delegate }
    }
    
    
    private var delegatesHouse: [WrappedDelegates] //delegate 休息室
    private var delegates: [Protocol]{ //分發delegate
        delegatesHouse = delegatesHouse.filter({$0.delegate != nil })
        return delegatesHouse.map({ $0.delegate }) as! [Protocol]
    }
    
    init(delegates: [Protocol] = []) {
        delegatesHouse = delegates.map({WrappedDelegates(delegate: $0 as AnyObject)})
    }
    
    func addDelegates(_ delegate: Protocol) { //添加代理人、每位代理人安排一間商店
        let wrapped = WrappedDelegates(delegate: delegate as AnyObject)
        self.delegatesHouse.append(wrapped)
    }
    
    func deliveryDelegate(_ clouser: (Protocol) -> Void){ //派車
        delegates.forEach({ clouser($0) })
    }
}

