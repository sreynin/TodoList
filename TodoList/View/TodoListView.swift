//
//  TodoListView.swift
//  SwiftUILearning
//
//  Created by Bo Sreinin on 21/1/25.
//

import SwiftUI

struct TodoListView: View {
    @State var todos: TodoListModel
    @State var imagToggle = Image(systemName: "circle")
    
    var body: some View {
        HStack{
            imagToggle
                     .resizable()
                     .aspectRatio(contentMode: .fill)
                     .frame(width: 20, height: 20)
                     .onTapGesture {
                         imagToggle = imagToggle == Image(systemName: "circle.fill") ? Image(systemName: "circle") : Image(systemName: "circle.fill")
                         
                     }
            Text("\(todos.title)")
                .padding(.leading, 5)
                .font(.headline)
                .lineLimit(1)
        }
    }
}
#Preview {
    TodoListView(todos: TodoListModel(title: "", status: false))
}





