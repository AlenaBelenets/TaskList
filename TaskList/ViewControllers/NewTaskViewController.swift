//
//  TaskViewController.swift
//  TaskList
//
//  Created by Alena Belenets on 29.09.2022.
//

import UIKit

class NewTaskViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var newTask: UITextField!
    @IBOutlet weak var saveButton: UIBarButtonItem!

   weak var delegate: NewTaskViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()

//        newTask.delegate = self

        newTask.addTarget(
            self,
            action: #selector(save),
            for: .editingChanged
        )
        save()

    }

    @objc func save() {
        guard let task = newTask.text else { return }
        saveButton.isEnabled = !task.isEmpty
    }

      @IBAction func didTapSaveButton(_ sender: UIBarButtonItem) {
            saveTask()

        }

    @IBAction func didTapCancelButton(_ sender: Any) {
            dismiss(animated: true)
        }

        func saveTask() {
            guard let task = newTask.text else { return }
            StorageManager.shared.save(task: task)

            delegate?.add(task: task)
            self.dismiss(animated: true)
        }
    }


