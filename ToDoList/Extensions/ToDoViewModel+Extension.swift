//
//  ToDoViewModel+Extension.swift
//  ToDoList
//
//  Created by Илья Черницкий on 18.10.23.
//

import UIKit

// MARK: UITableViewDataSource
extension ToDoViewModel: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDoList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        if let cell = cell as? ToDoItemCell {
            let cartItem = toDoList[indexPath.row]
            cell.configure(with: cartItem)
        }
        return cell
    }
}

// MARK: UITableViewDelegate
extension ToDoViewModel: UITableViewDelegate {
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView,
                   commit editingStyle: UITableViewCell.EditingStyle,
                   forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            toDoList.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            UserSessionManager.shared.saveToDoList(toDoList)
            tableView.reloadData()
        }
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        toDoList[indexPath.row].toDo = Resources.Strings.Main.Completed + " " + toDoList[indexPath.row].toDo
        let currentDate = Date()
        toDoList[indexPath.row].date = currentDate
        UserSessionManager.shared.saveToDoList(toDoList)
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }
}
