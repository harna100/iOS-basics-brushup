//
//  ViewController.swift
//  Calculator
//
//  Created by Harnack, Paul (Student) on 2/12/18.
//  Copyright © 2018 Harnack, Paul (Student). All rights reserved.
//

import UIKit

enum modes {
    case not_set
    case addition
    case subtraction
}

class ViewController: UIViewController {

    var labelString:String = "0"
    var currentMode:modes = .not_set
    var savedNum:Int = 0
    var lastButtonWasMode:Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateText(){
        
    }
    
    func changeModes(newMode:modes){
        
    }


}

