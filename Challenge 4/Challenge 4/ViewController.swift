//
//  ViewController.swift
//  Challenge 4
//
//  Created by Harnack, Paul (Student) on 2/11/18.
//  Copyright © 2018 Harnack, Paul (Student). All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lab_secret: UILabel!
    var score:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func bt_clickerPressed(_ sender: Any) {
        score += 1
        if(score >= 10) {
            lab_secret.text = "Not a secret"
        }
        
    }
    
}

