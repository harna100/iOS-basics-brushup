//
//  ViewController.swift
//  Conditionals
//
//  Created by Harnack, Paul (Student) on 2/11/18.
//  Copyright © 2018 Harnack, Paul (Student). All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        let str:String = "10"
        if let num:Int = Int(str){
            print("\(num)")
        }
        else{
            print("convert failed")
        }
        
        guard let num:Int = Int(str) else{
            return
        }
        print("Finished! num is \(num)")
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

