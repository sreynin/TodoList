//
//  CreateTaskView.swift
//  SwiftUILearning
//
//  Created by Bo Sreinin on 20/1/25.
//

import SwiftUI

struct OutlinedTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding()
            .overlay {
                RoundedRectangle(cornerRadius: 8, style: .continuous)
                    .stroke(Color(UIColor.systemGray4), lineWidth: 2)
            }
    }
}

struct CreateTaskView: View {
    
    @State var taskname: String = ""
    @Binding var todolistData: [TodoListModel]
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
            VStack{
              TextField("Task name", text: $taskname)
                    .textFieldStyle(OutlinedTextFieldStyle())
                    .padding(.horizontal,(20))
                    .frame(minWidth: 0, maxWidth: .infinity)
                
                Button{
                    todolistData.append(TodoListModel(title: taskname, status: false))
                    print("Save button press==\(taskname)")
                    dismiss()
                 
                }label:
                {
                    Text("save")
                        .font(.title2)
                        .fontWeight(.bold)
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundStyle(.white)
                        .cornerRadius(10)
                       
                }
                 .padding()
                 
                
                    
            }.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                .padding(.vertical,(40))
           
            .navigationTitle("Add an Item 🖊️")
        }
        
    }
}
