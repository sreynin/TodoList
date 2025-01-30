//
//  TodoListVM.swift
//  TodoList
//
//  Created by Bo Sreinin on 30/1/25.
//
import SwiftUI
import CoreData

class TodoListVM:ObservableObject {
    @Published var todoList:[TodoListDataModel] = []
    
    private let context = PersistenceController.shared.container.viewContext

    func fetchItems() {
            let request: NSFetchRequest<TodoListDataModel> = TodoListDataModel.fetchRequest()
            do {
                todoList = try context.fetch(request)
            } catch {
                print("Failed to fetch items: \(error)")
            }
        }
    
    func addItem(title: String,status:Bool) {
        let newItem = TodoListDataModel(context: context)
            newItem.id = UUID()
            newItem.title = title
            newItem.status = status

            todoList.append(newItem)
            PersistenceController.shared.save()
        }
    func deleteItem(at indexSet: IndexSet) {
           indexSet.forEach { index in
               let itemToDelete = todoList[index]
               context.delete(itemToDelete)
           }
        todoList.remove(atOffsets: indexSet)
           PersistenceController.shared.save()
       }
}
