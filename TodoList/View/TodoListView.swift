//
//  TodoListView.swift
//  SwiftUILearning
//
//  Created by Bo Sreinin on 21/1/25.
//

import SwiftUI

struct TodoListView: View {
    @State var todos: TodoListDataModel
    @State var todoVM : TodoListVM
    @State var imagToggle :Image
    @State var imgeNM: String = "circle"
    
    var body: some View {
        HStack{
          
            imagToggle
                     .resizable()
                     .aspectRatio(contentMode: .fill)
                     .frame(width: 20, height: 20)
                     .onTapGesture {
                         updateImgSelected()
                     }
            Text("\(String(describing: todos.title ?? ""))")
                .padding(.leading, 5)
                .font(.headline)
                .lineLimit(1)
                
        }.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
            
    }
    func updateImgSelected() {
        todos.status.toggle()
        imagToggle  = todos.status ? Image("checkmark") :Image(systemName: imgeNM)
        self.updateItemStatus(status: todos.status)
   
    }
   
    func updateItemStatus(status:Bool){
        let list = todoVM.todoList
        for (i,dataitem) in list.enumerated() {
            if dataitem.id == todos.id {
                todoVM.updateItemStatus(at: i, status: status)
                break
            }
        }
        
    }
}
//#Preview {
//    TodoListView(todos:TodoListDataModel(), todoVM: TodoListVM(), imagToggle: <#Image#>)
//}




