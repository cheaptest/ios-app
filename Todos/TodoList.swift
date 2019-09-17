//
//  TodoListView.swift
//  Todos
//
//  Created by xhu on 17/09/19.
//  Copyright © 2019 huxiaoxing. All rights reserved.
//

import SwiftUI

struct TodoList: View {

    @EnvironmentObject var store: Store
    @State private var showTodoEditor = false

    func addTask() {
//        self.showTodoEditor = true
        store.todos.append(Todo("buy milk"))
    }

    var addButton: some View {
        Button(action: { self.addTask() }) {
            Image(systemName: "person.crop.circle")
                .imageScale(.large)
                .accessibility(label: Text("User Profile"))
                .padding()
        }
    }


    var body: some View {
        NavigationView {
            List {
                ForEach(store.todos) { todo in
                    TodoRow(todo: todo)
                }
            }
            .navigationBarTitle("Tasks")
            .navigationBarItems(trailing: addButton)
        }.sheet(isPresented: $showTodoEditor, onDismiss: {
            print(self.showTodoEditor)
        }) {
            TodoEditor(todo: .constant(.default))
        }
    }
}

struct TodoListView_Previews: PreviewProvider {
    static var previews: some View {
        TodoList()
    }
}
