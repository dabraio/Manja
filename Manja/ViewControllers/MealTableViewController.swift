//
//  MealTableViewController.swift
//  Manja
//
//  Created by Faustino da Silva on 08/11/2015.
//  Copyright © 2015 Faustino Dabraio da Silva. All rights reserved.
//

import UIKit

class MealTableViewController: UITableViewController, UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource {
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
    private var categoryPickerVisible = false
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
        tableView.cellForRowAtIndexPath(NSIndexPath(forRow: 3, inSection: 0))?.detailTextLabel!.text = NSDateFormatter.localizedStringFromDate(date, dateStyle: .MediumStyle, timeStyle: .ShortStyle)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(animated: Bool) {
        switch editMode {
        case .Add:
            (tableView.cellForRowAtIndexPath(NSIndexPath(forRow: 5, inSection: 0)) as! EditableTextTableViewCell).txtField.becomeFirstResponder()
        default:
            (tableView.cellForRowAtIndexPath(NSIndexPath(forRow: 2, inSection: 0)) as! EditableTextTableViewCell).txtField.becomeFirstResponder()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func toggleDatePicker() {
        toggleDatePicker(nil)
    }
    
    private func toggleDatePicker(show: Bool?) {
        dateTimePickerVisible = show == nil ? !dateTimePickerVisible : show!
        
        tableView.reloadRowsAtIndexPaths([NSIndexPath(forRow: 4, inSection: 0)], withRowAnimation: .Automatic)
    }
    
    private func toggleCategoryPicker() {
        toggleCategoryPicker(nil)
    }
    
    private func toggleCategoryPicker(show: Bool?) {
        categoryPickerVisible = show == nil ? !categoryPickerVisible : show!
        
        tableView.reloadRowsAtIndexPaths([NSIndexPath(forRow: 1, inSection: 0)], withRowAnimation: .Automatic)
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 6
        case 1:
            return meal!.facts.count + 1
        default:
            return 0
        }
    }

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.view.endEditing(true)
        switch (indexPath.section, indexPath.row) {
        case (0, 0):
            if editMode != .Add {
                toggleCategoryPicker()
            }
        case (0, 3):
            toggleCategoryPicker(false)
            toggleDatePicker()
        default:
            toggleDatePicker(false)
            toggleCategoryPicker(false)
            if let cell = tableView.cellForRowAtIndexPath(indexPath) as? EditableTextTableViewCell {
                cell.txtField.becomeFirstResponder()
            }
        }
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        switch (indexPath.section, indexPath.row, editMode) {
        case (0, 1, _):
            return categoryPickerVisible ? 220 : 0
        case (0, 3, .New):
            return 0
        case (0, 3, .Edit):
            return 0
        case (0, 4, _):
            return dateTimePickerVisible ? 220 : 0
        default:
            return super.tableView(tableView, heightForRowAtIndexPath: indexPath)
        }
    }
    
    override func tableView(tableView: UITableView, didEndDisplayingCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        if let cell = cell as? EditableTextTableViewCell {
            switch (indexPath.section, indexPath.row) {
            /*case (0, 0):
                //cell.txtField.removeTarget(self, action: "editMealCategory:", forControlEvents: .EditingChanged)*/
            case (0, 2):
                cell.txtField.removeTarget(self, action: "editMealName:", forControlEvents: .EditingChanged)
            case (0, 5):
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
        if let _ = cell.imageView?.image {
            cell.imageView!.image = nil
        }
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: UITableViewCell
        
        switch (indexPath.section, indexPath.row) {
        case (0, 0):
            /*if editMode == .New {
                cell = createEditableTableViewCell(indexPath, leftText: "Category", rightText: meal!.category, tag: 1000)
                (cell as! EditableTextTableViewCell).txtField.addTarget(self, action: "editMealCategory:", forControlEvents: .EditingChanged)
                (cell as! EditableTextTableViewCell).txtField.keyboardType = .Default
                (cell as! EditableTextTableViewCell).txtField.autocorrectionType = .Yes
                (cell as! EditableTextTableViewCell).txtField.autocapitalizationType = .Sentences
            } else {*/
                cell = createTableViewCell(indexPath, leftText: "Category", rightText: meal!.category, tag: 1000)
            //}
        case (0, 1):
            cell = tableView.dequeueReusableCellWithIdentifier("PickerTableViewCell", forIndexPath: indexPath)
            cell.tag = 1001
            let picker: UIPickerView = (cell as! PickerTableViewCell).picker
            picker.dataSource = self
            picker.delegate = self
            picker.selectRow(MealCatalog.categoryIndex(meal!.category), inComponent: 0, animated: true)
        case (0, 2):
            if editMode == .Add {
                cell = createTableViewCell(indexPath, leftText: "Name", rightText: meal!.name, tag: 1002)
            } else {
                cell = createEditableTableViewCell(indexPath, leftText: "Name", rightText: meal!.name, tag: 1002)
                (cell as! EditableTextTableViewCell).txtField.addTarget(self, action: "editMealName:", forControlEvents: .EditingChanged)
                (cell as! EditableTextTableViewCell).txtField.keyboardType = .Default
                (cell as! EditableTextTableViewCell).txtField.autocorrectionType = .Yes
                (cell as! EditableTextTableViewCell).txtField.autocapitalizationType = .Sentences
            }
        case (0, 3):
            cell = createTableViewCell(indexPath, leftText: "Date and Time", rightText: NSDateFormatter.localizedStringFromDate(date, dateStyle: .MediumStyle, timeStyle: .ShortStyle), tag: 1003)
        case (0, 4):
            cell = tableView.dequeueReusableCellWithIdentifier("DateTimePickerTableViewCell", forIndexPath: indexPath)
            cell.tag = 1004
            let dateTimePicker: UIDatePicker = (cell as! DateTimePickerTableViewCell).dateTimePicker
            dateTimePicker.maximumDate = NSDate()
            dateTimePicker.addTarget(self, action: "didChangeDate:", forControlEvents: UIControlEvents.ValueChanged)
            dateTimePicker.date = date
        case (0, 5):
            let formatter = NSNumberFormatter()
            formatter.minimumIntegerDigits = 1
            formatter.minimumFractionDigits = 0
            formatter.maximumFractionDigits = 2
            
            if editMode == .Add {
                cell = createEditableTableViewCell(indexPath, leftText: "Serving Size", rightText: formatter.stringFromNumber(meal!.serving)!, tag: 1005)
                (cell as! EditableTextTableViewCell).txtField.addTarget(self, action: "editServingSize:", forControlEvents: .EditingChanged)
                (cell as! EditableTextTableViewCell).txtField.keyboardType = .DecimalPad
            } else {
                cell = createEditableTableViewCell(indexPath, leftText: "Typical Serving Size", rightText: formatter.stringFromNumber(meal!.serving)!, tag: 1005)
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
                cell = createTableViewCell(indexPath, leftText: fact.shortDescription, rightText: "\(formatter.stringFromNumber(meal!.newValueForTypeAtPosition(indexPath.row - 1))!) \(fact.unitDescription())", tag: indexPath.row - 1, imageName: fact.imageName)
            } else {
                let value = meal!.facts[indexPath.row - 1].value
                
                cell = createEditableTableViewCell(indexPath, leftText: fact.fullDescription(), rightText: value > 0 ? formatter.stringFromNumber(value)! : "", tag: indexPath.row - 1, imageName: fact.imageName)
                (cell as! EditableTextTableViewCell).txtField.addTarget(self, action: "editNutritionFact:", forControlEvents: .EditingChanged)
                (cell as! EditableTextTableViewCell).txtField.keyboardType = .DecimalPad
            }
        default:
            cell = UITableViewCell()
        }
        
        return cell
    }
    
    func createTableViewCell(indexPath: NSIndexPath, leftText: String, rightText: String, tag: Int, imageName: String?) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("FixedTextTableViewCell", forIndexPath: indexPath)
        cell.tag = tag
        cell.textLabel!.text = leftText
        cell.detailTextLabel!.text = rightText
        cell.detailTextLabel!.font = cell.textLabel!.font
        addImageToCell(cell, imageName: imageName)
        return cell
    }
    
    func addImageToCell(cell: UITableViewCell, imageName: String?) {
        if imageName != nil {
            var imgView: UIImageView
            if cell.reuseIdentifier! == "EditableImageTextTableViewCell" {
                imgView = (cell as! EditableTextTableViewCell).imgView!
            } else {
                imgView = cell.imageView!
            }
            
            if let image = UIImage(named: imageName!) {
                imgView.image = image
            } else {
                let image = UIImage(named: "HKQuantityTypeIdentifierAutomatic")
                imgView.image = image
            }
        }
    }
    
    func createTableViewCell(indexPath: NSIndexPath, leftText: String, rightText: String, tag: Int) -> UITableViewCell {
        return createTableViewCell(indexPath, leftText: leftText, rightText: rightText, tag: tag, imageName: nil)
    }
    
    func createEditableTableViewCell(indexPath: NSIndexPath, leftText: String, rightText: String, tag: Int, imageName: String?) -> UITableViewCell {
        let reusableIdentifier: String = imageName == nil ? "EditableTextTableViewCell" : "EditableImageTextTableViewCell"
        
        let cell = tableView.dequeueReusableCellWithIdentifier(reusableIdentifier, forIndexPath: indexPath) as! EditableTextTableViewCell
        cell.tag = 2000 + tag
        cell.label.text = leftText
        cell.txtField.delegate = self
        cell.txtField.text = rightText
        cell.txtField.font = cell.label.font
        cell.txtField.tag = tag
        addImageToCell(cell, imageName: imageName)
        return cell
    }
    
    func createEditableTableViewCell(indexPath: NSIndexPath, leftText: String, rightText: String, tag: Int) -> UITableViewCell {
        return createEditableTableViewCell(indexPath, leftText: leftText, rightText: rightText, tag: tag, imageName: nil)
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
    
    // MARK: UIPickerViewDataSource
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // MARK: UIPickerViewDelegate
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return MealCatalog.categories().count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return MealCatalog.categoryName(row)
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        meal?.category = MealCatalog.categoryName(row)
        tableView.cellForRowAtIndexPath(NSIndexPath(forRow: 0, inSection: 0))?.detailTextLabel!.text = MealCatalog.categoryName(row)
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
    
    /*func editMealCategory(textField: UITextField) {
        meal!.category = textField.text ?? ""
    }*/
    
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
