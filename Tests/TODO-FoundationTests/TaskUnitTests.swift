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
}
