//
//  ViewController.swift
//  Conditionals
//
//  Created by Harnack, Paul (Student) on 2/11/18.
//  Copyright © 2018 Harnack, Paul (Student). All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lab_toggle: UILabel!
    @IBOutlet weak var bt_switch: UIButton!
    
    var isOn = true
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func bt_switchPressed(_ sender: Any) {
        isOn = !isOn
        lab_toggle.text = isOn ? "On" : "Off"
        bt_switch.backgroundColor = isOn ? UIColor.green : UIColor.red

    }
    
}

