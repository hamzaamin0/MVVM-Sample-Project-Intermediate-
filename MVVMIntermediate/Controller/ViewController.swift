//
//  ViewController.swift
//  MVVMIntermediate
//
//  Created by MAC on 08/10/2021.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var coursesTableView: UITableView!
    
    var courseViewModels = [CourseViewModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        fetchCoursesData()
        // Do any additional setup after loading the view.
    }

    fileprivate func setupTableView(){
        
        coursesTableView.register(CoursesTableViewCell.nib(), forCellReuseIdentifier: CoursesTableViewCell.identifier)
        coursesTableView.delegate = self
        coursesTableView.dataSource = self
        
    }
    
    fileprivate func fetchCoursesData(){
        
        Service.shared.fetchCourses { (courses, error) in
            if let error = error{
                
                print("falied to fetch courses", error)
                return
            }
            
            self.courseViewModels = courses?.map({return CourseViewModel(course: $0)}) ?? []
            self.coursesTableView.reloadData()
            
        }
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return courseViewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CoursesTableViewCell.identifier) as! CoursesTableViewCell
        let courseViewModel = courseViewModels[indexPath.row]
        cell.courseViewModel = courseViewModel
        return cell
    }
    
}

