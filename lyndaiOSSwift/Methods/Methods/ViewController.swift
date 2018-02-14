//
//  ViewController.swift
//  Methods
//
//  Created by Harnack, Paul (Student) on 2/11/18.
//  Copyright © 2018 Harnack, Paul (Student). All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lab_sum: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        addNumbers(num1: 3, num2: 2)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func bt_buttonPressed(_ sender: Any) {
        addNumbers(num1: Int(arc4random_uniform(50)), num2: Int(arc4random_uniform(50)))
    }
    
    func addNumbers(num1:Int, num2:Int) {
        let sum = num1 + num2
        lab_sum.text = "The sum is \(sum)"
    }

}

