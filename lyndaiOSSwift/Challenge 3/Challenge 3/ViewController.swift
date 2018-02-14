//
//  ViewController.swift
//  Challenge 3
//
//  Created by Harnack, Paul (Student) on 2/11/18.
//  Copyright © 2018 Harnack, Paul (Student). All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lab_label: UILabel!

    var name:String = "Paul"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func say(salutation:String){
        lab_label.text = "\(salutation) \(name)"
    }
    
    @IBAction func bt_helloPressed(_ sender: Any) {
        say(salutation: "Hello")
    }
    
    @IBAction func bt_goodbyePressed(_ sender: Any) {
        say(salutation: "Goodbye")
    }
}

