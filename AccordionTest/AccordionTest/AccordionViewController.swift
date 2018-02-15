//
//  AccordionViewController.swift
//  AccordionTest
//
//  Created by Harnack, Paul (Student) on 2/14/18.
//  Copyright © 2018 Harnack, Paul (Student). All rights reserved.
//

import Foundation
import UIKit
import AccordionMenuSwift

class AccordionViewController: AccordionTableViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let item1 = Parent(state: .collapsed, childs: ["SubItem 1", "SubItem 2", "SubItem 3"], title: "Item 1")
        let item2 = Parent(state: .collapsed, childs: ["SubItem 1", "SubItem 2"], title: "Item 2")
        let item3 = Parent(state: .collapsed, childs: ["SubItem 1", "SubItem 2", "SubItem 3"], title: "Item 3")
        let item4 = Parent(state: .collapsed, childs: ["SubItem 1", "SubItem 2"], title: "Item 4")
        let item5 = Parent(state: .collapsed, childs: [], title: "Item 5") // No childs for this cell
        
        dataSource = [item1, item2, item3, item4, item5]
        numberOfCellsExpanded = .several
        total = dataSource.count
    }
}
