//
//  EditableTextTableViewCell.swift
//  Manja
//
//  Created by Faustino da Silva on 08/11/2015.
//  Copyright © 2015 Faustino Dabraio da Silva. All rights reserved.
//

import UIKit

class EditableTextTableViewCell: UITableViewCell {
    @IBOutlet weak var valueTextField: UITextField!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
