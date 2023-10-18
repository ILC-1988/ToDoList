//
//  TableDataManager.swift
//  ToDoList
//
//  Created by Илья Черницкий on 17.10.23.
//

import Foundation

class CartDataManager {
    static let shared = CartDataManager()

    func getToDoItems() -> [UserData] {
        UserSessionManager.shared.loadCredentials() ?? []
    }
}
