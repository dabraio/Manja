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
        tableView.cellForRowAtIndexPath(NSIndexPath(forRow: 2, inSection: 0))?.detailTextLabel!.text = NSDateFormatter.localizedStringFromDate(date, dateStyle: .MediumStyle, timeStyle: .ShortStyle)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        //print("didReceiveMemoryWarning")
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func toggleDatePicker() {
        //print("toggleDatePicker")
        dateTimePickerVisible = !dateTimePickerVisible
        
        // Force table to update its contents
        tableView.beginUpdates()
        tableView.endUpdates()
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        //print("numberOfSectionsInTableView")
        return 2
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //print("tableView-numberOfRowsInSection")
        // #warning Incomplete implementation, return the number of rows
        switch section {
        case 0:
            return 5
        case 1:
            return meal!.facts.count + 1
        default:
            return 0
        }
    }

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        //print("tableView-didSelectRowAtIndexPath at " + String(indexPath.section) + "," + String(indexPath.row) + "")
        switch (indexPath.section, indexPath.row) {
        case (0, 2):
            toggleDatePicker()
        /*case (0, 4):
            (tableView.cellForRowAtIndexPath(indexPath) as! EditableTextTableViewCell).valueTextField.becomeFirstResponder()*/
        default:
            ()
        }
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        //print("tableView-heightForRowAtIndexPath at " + String(indexPath.section) + "," + String(indexPath.row) + "")
        switch (indexPath.section, indexPath.row, editMode) {
        case (0, 2, .New):
            return 0
        case (0, 2, .Edit):
            return 0
        case (0, 3, _):
            return dateTimePickerVisible ? 220 : 0
        default:
            return super.tableView(tableView, heightForRowAtIndexPath: indexPath)
        }
    }
    
    override func tableView(tableView: UITableView, didEndDisplayingCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        if let cell = cell as? EditableTextTableViewCell {
            switch (indexPath.section, indexPath.row) {
            case (0, 0):
                cell.txtField.removeTarget(self, action: "editMealCategory:", forControlEvents: .EditingChanged)
            case (0, 1):
                cell.txtField.removeTarget(self, action: "editMealName:", forControlEvents: .EditingChanged)
            case (0, 4):
                if editMode != .Add {
                    cell.txtField.removeTarget(self, action: "editTypicalServingSize:", forControlEvents: .EditingChanged)
                } else {
                    cell.txtField.removeTarget(self, action: "editServingSize:", forControlEvents: .EditingChanged)
                }
            case (1, 0):
                cell.txtField.removeTarget(self, action: "editReferenceServingSize:", forControlEvents: .EditingChanged)
            default:
                cell.txtField.removeTarget(self, action: "editNutritionFact:", forControlEvents: .EditingChanged)
            }
        }
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        //print("tableView-cellForRowAtIndexPath at " + String(indexPath.section) + "," + String(indexPath.row) + "")
        let cell: UITableViewCell
        
        switch (indexPath.section, indexPath.row) {
        case (0, 0):
            if editMode == .New {
                cell = createEditableTableViewCell(indexPath, leftText: "Category", rightText: meal!.category, tag: 1000)
                (cell as! EditableTextTableViewCell).txtField.addTarget(self, action: "editMealCategory:", forControlEvents: .EditingChanged)
                (cell as! EditableTextTableViewCell).txtField.keyboardType = .Default
                (cell as! EditableTextTableViewCell).txtField.autocorrectionType = .Yes
                (cell as! EditableTextTableViewCell).txtField.autocapitalizationType = .Sentences
            } else {
                cell = createTableViewCell(indexPath, leftText: "Category", rightText: meal!.category, tag: 1000)
            }
        case (0, 1):
            if editMode == .Add {
                cell = createTableViewCell(indexPath, leftText: "Name", rightText: meal!.name, tag: 1001)
            } else {
                cell = createEditableTableViewCell(indexPath, leftText: "Name", rightText: meal!.name, tag: 1001)
                (cell as! EditableTextTableViewCell).txtField.addTarget(self, action: "editMealName:", forControlEvents: .EditingChanged)
                (cell as! EditableTextTableViewCell).txtField.keyboardType = .Default
                (cell as! EditableTextTableViewCell).txtField.autocorrectionType = .Yes
                (cell as! EditableTextTableViewCell).txtField.autocapitalizationType = .Sentences
            }
        case (0, 2):
            cell = createTableViewCell(indexPath, leftText: "Date and Time", rightText: NSDateFormatter.localizedStringFromDate(date, dateStyle: .MediumStyle, timeStyle: .ShortStyle), tag: 1002)
        case (0, 3):
            cell = tableView.dequeueReusableCellWithIdentifier("DateTimePickerTableViewCell", forIndexPath: indexPath)
            cell.tag = 1003
            let dateTimePicker: UIDatePicker = (cell as! DateTimePickerTableViewCell).dateTimePicker
            dateTimePicker.maximumDate = NSDate()
            dateTimePicker.addTarget(self, action: "didChangeDate:", forControlEvents: UIControlEvents.ValueChanged)
            dateTimePicker.date = date
        case (0, 4):
            let formatter = NSNumberFormatter()
            formatter.minimumIntegerDigits = 1
            formatter.minimumFractionDigits = 0
            formatter.maximumFractionDigits = 2
            
            if editMode == .Add {
                cell = createEditableTableViewCell(indexPath, leftText: "Serving Size", rightText: formatter.stringFromNumber(meal!.serving)!, tag: 1004)
                (cell as! EditableTextTableViewCell).txtField.addTarget(self, action: "editServingSize:", forControlEvents: .EditingChanged)
                (cell as! EditableTextTableViewCell).txtField.keyboardType = .DecimalPad
            } else {
                cell = createEditableTableViewCell(indexPath, leftText: "Typical Serving Size", rightText: formatter.stringFromNumber(meal!.serving)!, tag: 1004)
                (cell as! EditableTextTableViewCell).txtField.addTarget(self, action: "editTypicalServingSize:", forControlEvents: .EditingChanged)
                (cell as! EditableTextTableViewCell).txtField.keyboardType = .DecimalPad
            }
        case (1, 0):
            let formatter = NSNumberFormatter()
            formatter.minimumIntegerDigits = 1
            formatter.minimumFractionDigits = 0
            formatter.maximumFractionDigits = 2
            
            if editMode == .Add {
                cell = createTableViewCell(indexPath, leftText: "Reference Serving Size", rightText: formatter.stringFromNumber(meal!.referenceServing)!, tag: 2000)
            } else {
                cell = createEditableTableViewCell(indexPath, leftText: "Reference Serving Size", rightText: formatter.stringFromNumber(meal!.referenceServing)!, tag: 2000)
                (cell as! EditableTextTableViewCell).txtField.addTarget(self, action: "editReferenceServingSize:", forControlEvents: .EditingChanged)
                (cell as! EditableTextTableViewCell).txtField.keyboardType = .DecimalPad
            }
        case (1, _): // Nutrition Facts
            let typeIdentifier: String = meal!.facts[indexPath.row - 1].typeIdentifier
            let fact: TypeInfo = HealthKitManager.types[typeIdentifier]!
            let formatter = NSNumberFormatter()
            formatter.minimumIntegerDigits = 1
            formatter.minimumFractionDigits = 0
            formatter.maximumFractionDigits = 3
            
            if editMode == .Add {
                cell = createTableViewCell(indexPath, leftText: fact.shortDescription, rightText: "\(formatter.stringFromNumber(meal!.newValueForTypeAtPosition(indexPath.row - 1))!) \(fact.unitDescription())", tag: indexPath.row - 1)
            } else {
                let value = meal!.facts[indexPath.row - 1].value
                
                cell = createEditableTableViewCell(indexPath, leftText: fact.fullDescription(), rightText: value > 0 ? formatter.stringFromNumber(value)! : "", tag: indexPath.row - 1)
                (cell as! EditableTextTableViewCell).txtField.addTarget(self, action: "editNutritionFact:", forControlEvents: .EditingChanged)
                (cell as! EditableTextTableViewCell).txtField.keyboardType = .DecimalPad
            }
        default:
            cell = UITableViewCell()
            print("defaulting!")
        }
        
        return cell
    }
    
    func createTableViewCell(indexPath: NSIndexPath, leftText: String, rightText: String, tag: Int) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("FixedTextTableViewCell", forIndexPath: indexPath)
        cell.tag = tag
        cell.textLabel!.text = leftText
        cell.detailTextLabel!.text = rightText
        cell.detailTextLabel!.font = cell.textLabel!.font
        return cell
    }
    
    
    func createEditableTableViewCell(indexPath: NSIndexPath, leftText: String, rightText: String, tag: Int) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("EditableTextTableViewCell", forIndexPath: indexPath) as! EditableTextTableViewCell
        cell.tag = 2000 + tag
        cell.label.text = leftText
        cell.txtField.delegate = self
        cell.txtField.text = rightText
        cell.txtField.font = cell.label.font
        cell.txtField.tag = tag
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
    
    func editServingSize(textField: UITextField) {
        meal!.serving = (NSNumberFormatter().numberFromString(textField.text!) ?? 0).doubleValue
        tableView.reloadSections(NSIndexSet(index: 1), withRowAnimation: UITableViewRowAnimation.Automatic)
    }
    
    func editMealCategory(textField: UITextField) {
        meal!.category = textField.text ?? ""
    }
    
    func editMealName(textField: UITextField) {
        meal!.name = textField.text ?? ""
    }
    
    func editTypicalServingSize(textField: UITextField) {
        meal!.serving = (NSNumberFormatter().numberFromString(textField.text!) ?? 0).doubleValue
    }
    
    func editReferenceServingSize(textField: UITextField) {
        meal!.referenceServing = (NSNumberFormatter().numberFromString(textField.text!) ?? 0).doubleValue
    }
    
    func editNutritionFact(textField: UITextField) {
        meal!.facts[textField.tag].value = (NSNumberFormatter().numberFromString(textField.text!) ?? 0).doubleValue
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
        //print("cancel")
        dismissViewControllerAnimated(true, completion: nil)
    }

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        //print("prepareForSegue")
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
        //print("didChangeDate")
        date = sender.date
    }
}
