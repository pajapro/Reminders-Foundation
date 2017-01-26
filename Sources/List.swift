//
//  List.swift
//  TODO-Foundation
//
//  Created by Pavel Procházka on 18/01/2017.
//
//

import Foundation

/// Struct encapsulationg a TODO list of tasks.
public struct List {
	
	/// Generated unique identifier
	public let id: String = UUID().uuidString
	
	/// Task title
	public var title: String
	
	/// An array of tasks
	public var tasks: [Task] = []
	
	/// Returns the amount of completed tasks
	public var completedTasks: Int {
		return self.tasks.filter{ $0.isDone }.count
	}
	
	/// Returns the amount of incompleted tasks
	public var incompletedTasks: Int {
		return self.tasks.filter{ !$0.isDone }.count
	}
}

/// Extension with initializer to avoid loosing the memberwise initializer
public extension List {
	
	init(title: String) {
		self.title = title
	}
}
