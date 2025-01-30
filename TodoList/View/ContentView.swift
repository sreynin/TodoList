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
    var todoVM: TodoListVM
    var body: some View {
        List {
            ForEach(todoVM.todoList) { todoObj in
                    TodoListView(todos: todoObj)
            }
            .onDelete{indexset in
                todoVM.deleteItem(at: indexset )
            }
            .onMove { indices, newoffset in
                todoVM.todoList.move(fromOffsets: indices, toOffset: newoffset)
            }
            .listRowSeparator(.hidden)
        }.scrollContentBackground(.hidden)
            .padding(.vertical,(0))
            
    }
}

struct ContentView: View {
    
    @State  private var scale: CGFloat = 1.0
    @State  var areYouGoingToCreateView: Bool = false
    @StateObject private var todoVM = TodoListVM()
   
    var body: some View {
        VStack {
            
            NavigationStack{
                VStack{
                    HStack{
                        Text(Date.now, format: .dateTime.day().month().year())
                            
                    }.frame(maxWidth: .infinity, maxHeight:40, alignment: .trailing)
                        .padding(.horizontal,(10))
                    if todoVM.todoList.isEmpty{
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
                            .padding(.vertical,(0))
                    }else{
                        TodoListTableView(todoVM:todoVM)
                    }
                        
                }
                .navigationTitle("Todo List")
                 .toolbarBackgroundVisibility(.visible, for: .navigationBar)
                 .toolbar {
                        
                        ToolbarItem(placement: .topBarLeading) {
                            Button("Add") {
                                self.areYouGoingToCreateView = true
                            }
                        }
                        
                        ToolbarItem(placement: .navigationBarTrailing) {
                            
                            EditButton().disabled(self.todoVM.todoList.isEmpty)
                        }
                     ToolbarItem(placement: .bottomBar) {
                         Button("complete") {
                             self.todoVM.todoList.removeAll()
                         }.buttonStyle(.borderedProminent)
                           .toolbarVisibility(.visible, for: .tabBar)
                          .disabled(self.todoVM.todoList.isEmpty)
                     }
                     ToolbarItem(placement: .bottomBar) {
                         Button("History") {
                             
                         }.buttonStyle(.borderedProminent)
                           .toolbarVisibility(.visible, for: .tabBar)
                          
                     }
                    }
                    .navigationDestination(isPresented: $areYouGoingToCreateView) {
                        CreateTaskView(todoVM: todoVM)
                    }
                    .onAppear {
                        todoVM.fetchItems()
                    }
                }
            
            }
        
        
    }
}


#Preview {
    ContentView()
}
