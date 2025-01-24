//
//  TodoListModel.swift
//  SwiftUILearning
//
//  Created by Bo Sreinin on 20/1/25.
//

import Foundation


class TodoListModel :Identifiable,ObservableObject{
    let id = UUID()
    var title: String = ""
    var status: Bool = false
    init(title: String, status: Bool) {
        self.title = title
        self.status = status
    }
}
