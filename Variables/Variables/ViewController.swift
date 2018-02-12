//
//  ViewController.swift
//  Variables
//
//  Created by Harnack, Paul (Student) on 2/11/18.
//  Copyright © 2018 Harnack, Paul (Student). All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var lab_label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        let score:Int = 10
        
        lab_label.text = "Hello World, it's day \(score)"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

