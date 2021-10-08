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
        setupNavBar()
        // Do any additional setup after loading the view.
    }

    fileprivate func setupTableView(){
        
        coursesTableView.register(CoursesTableViewCell.nib(), forCellReuseIdentifier: CoursesTableViewCell.identifier)
        coursesTableView.delegate = self
        coursesTableView.dataSource = self
        
        coursesTableView.separatorInset = UIEdgeInsets(top: 0, left: 24, bottom: 0, right: 24)
        coursesTableView.separatorColor = .mainTextBlue
        coursesTableView.backgroundColor = UIColor.rgb(r: 12, g: 47, b: 57)
        coursesTableView.rowHeight = UITableView.automaticDimension
        coursesTableView.estimatedRowHeight = 50
        coursesTableView.tableFooterView = UIView()
        
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
    
    fileprivate func setupNavBar() {
        navigationItem.title = "Courses"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.backgroundColor = .yellow
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.barTintColor = UIColor.rgb(r: 50, g: 199, b: 242)
        navigationController?.navigationBar.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
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

class CustomNavigationController: UINavigationController {
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}

extension UIColor {
    static let mainTextBlue = UIColor.rgb(r: 7, g: 71, b: 89)
    static let highlightColor = UIColor.rgb(r: 50, g: 199, b: 242)
    
    static func rgb(r: CGFloat, g: CGFloat, b: CGFloat) -> UIColor {
        return UIColor(red: r/255, green: g/255, blue: b/255, alpha: 1)
    }
}
