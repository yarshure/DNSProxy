//
//  ViewController.swift
//  DNSProxy
//
//  Created by yarshure on 2017/6/7.
//  Copyright © 2017年 yarshure. All rights reserved.
//

import UIKit
import NetworkExtension
class ViewController: UIViewController {
    @IBOutlet weak var enable:UISwitch!
    @IBOutlet weak var status:UISwitch!
    
    
    let manager = NEDNSProxyManager.shared()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.enable.isOn = self.manager.isEnabled
        test()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func test(){
        
        manager.loadFromPreferences { [unowned self](e) in
            if let e = e {
                print(e)
            }else  {
                self.enable.isOn = self.manager.isEnabled
                self.save()
                
                print("load sucess")
            }
        }
    }
    func save(){
        //let manager = NEDNSProxyManager.shared()
        manager.isEnabled = true
        let providerProtocol = NEDNSProxyProviderProtocol()
        //providerProtocol.providerConfiguration
        manager.providerProtocol = providerProtocol
        manager.saveToPreferences { [](e) in
            if let e = e {
                print("\(e)")
            }else {
                print("success")
            }
        }
    }
    @IBAction func  startAction(_ sender:Any) {
        //manager
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

