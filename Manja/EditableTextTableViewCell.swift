//
//  EditableTextTableViewCell.swift
//  Manja
//
//  Created by Faustino da Silva on 14/11/2015.
//  Copyright © 2015 Faustino Dabraio da Silva. All rights reserved.
//

import UIKit

class EditableTextTableViewCell: UITableViewCell {
    // MARK: Properties
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var txtField: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}
