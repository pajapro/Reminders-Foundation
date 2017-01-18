//
//  ListUnitTests.swift
//  TODO-Foundation
//
//  Created by Pavel Procházka on 18/01/2017.
//
//

import XCTest
@testable import TODO_Foundation

class ListUnitTests: XCTestCase {
    
	func testListIncompletedTasks() {
		var list = List(title: "Shopping list")
		list.tasks.append(Task(title: "Butter", priority: .low))
		list.tasks.append(Task(title: "Bread", priority: .medium))
		
		XCTAssertEqual(list.incompletedTasks, 2)
    }
	
	func testListIncompletedTasksTopBoundary() {
		var list = List(title: "Shopping list")
		list.tasks.append(Task(title: "Butter", priority: .low))
		list.tasks.append(Task(title: "Bread", priority: .medium))
		
		XCTAssertNotEqual(list.incompletedTasks, 3)
	}
	
	func testListIncompletedTasksBottomBoundary() {
		var list = List(title: "Shopping list")
		list.tasks.append(Task(title: "Butter", priority: .low))
		list.tasks.append(Task(title: "Bread", priority: .medium))
		
		XCTAssertNotEqual(list.incompletedTasks, 1)
	}
	
	func testListCompletedTasks() {
		var list = List(title: "Shopping list")
		list.tasks.append(Task(title: "Butter", priority: .low))
		
		var task2 = Task(title: "Bread", priority: .medium)
		task2.isDone = true
		list.tasks.append(task2)
		
		XCTAssertEqual(list.completedTasks, 1)
	}
	
	func testListCompletedTasksTopBoundary() {
		var list = List(title: "Shopping list")
		list.tasks.append(Task(title: "Butter", priority: .low))
		
		var task2 = Task(title: "Bread", priority: .medium)
		task2.isDone = true
		list.tasks.append(task2)
		
		XCTAssertNotEqual(list.completedTasks, 2)
	}
	
	func testListCompletedTasksBottomBoundary() {
		var list = List(title: "Shopping list")
		list.tasks.append(Task(title: "Butter", priority: .low))
		
		var task2 = Task(title: "Bread", priority: .medium)
		task2.isDone = true
		list.tasks.append(task2)
		
		XCTAssertNotEqual(list.completedTasks, 0)
	}
}
