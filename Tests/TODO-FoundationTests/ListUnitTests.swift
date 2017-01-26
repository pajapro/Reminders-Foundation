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
	
	func testJSONInitializer() {
		let json: JSON = [JSONKeys.title: "TODO list"]
		let list = List(rawValue: json)
		
		XCTAssertEqual(list?.rawValue[JSONKeys.title] as? String, json[JSONKeys.title] as? String)
	}
	
	func testJSONInitializerWithTasks() {
		let taskJSON: JSON = [JSONKeys.title: "Clean kitchen", JSONKeys.priority: "medium"]
		let taskJSON2: JSON = [JSONKeys.title: "Tidy up kitchen", JSONKeys.priority: "low", JSONKeys.dueDate: "Thu, 22 Oct 2015 07:45:17"]
		
		let json: JSON = [JSONKeys.title: "TODO list", JSONKeys.tasks: [taskJSON, taskJSON2]]
		let list = List(rawValue: json)
		
		XCTAssertEqual(list?.rawValue[JSONKeys.title] as? String, json[JSONKeys.title] as? String)
		XCTAssertEqual(list?.rawValue[JSONKeys.tasks] as? String, json[JSONKeys.tasks] as? String)
	}
}
