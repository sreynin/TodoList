//
//  ContentView.swift
//  SwiftUILearning
//
//  Created by Bo Sreinin on 20/1/25.
//

import SwiftUI

struct customButton:View {
    var title : String
    var action : () ->Void
    var body: some View
    {
        Button {
            action()
            print("\(title) pressed")

        } label: {
            Text("\(title)")
                .font(.headline)
                .padding(EdgeInsets(top: 15, leading: 40, bottom: 15, trailing: 40))
                .background(Color.green)
                .foregroundStyle(.white)
                .cornerRadius(10)
               
        }

    }
}
 
struct TodoListTableView:View {
    @Binding var todos: [TodoListModel]
    var body: some View {
        List {
            ForEach(todos) { todoObj in
                    TodoListView(todos: todoObj)
            }
            .onDelete{indexset in
                todos.remove(atOffsets: indexset)
            }
            .onMove { indices, newoffset in
                todos.move(fromOffsets: indices, toOffset: newoffset)
            }
        }.scrollContentBackground(.hidden)
            .padding(.vertical,(40))
            
          
        
    }
}

struct ContentView: View {
    
    @State  private var scale: CGFloat = 1.0
    @State  var areYouGoingToCreateView: Bool = false
    @State  var todolistArrObj :[TodoListModel] = []
 
    var body: some View {
        VStack {
            
            NavigationStack{
                VStack{
                    if $todolistArrObj.isEmpty{
                        VStack{
                            Text("There are no items!")
                                .font(.title)
                                .fontWeight(.bold)
                            
                            Text("Are you a ptoductive person? I think you should click the button below to add a bunch of items to your todo list!")
                                .multilineTextAlignment(.center)
                                .fontWeight(.bold)
                                .padding(.horizontal, 30)
                            customButton(title: "Add Something 🤗 ", action: {
                                areYouGoingToCreateView = true
                            })
                        }.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                            .padding(.vertical,(40))
                    }else{
                        TodoListTableView(todos: $todolistArrObj)
                    }
                        
                }
                .navigationTitle("Todo List")
                 .foregroundColor(.indigo)
                 .toolbarBackgroundVisibility(.visible, for: .navigationBar)
                 .toolbar {
                        
                        ToolbarItem(placement: .topBarLeading) {
                            Button("Add") {
                                self.areYouGoingToCreateView = true
                            }
                        }
                        
                        ToolbarItem(placement: .navigationBarTrailing) {
                            EditButton()
                        }
                        
                    }
                    .navigationDestination(isPresented: $areYouGoingToCreateView) {
                        CreateTaskView(todolistData: $todolistArrObj)
                    }
                }
            
            }
        
        
    }
}


#Preview {
    ContentView()
}
