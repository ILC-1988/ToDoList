//
//  ToDoViewController+Extension.swift
//  ToDoList
//
//  Created by Илья Черницкий on 18.10.23.
//

import UIKit

// MARK: UITextFieldDelegate
extension ToDoViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        addItemToTableView()
        textField.text = nil
        textField.resignFirstResponder()
        return true
    }

    func addItemToTableView() {
        guard let itemText = textField.text, !itemText.isEmpty else {
            return
        }
        let currentDate = Date()
        let userData = UserData(toDo: itemText, date: currentDate)
        viewModel.toDoList.append(userData)
        UserSessionManager.shared.saveToDoList(viewModel.toDoList)
        let indexPath = IndexPath(row: viewModel.toDoList.count - 1, section: 0)
        tableView.insertRows(at: [indexPath], with: .automatic)
    }
}

