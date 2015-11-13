//
//  MealTableViewController.swift
//  Manja
//
//  Created by Faustino da Silva on 08/11/2015.
//  Copyright © 2015 Faustino Dabraio da Silva. All rights reserved.
//

import UIKit

class MealTableViewController: UITableViewController, UITextFieldDelegate {
    enum EditMode {
        case Add, Edit, New
    }
    
    // MARK: Properties
    @IBOutlet weak var leftBarButton: UIBarButtonItem!
    @IBOutlet weak var rightBarButton: UIBarButtonItem!
    var meal: Meal?
    var date: NSDate = NSDate() {
        didSet {
            dateChanged()
        }
    }
    private var dateTimePickerVisible = false
    var editMode: EditMode = .Add {
        didSet {
            switch editMode {
            case .Add:
                self.title = "Add Meal"
            case .Edit:
                self.title = "Edit Meal"
            case .New:
                self.title = "New Meal"
            }
        }
    }
    
    private func dateChanged() {
        tableView.cellForRowAtIndexPath(NSIndexPath(forRow: 1, inSection: 0))?.detailTextLabel!.text = NSDateFormatter.localizedStringFromDate(date, dateStyle: .ShortStyle, timeStyle: .ShortStyle)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func toggleDatePicker() {
        dateTimePickerVisible = !dateTimePickerVisible
        
        // Force table to update its contents
        tableView.beginUpdates()
        tableView.endUpdates()
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        switch section {
        case 0:
            return 4
        case 1:
            return meal!.facts.count + 1
        default:
            return 0
        }
    }

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        switch (indexPath.section, indexPath.row) {
        case (0, 1):
            toggleDatePicker()
        /*case (0, 3):
            (tableView.cellForRowAtIndexPath(indexPath) as! EditableTextTableViewCell).valueTextField.becomeFirstResponder()*/
        default:
            ()
        }
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if indexPath.section == 0 && indexPath.row == 2 {
            return dateTimePickerVisible ? 220 : 0
        } else {
            return super.tableView(tableView, heightForRowAtIndexPath: indexPath)
        }
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: UITableViewCell
        
        switch (indexPath.section, indexPath.row) {
        case (0, 0):
            cell = tableView.dequeueReusableCellWithIdentifier("FixedTextTableViewCell", forIndexPath: indexPath)
            cell.textLabel!.text = "Name"
            cell.detailTextLabel!.text = meal!.name
        case (0, 1):
            cell = tableView.dequeueReusableCellWithIdentifier("FixedTextTableViewCell", forIndexPath: indexPath)
            cell.textLabel!.text = "Date and time"
            cell.detailTextLabel!.text = NSDateFormatter.localizedStringFromDate(date, dateStyle: .ShortStyle, timeStyle: .ShortStyle)
        case (0, 2):
            cell = tableView.dequeueReusableCellWithIdentifier("DateTimePickerTableViewCell", forIndexPath: indexPath)
            let dateTimePicker: UIDatePicker = (cell as! DateTimePickerTableViewCell).dateTimePicker
            dateTimePicker.maximumDate = NSDate()
            dateTimePicker.addTarget(self, action: "didChangeDate:", forControlEvents: UIControlEvents.ValueChanged)
            dateTimePicker.date = date
        case (0, 3):
            let formatter = NSNumberFormatter()
            formatter.minimumIntegerDigits = 1
            formatter.minimumFractionDigits = 0
            formatter.maximumFractionDigits = 2
            cell = createEditableTableViewCell(indexPath, labelText: "Serving Size", value: formatter.stringFromNumber(meal!.serving)!)
        case (1, 0):
            cell = tableView.dequeueReusableCellWithIdentifier("FixedTextTableViewCell", forIndexPath: indexPath)
            cell.textLabel!.text = "Reference Serving Size"
            let formatter = NSNumberFormatter()
            formatter.minimumIntegerDigits = 1
            formatter.minimumFractionDigits = 0
            formatter.maximumFractionDigits = 2
            cell.detailTextLabel!.text = formatter.stringFromNumber(meal!.referenceServing)
        default:
            if editMode == .Add {
                cell = tableView.dequeueReusableCellWithIdentifier("FixedTextTableViewCell", forIndexPath: indexPath)
                let typeIdentifier: String = meal!.facts[indexPath.row - 1].typeIdentifier
                let fact: HealthKitManager.TypeInfo = HealthKitManager.types[typeIdentifier]!
                
                cell.textLabel!.text = fact.description
                
                let formatter = NSNumberFormatter()
                formatter.minimumIntegerDigits = 1
                formatter.minimumFractionDigits = 0
                formatter.maximumFractionDigits = 2
                cell.detailTextLabel!.text = "\(formatter.stringFromNumber(meal!.newValueForTypeAtPosition(indexPath.row - 1))!) \(fact.unitDescription())"
            } else {
                let typeIdentifier: String = meal!.facts[indexPath.row - 1].typeIdentifier
                let fact: HealthKitManager.TypeInfo = HealthKitManager.types[typeIdentifier]!
                
                let formatter = NSNumberFormatter()
                formatter.minimumIntegerDigits = 1
                formatter.minimumFractionDigits = 0
                formatter.maximumFractionDigits = 2
                
                cell = createTableViewCell(indexPath, labelText: fact.fullDescription(), detail: "\(formatter.stringFromNumber(meal!.newValueForTypeAtPosition(indexPath.row - 1))!)")
            }
        }
        
        return cell
    }
    
    func createTableViewCell(indexPath: NSIndexPath, labelText: String, detail: String) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("FixedTextTableViewCell", forIndexPath: indexPath)
        cell.textLabel!.text = labelText
        cell.detailTextLabel!.text = detail
        return cell
    }
    
    func createEditableTableViewCell(indexPath: NSIndexPath, labelText: String, value: String) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("EditableTextTableViewCell", forIndexPath: indexPath)
        
        /*cell.detailTextLabel!.hidden = true
        
        let textField: UITextField = UITextField()
        textField.tag = indexPath.section * 1000 + indexPath.row
        textField.enablesReturnKeyAutomatically = true
        textField.autocorrectionType = .No
        textField.autocapitalizationType = .None
        textField.textAlignment = .Right
        textField.text = "100"
        
        cell.contentView.addSubview(textField)
        
        let cellBounds: CGRect = cell.bounds
        let textFieldBorder: CGFloat = cell.textLabel!.bounds.width + 100
        let aRect: CGRect = CGRectMake(textFieldBorder, 0, CGRectGetWidth(cellBounds)-textFieldBorder-cell.textLabel!.bounds.minX, cellBounds.height)
        
        textField.frame = aRect
        
        // Configure UITextAttributes for each field
            textField.placeholder = "Name"
            textField.returnKeyType = UIReturnKeyType.Next
            textField.autocapitalizationType = UITextAutocapitalizationType.Words
        */
        cell.textLabel!.text = labelText
        cell.detailTextLabel!.hidden = true
        cell.removeFromSuperview()
        
        cell.viewWithTag(indexPath.section * 1000 + indexPath.row)?.removeFromSuperview()
        
        let textField: UITextField = UITextField()
        textField.tag = indexPath.section * 1000 + indexPath.row;
        textField.translatesAutoresizingMaskIntoConstraints = false
        cell.contentView.addSubview(textField)
        cell.addConstraint(NSLayoutConstraint(item: textField, attribute: NSLayoutAttribute.Leading, relatedBy: NSLayoutRelation.Equal, toItem: cell.textLabel, attribute: NSLayoutAttribute.Trailing, multiplier: 1, constant: 8))
        cell.addConstraint(NSLayoutConstraint(item: textField, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: cell.contentView, attribute: NSLayoutAttribute.Top, multiplier: 1, constant: 8))
        cell.addConstraint(NSLayoutConstraint(item: textField, attribute: NSLayoutAttribute.Bottom, relatedBy: NSLayoutRelation.Equal, toItem: cell.contentView, attribute: NSLayoutAttribute.Bottom, multiplier: 1, constant: -8))
        cell.addConstraint(NSLayoutConstraint(item: textField, attribute: NSLayoutAttribute.Trailing, relatedBy: NSLayoutRelation.Equal, toItem: cell.detailTextLabel, attribute: NSLayoutAttribute.Trailing, multiplier: 1, constant: 0))
        
        textField.textAlignment = NSTextAlignment.Right;
        textField.keyboardType = UIKeyboardType.DecimalPad
        
        textField.addTarget(self, action: "textFieldDidEndEditing:", forControlEvents: UIControlEvents.EditingChanged)
        
        textField.delegate = self
        
        textField.text = value

        return cell
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Meal Information"
        case 1:
            return "Nutrition Facts"
        default:
            return ""
        }
    }
    
    // MARK: UITextFieldDelegate
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        // Hide the keyboard.
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        meal!.serving = Double(textField.text!) ?? 0
        let newValue: NSNumber = NSNumberFormatter().numberFromString(textField.text!) ?? 0
        meal!.serving = newValue.doubleValue
        
        tableView.reloadSections(NSIndexSet(index: 1), withRowAnimation: UITableViewRowAnimation.Automatic)
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    // MARK: Navigation
    @IBAction func cancel(sender: UIBarButtonItem) {
        dismissViewControllerAnimated(true, completion: nil)
    }

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if sender === rightBarButton {
            if editMode == .Add {
                meal!.timestamp = date
            }
        } else {
            meal = nil
        }
    }
    
    // MARK: Actions
    @IBAction func didChangeDate(sender: UIDatePicker) {
        date = sender.date
    }
}
