//
//  ViewController.swift
//  TaskList
//
//  Created by Alena Belenets on 29.09.2022.
//

import UIKit

class ViewController: UIViewController {


//    @IBOutlet weak var tableView: UITableView!

    var taskList = Task.getTaskList()
    
    override func viewDidLoad() {
        super.viewDidLoad()


    }

    @IBAction func addNewTask() {
    }


}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        taskList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let task = taskList[indexPath.row]
        var content = cell.defaultContentConfiguration()
        content.text = task.title
        cell.contentConfiguration = content

        return cell

    }


}
