//
//  MVVMIntermediateTests.swift
//  MVVMIntermediateTests
//
//  Created by MAC on 08/10/2021.
//

import XCTest
@testable import MVVMIntermediate

class MVVMIntermediateTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

    func testCoursesViewModel(){
        
        let course = Course(name: "name", id: 1, numberOfLessons: 6)
        let courseViewModel = CourseViewModel(course: course)
        
        XCTAssertEqual(course.name, courseViewModel.name)
        XCTAssertEqual("\(course.numberOfLessons) Lessons", courseViewModel.description)
        XCTAssertEqual(UITableViewCell.AccessoryType.none, courseViewModel.accessoryType)
    }
    
}
