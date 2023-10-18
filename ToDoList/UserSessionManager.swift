//
//  UserSessionManager.swift
//  ToDoList
//
//  Created by Илья Черницкий on 17.10.23.
//

import Foundation

final class UserSessionManager {
    static let shared = UserSessionManager()
    private let userDefaults = UserDefaults.standard
    private let toDoKey = "ToDoList"

    func saveToDoList(_ userData: [UserData]) {
        let toDolist = ToDoData(data: userData)
        let toDolistData = try? JSONEncoder().encode(toDolist)
        userDefaults.set(toDolistData, forKey: toDoKey)
    }

    func loadToDoList() -> [UserData]? {
        if let toDolistData = userDefaults.value(forKey: toDoKey) as? Data {
            let toDolist = try? JSONDecoder().decode(ToDoData.self, from: toDolistData)
            return toDolist?.data ?? []
        } else {
            return []
        }
    }
}

struct ToDoData: Codable {
    let data: [UserData]
}

struct UserData: Codable {
    let toDo: String
    let date: Date
}
