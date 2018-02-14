//
//  UserCellTableViewCell.swift
//  CoreDataTest
//
//  Created by Harnack, Paul (Student) on 2/14/18.
//  Copyright © 2018 Harnack, Paul (Student). All rights reserved.
//

import UIKit

class UserTableViewCell: UITableViewCell {

    static let reuseIdentifier = "UserCell"
    
    @IBOutlet var lab_username:UILabel!
    @IBOutlet var lab_password:UILabel!
    @IBOutlet var lab_age:UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}



