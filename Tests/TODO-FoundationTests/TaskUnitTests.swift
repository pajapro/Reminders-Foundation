//
//  TaskUnitTests.swift
//  TODO-Foundation
//
//  Created by Pavel Procházka on 18/01/2017.
//
//

import XCTest
@testable import TODO_Foundation

class TaskUnitTests: XCTestCase {
	
    func testTaskWithoutDueDate() {
        let task = Task(title: "Wash dishes", priority: .medium)
		
		XCTAssertNotNil(task)
		XCTAssertEqual(task.title, "Wash dishes")
		XCTAssertEqual(task.priority, .medium)
		XCTAssertFalse(task.isDone)
    }
	
	func testTaskWithDueDate() {
		var dateComponents = DateComponents()
		dateComponents.year = 2990
		dateComponents.month = 9
		dateComponents.day = 6
		let dueDate = Calendar.current.date(from: dateComponents)
		
		let task = Task(title: "Buy tomatoes", priority: .low, dueDate: dueDate)
		
		XCTAssertNotNil(task)
		XCTAssertEqual(task.title, "Buy tomatoes")
		XCTAssertEqual(task.priority, .low)
		XCTAssertFalse(task.isDone)
		XCTAssertEqual(task.dueDate!, dueDate)
	}
	
	func testTaskRemainingTimeExists() {
		var dateComponents = DateComponents()
		dateComponents.year = 2990
		dateComponents.month = 9
		dateComponents.day = 6
		let dueDate = Calendar.current.date(from: dateComponents)
		
		let task = Task(title: "Buy something nice", priority: .low, dueDate: dueDate)
		
		XCTAssertNotNil(task)
		XCTAssertEqual(task.dueDate!, dueDate)
		XCTAssertNotNil(task.remainingTime)
	}
	
	func testTaskRemainingTimeNotExists() {
		let task = Task(title: "Read swift.org", priority: .high)
		
		XCTAssertNotNil(task)
		XCTAssertNil(task.dueDate)
		XCTAssertNil(task.remainingTime)
	}
	
	func testJSONInitializer() {
		let json: JSON = [JSONKeys.title: "Clean kitchen", JSONKeys.priority: "medium"]
		let task = Task(rawValue: json)
		
		XCTAssertEqual(task?.rawValue[JSONKeys.title] as? String, json[JSONKeys.title] as? String)
		XCTAssertEqual(task?.rawValue[JSONKeys.priority] as? String, json[JSONKeys.priority] as? String)
	}
	
	func testJSONInitializerWithDate() {
		let json: JSON = [JSONKeys.title: "Tidy up kitchen", JSONKeys.priority: "low", JSONKeys.dueDate: "Thu, 22 Oct 2015 07:45:17"]
		let task = Task(rawValue: json)
		
		XCTAssertEqual(task?.rawValue[JSONKeys.title] as? String, json[JSONKeys.title] as? String)
		XCTAssertEqual(task?.rawValue[JSONKeys.priority] as? String, json[JSONKeys.priority] as? String)
		XCTAssertEqual(task?.rawValue[JSONKeys.dueDate] as? String, json[JSONKeys.dueDate] as? String)
	}
	
	func testJSONInitializerWithInvalidDate() {
		let json: JSON = [JSONKeys.title: "Mess up kitchen", JSONKeys.priority: "low", JSONKeys.dueDate: "Invalid date format"]
		let task = Task(rawValue: json)
		
		XCTAssertNil(task?.rawValue[JSONKeys.dueDate])
	}
}
