//
//  ViewController.swift
//  CoreDataTest
//
//  Created by Harnack, Paul (Student) on 2/14/18.
//  Copyright © 2018 Harnack, Paul (Student). All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var context:NSManagedObjectContext!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        context = appDelegate.persistentContainer.viewContext
        
        
        createRecord()
        fetchData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func createRecord(){
        let entity = NSEntityDescription.entity(forEntityName: "Users", in: context)
        
        let newUser = NSManagedObject(entity: entity!, insertInto: context)
        
        newUser.setValue("Paul", forKey:"username")
        newUser.setValue("1234", forKey:"password")
        newUser.setValue("22", forKey:"age")
        
        do {
            try context.save()
        }
        catch{
            print("Failed to save")
        }
        
    }
    
    func fetchData(){
        let request = NSFetchRequest<NSFetchRequestResult>(entityName:"Users")
        request.returnsObjectsAsFaults = false
        
        do {
            let result = try context.fetch(request)
            for data in result as! [NSManagedObject] {
                print(data.value(forKey: "username") as! String)
            }
        }
        catch{
            print("Failed to fetch")
        }
    }
}





















