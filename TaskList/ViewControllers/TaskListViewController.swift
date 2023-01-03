//
//  ViewController.swift
//  TaskList
//
//  Created by Alena Belenets on 29.09.2022.
//

import UIKit

protocol NewTaskViewControllerDelegate: AnyObject {
    func add(task: String)
}

class TaskListViewController: UIViewController {


    @IBOutlet weak var tableView: UITableView!

    private var taskList = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        taskList = StorageManager.shared.fetchTask()

    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let newTaskVC = segue.destination as? NewTaskViewController else { return }
        newTaskVC.delegate = self
    }
}


extension TaskListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        taskList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let task = taskList[indexPath.row]
        var content = cell.defaultContentConfiguration()
        content.text = task
        cell.contentConfiguration = content

        return cell

    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            StorageManager.shared.deleteTask(at: indexPath.row)
            taskList.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }


}

extension TaskListViewController: NewTaskViewControllerDelegate {
    func add(task: String) {
        taskList.append(task)

        tableView.reloadData()

        tableView.insertRows(
            at: [IndexPath(row: self.taskList.count - 1, section: 0)],
            with: .automatic
        )
    }
}
