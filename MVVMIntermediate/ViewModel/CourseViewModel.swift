//
//  CourseViewModel.swift
//  MVVMIntermediate
//
//  Created by MAC on 08/10/2021.
//

import Foundation
import UIKit

struct CourseViewModel{
    
    let name: String
    let description: String
    let accessoryType: UITableViewCell.AccessoryType
    
    init(course: Course) {
        self.name = course.name
        if course.numberOfLessons > 30{
            
            self.description = "30+ Lessons. Check it out"
            self.accessoryType = .detailDisclosureButton
            
        }else {
            
            self.description = "\(course.numberOfLessons) Lessons"
            self.accessoryType = .none
            
        }
    }
}
