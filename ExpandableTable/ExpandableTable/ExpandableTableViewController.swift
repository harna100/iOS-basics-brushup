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
        currentlyShown = []
        cellDataNodes.append(
                CategoryDataNode(categoryName: "Test Cell 1", children: [
                    CategoryDataNode(categoryName: "Test Cell 1a", children: [], completionEvents: []),
                    CategoryDataNode(categoryName: "Test Cell 1b", children: [
                        CategoryDataNode(categoryName: "Test Cell 1ba", children: [], completionEvents: []),
                        CategoryDataNode(categoryName: "Test Cell 1bb", children: [], completionEvents: []),
                        CategoryDataNode(categoryName: "Test Cell 1bc", children: [], completionEvents: []),
                        CategoryDataNode(categoryName: "Test Cell 1bd", children: [], completionEvents: [])
                    ], completionEvents: []),
                    CategoryDataNode(categoryName: "Test Cell 1c", children: [], completionEvents: [])
                ], completionEvents: [])
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
        let nib = UINib(nibName: "CategoryTableViewCell", bundle: nil)
        self.tableView.register(nib, forCellReuseIdentifier: CategoryTableViewCell.reuseIdentifier())

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
        let row = indexPath.row
        // TODO figure out how this can be used to dequeue a cell?
        // let node:CellDataNode = currentlyShown[row]

        var cell = tableView.dequeueReusableCell(withIdentifier: CategoryDataNode.reuseIdentifier(), for: indexPath)

        if let castedCell = cell as? CategoryTableViewCell {
            castedCell.categoryDataNode = currentlyShown[row] as! CategoryDataNode
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
//            self.tableView.beginUpdates()
            currentlyShown.insert(contentsOf: cellDataNode.children, at: row+1)
            self.tableView.reloadData()
//            self.tableView.endUpdates()
        }
        else if(cellDataNode.hasChildren && cellDataNode.isExpanded){
            cellDataNode.isExpanded = false
//            self.tableView.beginUpdates()
            // TODO figure out how to also remove sub children (Check sublime for possible answer)
            closeNodes(nodes: cellDataNode.children, startPos: row)

            let offset = row+1
            currentlyShown.removeSubrange(offset ..< offset + cellDataNode.children.count)

            self.tableView.reloadData()
//            self.tableView.endUpdates()
        }
    }

    func closeNodes(nodes:[CellDataNode], startPos:Int){
        var idx = startPos
        for node in nodes {
            idx += 1
            if(node.isExpanded && node.hasChildren){
                closeNodes(nodes: node.children, startPos: idx)
                currentlyShown.removeSubrange(idx ... node.children.count+1)
            }
        }
    }
}
