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
    case multiplication
}

class ViewController: UIViewController {

    @IBOutlet weak var lab_totalNum: UILabel!
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
    
    @IBAction func bt_plusPressed(_ sender: Any) {
        changeModes(newMode: .addition)
    }
    
    @IBAction func bt_minusPressed(_ sender: Any) {
        changeModes(newMode: .subtraction)
    }
    @IBAction func bt_multPressed(_ sender: Any) {
        changeModes(newMode: .multiplication)
    }
    
    @IBAction func bt_clearPressed(_ sender: Any) {
        labelString = "0"
        currentMode = .not_set
        savedNum = 0
        lastButtonWasMode = false
        lab_totalNum.text = "0"
    }
    
    @IBAction func bt_equalsPressed(_ sender: Any) {
        guard let labelInt:Int = Int(labelString) else{
            return
        }
        
        if(currentMode == .not_set || lastButtonWasMode){
            return
        }
        
        if(currentMode == .addition){
            savedNum += labelInt
        }
        else if(currentMode == .subtraction){
            savedNum -= labelInt
        }
        else if(currentMode == .multiplication){
            savedNum *= labelInt
        }
        
        
        currentMode = .not_set
        labelString = "\(savedNum)"
        updateText()
        lastButtonWasMode = true
    }
    
    @IBAction func bt_numbPressed(_ sender: Any) {
        let stringValue:String? = (sender as? UIButton)?.titleLabel?.text
        
        if(lastButtonWasMode){
            lastButtonWasMode = false
            labelString = "0"
        }
        
        labelString.append(stringValue!)
        updateText()
        
    }
    
    
    func updateText(){
        guard let labelInt:Int = Int(labelString) else{
            return
        }
        
        if(currentMode == .not_set){
            savedNum = labelInt
        }
        
        
        let formatter:NumberFormatter = NumberFormatter()
        formatter.numberStyle = .decimal
        let num:NSNumber = NSNumber(value: labelInt)
        
        lab_totalNum.text = formatter.string(from: num)
        
    }
    
    
    func changeModes(newMode:modes){
        if(savedNum == 0){
            return
        }
        currentMode = newMode
        lastButtonWasMode = true
    }


}

