//
//  StudentListCell.swift
//  MyPersonalTrainer
//
//  Created by Nuno on 03/09/2017.
//  Copyright © 2017 Nuno. All rights reserved.
//

import UIKit

class StudentListCell: UITableViewCell {

    @IBOutlet weak var studentName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func updateUI(student: Student){
        
        studentName.text = student.name
    }

}
