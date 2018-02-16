//
//  CellDataNode.swift
//  ExpandableTable
//
//  Created by Harnack, Paul (Student) on 2/15/18.
//  Copyright © 2018 Harnack, Paul (Student). All rights reserved.
//

import Foundation

class CellDataNode {
    var children:[CellDataNode] = []
    var hasChildren:Bool {
        get {
            return children.count != 0
        }
    }
    var reuseIdentifier:String! {get{return self.reuseIdentifier}}
    var completetionEvents:[()->()]
    
    
    init(children:[CellDataNode], completetionEvents:[()->()]) {
        self.children = children
        self.completetionEvents = completetionEvents
    }
    
    
}
