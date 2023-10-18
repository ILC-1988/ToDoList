//
//  ToDoViewModel.swift
//  ToDoList
//
//  Created by Илья Черницкий on 17.10.23.
//

import UIKit

final class ToDoViewModel: NSObject {
    var toDoItems: [UserData] = []

    func fetchToDoItems() {
        toDoItems = UserSessionManager.shared.loadToDoList() ?? []
    }
}
