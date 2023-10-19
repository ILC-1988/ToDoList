//
//  ToDoViewModel.swift
//  ToDoList
//
//  Created by Илья Черницкий on 17.10.23.
//

import UIKit

final class ToDoViewModel: NSObject {
    var toDoList: [UserData] = []

    func fetchToDoItems() {
        toDoList = UserSessionManager.shared.loadToDoList() ?? []
    }
}
