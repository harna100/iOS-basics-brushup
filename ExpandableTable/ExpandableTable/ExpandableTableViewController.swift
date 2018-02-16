//
//  ExapandableTableViewController.swift
//  ExpandableTable
//
//  Created by Harnack, Paul (Student) on 2/15/18.
//  Copyright © 2018 Harnack, Paul (Student). All rights reserved.
//

import UIKit

class ExpandableTableViewController: UITableViewController {

    var cellDataNodes:[CellDataNode]!
    var currentlyShown:[CellDataNode]!
    // TODO figure out a way to make an array of cell types so that user doesn't have to add if statements to cast
    // var cellTypes:[CellType.Type] = [CategoryTableViewCell.self]

    func getCellData() {
        cellDataNodes = []
        cellDataNodes.append(
                CategoryDataNode(categoryName: "Test Cell 1", children: [], completionEvents: [])
        )
        cellDataNodes.append(
                CategoryDataNode(categoryName: "Test Cell 2", children: [], completionEvents: [])
        )
        cellDataNodes.append(
                CategoryDataNode(categoryName: "Test Cell 3", children: [], completionEvents: [])
        )
        cellDataNodes.append(
                CategoryDataNode(categoryName: "Test Cell 4", children: [], completionEvents: [])
        )

        currentlyShown.append(contentsOf: cellDataNodes)
    }

    override func viewDidLoad() {
        getCellData()
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        /*var count = 0

        cellData.forEach { node in
            if(node.hasChildren){
                count += node.getChildCount()
            }
            count += 1
         }*/

        var count = currentlyShown.count

        print("Row Count: \(count)")
        return count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        if let castedCell = cell as? CategoryTableViewCell {
            castedCell.updateViews()
        }
        //TODO add else ifs as I add cells

        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let row = indexPath.row
        let cellDataNode:CellDataNode = currentlyShown[row]

        cellDataNode.completionEvents.forEach { event in event() }

        if(cellDataNode.hasChildren && !cellDataNode.isExpanded){
            cellDataNode.isExpanded = true
            // TODO figure out if begin/endUpdates is needed
            self.tableView.beginUpdates()
            currentlyShown.insert(contentsOf: cellDataNode.children, at: row)
            self.tableView.endUpdates()
        }
        else if(cellDataNode.hasChildren && cellDataNode.isExpanded){
            cellDataNode.isExpanded = false
            self.tableView.beginUpdates()
            let offset = row+1
            currentlyShown.removeSubrange(offset ... offset + cellDataNode.children.count)
        }
    }
}
