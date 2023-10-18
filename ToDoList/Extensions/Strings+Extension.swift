//
//  Strings+Extension.swift
//  ToDoList
//
//  Created by Илья Черницкий on 18.10.23.
//

import Foundation

extension String {
    var localized: String {
        NSLocalizedString(self, comment: "")
    }
    
    func plural(_ n: Int) -> String {
        String.localizedStringWithFormat(
            NSLocalizedString(self, comment: ""),
            n
        )
    }
}
