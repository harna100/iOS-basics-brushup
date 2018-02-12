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
        addNumbers()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func addNumbers() {
        let num1:Int = 1
        let num2:Int = 3
        let sum = num1 + num2
        lab_sum.text = "The sum is \(sum)"
    }

}

