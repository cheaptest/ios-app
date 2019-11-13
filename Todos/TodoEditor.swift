//
//  TodoEditor.swift
//  Todos
//
//  Created by Xiaoxing Hu on 17/09/19.
//  Copyright © 2019 huxiaoxing. All rights reserved.
//

import SwiftUI

struct TodoEditor: View {

    @Environment(\.presentationMode) private var presentationMode

    var todo: Todo

    @State private var withDeadline = false
    @State private var text = ""
    @State private var deadline = Date()

    var saved: (Todo) -> Void = { _ in }

    func dismiss() {
        presentationMode.wrappedValue.dismiss()
    }

    func refresh() {
        text = todo.text
        withDeadline = todo.deadline != nil
        if let d = todo.deadline { deadline = d }
    }

    var body: some View {
        Form {
            HStack {
                TextField("Enter description", text: $text)
                    .accessibility(identifier: "title")
                if !text.isEmpty {
                    Button(action: { self.text = "" }) {
                        Image(systemName: "multiply.circle")
                    }.accessibility(identifier: "clearTitle")
                }
            }


            Toggle(isOn: $withDeadline) {
                Text("With Deadline")
            }.accessibility(identifier: "withDeadlineToggle")
            if withDeadline {
                DatePicker(selection: $deadline, displayedComponents: .date) {
                    Text("DEADLINE")
                }
            }
            Button( action: {
                var newTodo = self.todo
                newTodo.text = self.text
                if self.withDeadline {
                    newTodo.deadline = self.deadline
                }
                self.saved(newTodo)
                self.dismiss()
            }) {
                Text("Save")
            }
        }
        .navigationBarTitle("Edit Task")
        .navigationBarItems(trailing:
            Button(action: dismiss) {
                Text("Cancel")
            }
        ).onAppear(perform: refresh)
    }
}

struct TodoEditor_Previews: PreviewProvider {
    static var previews: some View {
        TodoEditor(todo: Todo.default)
    }
}
