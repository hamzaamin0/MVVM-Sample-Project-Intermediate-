//
//  CoursesTableViewCell.swift
//  MVVMIntermediate
//
//  Created by MAC on 08/10/2021.
//

import UIKit

class CoursesTableViewCell: UITableViewCell {

    @IBOutlet weak var courseNameLabel: UILabel!
    @IBOutlet weak var courseDescriptionLabel: UILabel!
    
    
    static let identifier = "CoursesTableViewCell"
    
    var courseViewModel: CourseViewModel! {
        
        didSet{
            courseNameLabel.text = courseViewModel.name
            courseDescriptionLabel.text = courseViewModel.description
            accessoryType = courseViewModel.accessoryType
            
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    static func nib() -> UINib{
        
        return UINib(nibName: "CoursesTableViewCell", bundle: nil)
    }
    
}
