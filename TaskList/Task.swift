//
//  Task.swift
//  TaskList
//
//  Created by Alena Belenets on 29.09.2022.
//

import Foundation

struct Task {
    var title: String
    var isDone = false

    static func getTaskList() -> [Task] {
        [
            Task(title: "Buy a brad"),
            Task(title: "Go to the gym"),
            Task(title: "Make a dinner")
        ]

    }
}
