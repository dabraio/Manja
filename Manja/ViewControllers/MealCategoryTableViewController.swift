//
//  MealCategoryTableViewController.swift
//  Manja
//
//  Created by Faustino da Silva on 17/11/2015.
//  Copyright © 2015 Faustino Dabraio da Silva. All rights reserved.
//

import UIKit

class MealCategoryTableViewController: UITableViewController {

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Use the edit button item provided by the table view controller.
        navigationItem.leftBarButtonItem = editButtonItem()
        navigationItem.leftBarButtonItem!.tintColor = .whiteColor()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MealCatalog.categoryCount()
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("MealCategoryTableViewCell", forIndexPath: indexPath)
        cell.textLabel!.text = MealCatalog.categoryName(indexPath.row)
        return cell
    }
    
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    override func tableView(tableView: UITableView, editingStyleForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCellEditingStyle {
        return MealCatalog.categoryAt(indexPath.row).meals.isEmpty ? .Delete : .None
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            MealCatalog.removeCategory(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
            MealCatalog.saveData()
        }
    }

    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {
        //let category = MealCatalog.removeCategory(fromIndexPath.row)
        //MealCatalog.insertCategory(category, atCategoryIndex: toIndexPath.row)
        MealCatalog.moveCategory(fromIndexPath.row, toIndex: toIndexPath.row)
        MealCatalog.saveData()
        tableView.reloadData()
    }

    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if tableView.editing {
            let oldName = MealCatalog.categoryName(indexPath.row)
            let alertController = UIAlertController(title: oldName, message: "Please enter a new name:", preferredStyle: .Alert)
            alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: { (action) -> Void in
                let newName = alertController.textFields!.first!.text!
                if !newName.isEmpty {
                    MealCatalog.categoryAt(indexPath.row).changeCategoryName(newName)
                    MealCatalog.saveData()
                    tableView.reloadData()
                }
            }))
            alertController.addAction(UIAlertAction(title: "Cancel", style: .Cancel, handler: nil))
            alertController.addTextFieldWithConfigurationHandler({ (textField) -> Void in
                textField.text! = oldName
            })
            self.presentViewController(alertController, animated: true, completion: nil)
        }
    }
    
    @IBAction func addCategory(sender: UIBarButtonItem) {
        let alertController = UIAlertController(title: "New Category", message: "Please enter a name:", preferredStyle: .Alert)
        alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: { (action) -> Void in
            let newName = alertController.textFields!.first!.text!
            if !newName.isEmpty {
                MealCatalog.addCategory(Category(name: newName, meals: []))
                MealCatalog.saveData()
                self.tableView.reloadData()
            }
        }))
        alertController.addAction(UIAlertAction(title: "Cancel", style: .Cancel, handler: nil))
        alertController.addTextFieldWithConfigurationHandler(nil)
        self.presentViewController(alertController, animated: true, completion: nil)
    }
}
