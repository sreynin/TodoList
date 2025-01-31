//
//  TodoListView.swift
//  SwiftUILearning
//
//  Created by Bo Sreinin on 21/1/25.
//

import SwiftUI

struct TodoListView: View {
    @State var todos: TodoListDataModel
    @State var imagToggle = Image(systemName: "circle")
    @State var imgeNM: String = "circle"
    
    var body: some View {
        HStack{
            imagToggle
                     .resizable()
                     .aspectRatio(contentMode: .fill)
                     .frame(width: 20, height: 20)
                     .onTapGesture {
                         imgeNM = imgeNM == "circle" ? "circle.fill" : "circle"
                         imagToggle = Image(systemName: imgeNM)
                      
                     }
            Text("\(String(describing: todos.title ?? ""))")
                .padding(.leading, 5)
                .font(.headline)
                .lineLimit(1)
                
        }.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
            .padding(EdgeInsets(top: 15, leading: 30, bottom: 15, trailing: 30))
            .background(Color.random(randomOpacity: true))
            .cornerRadius(10)
    }
}
#Preview {
    TodoListView(todos:TodoListDataModel())
}




