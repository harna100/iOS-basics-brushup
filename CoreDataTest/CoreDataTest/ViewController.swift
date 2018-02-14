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

    @IBOutlet weak var tv_users: UITableView!
    @IBOutlet weak var tf_username: UITextField!
    @IBOutlet weak var tf_password: UITextField!
    @IBOutlet weak var tf_age: UITextField!
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var context:NSManagedObjectContext!
    var users = [User]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        context = appDelegate.persistentContainer.viewContext
        fetchData()
        tv_users.dataSource = self
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
            var users:[User] = []
            for data in result as! [NSManagedObject] {
                print(data.value(forKey: "username") as! String)
                users.append(User(username: data.value(forKey: "username") as! String, password: data.value(forKey: "password") as! String, age: data.value(forKey: "age") as! String))
            }
            self.users = users
            tv_users.reloadData()
        }
        catch{
            print("Failed to fetch")
        }
    }
    
    func getValues() -> (String, String, String) {
        let username = tf_username.text!
        let password = tf_password.text!
        let age = tf_age.text!
        
        return (username, password, age)
    }
    
    func insertUser(username:String, password:String, age:String){
        let entity = NSEntityDescription.entity(forEntityName: "Users", in: context)
        
        let newUser = NSManagedObject(entity: entity!, insertInto: context)
        
        newUser.setValue(username, forKey:"username")
        newUser.setValue(password, forKey:"password")
        newUser.setValue(age, forKey:"age")
        
        do {
            try context.save()
            updateTable()
            clearFields()
        }
        catch{
            print("Failed to save")
        }
    }
    
    func updateTable(){
        fetchData()
    }
    
    func clearFields(){
        tf_username.text = ""
        tf_password.text = ""
        tf_age.text = ""
    }
    
    @IBAction func bt_insertPressed(_ sender: Any) {
        let fields = getValues()
        insertUser(username: fields.0, password: fields.1, age: fields.2)
    }
}

extension ViewController:UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: UserTableViewCell.reuseIdentifier, for: indexPath) as? UserTableViewCell else{
            print("Failed to dequeue")
            fatalError("Unable to dequeue")
        }
        let user = users[indexPath.row]
        
        cell.lab_username.text = user.username
        cell.lab_password.text = user.password
        cell.lab_age.text = user.age
        return cell
    }
    
    
}




















