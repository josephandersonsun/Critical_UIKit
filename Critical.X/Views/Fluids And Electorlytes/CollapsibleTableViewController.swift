//
//  CollapsibleTableViewController.swift
//  ios-swift-collapsible-table-section
//
//  Created by Yong Su on 5/30/16.
//  Copyright © 2016 Yong Su. All rights reserved.
//

import UIKit

//
// MARK: - View Controller
//
class CollapsibleTableViewController: UITableViewController {
    
    var sections = sectionsData
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Auto resizing the height of the cell
        tableView.estimatedRowHeight = 44.0
        tableView.rowHeight = UITableView.automaticDimension
        
        self.title = "Fluids, Blood Products"
    }
    
    @IBAction func closeFluids(_ sender: AnyObject) {
        dismiss(animated: true, completion: nil)
    }
    
    // Once the view appears, the animation starts.
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        //change the color of the navigationbar
        self.navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.8156862745, green: 0.2549019608, blue: 0.2549019608, alpha: 1)
        
        
    }
    
    // Change the color back when the view dissappears
    override func viewWillDisappear(_ animated: Bool) {
        //change the color of the navigationbar
        self.navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.3759999871, green: 0.4900000095, blue: 0.5450000167, alpha: 1)
        
        
    }
}




//
// MARK: - View Controller DataSource and Delegate
//
extension CollapsibleTableViewController {

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return sections.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return sections[section].collapsed ? 0 : sections[section].items.count
    }
    
    // Cell
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: CollapsibleTableViewCell =
            tableView.dequeueReusableCell(withIdentifier: "cell") as? CollapsibleTableViewCell ??
            
            CollapsibleTableViewCell(style: .default, reuseIdentifier: "cell")
        
        let item: Item = sections[indexPath.section].items[indexPath.row]
        
        cell.nameLabel.text = item.name
        
        cell.detailLabel.text = item.detail
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return UITableView.automaticDimension
    }
    
    // Header
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "header") as? CollapsibleTableViewHeader ?? CollapsibleTableViewHeader(reuseIdentifier: "header")
        
        
        header.titleLabel.text = sections[section].name
        
        header.arrowLabel.text = ">"
        
        header.setCollapsed(sections[section].collapsed)
        
        header.section = section
        
        header.delegate = self
        
        return header
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return 44.0
    }
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection
        section: Int) -> CGFloat {
        
        return 1.0
    }

}

//
// MARK: - Section Header Delegate
//
extension CollapsibleTableViewController: CollapsibleTableViewHeaderDelegate {
    
    func toggleSection(_ header: CollapsibleTableViewHeader, section: Int) {
        
        let collapsed = !sections[section].collapsed
        
        // Toggle collapse
        sections[section].collapsed = collapsed
        
        header.setCollapsed(collapsed)
        
        tableView.reloadSections(NSIndexSet(index: section) as IndexSet, with: .automatic)
    }
    
}
