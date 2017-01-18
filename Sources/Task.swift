//
//  Task.swift
//  TODO-Foundation
//
//  Created by Pavel Procházka on 18/01/2017.
//
//

import Foundation

/// Enum defining priority.
public enum Priority: String {
	case low	= "low"
	case medium = "medium"
	case high	= "high"
}


/// Struct holding information about a task.
public struct Task {
	
	/// Generated unique identifier
	let id: String = UUID().uuidString
	
	/// Generated date of task creation
	let creationDate: Date = Date()
	
	/// Task done state
	var isDone: Bool = false
	
	/// Task title
	var title: String
	
	/// Task priority
	var priority: Priority
	
	/// Reminder date
	var dueDate: Date?
	
	/// Computes the remaining time from now until due date
	var remainingTime: DateComponents? {
		guard let unwrappedDueDate = self.dueDate else { return nil }
		
		return Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: Date(), to: unwrappedDueDate)
	}
	
	init(title: String, priority: Priority, dueDate: Date? = nil) {
		self.title = title
		self.priority = priority
		self.dueDate = dueDate
	}
}
