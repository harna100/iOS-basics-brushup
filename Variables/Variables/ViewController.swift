//
//  ViewController.swift
//  Variables
//
//  Created by Harnack, Paul (Student) on 2/11/18.
//  Copyright © 2018 Harnack, Paul (Student). All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    @IBOutlet weak var lab_intLabel: UILabel!
    @IBOutlet weak var lab_strLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
        let str = "Hello World"
        let intVar = 5
        
        lab_strLabel.text = str
        lab_intLabel.text = String(intVar)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

