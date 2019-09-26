import SwiftUI

struct TodoList: View {

    @EnvironmentObject var userData: UserData
    @State private var showTodoEditor = false
    @State private var showDones = false

    @State private var item: Int? = 0

    func addTask() {
        self.showTodoEditor = true
    }

    var addButton: some View {
        Button(action: { self.addTask() }) {
            Image(systemName: "plus")
                .imageScale(.large)
                .accessibility(label: Text("Add Task"))
                .padding()
        }
    }


    var body: some View {
        NavigationView {
            List {
                Toggle(isOn: $showDones) {
                    Text("Show Completed Tasks").bold()
                }
                ForEach(userData.todos) { todo in
                    if self.showDones || !todo.done {
                        HStack {
                            Button(action: { self.userData.toggle(todo) }) {
                                if todo.done {
                                    Image(systemName: "checkmark.circle").foregroundColor(.green)
                                } else {
                                    Image(systemName: "circle").foregroundColor(.red)
                                }
                            }

                            TodoRow(todo: todo).onTapGesture {
                                print("text tapped")
                            }
//                            NavigationLink(destination: TodoEditor(todo: todo, saved: self.store.update)) {
//                                TodoRow(todo: todo)
//                            }
                        }
                    }
                }

                Button(action: addTask) {
                    Text("Add New Task").bold().foregroundColor(.blue)
                }
            }
            .navigationBarTitle("Tasks")
            .navigationBarItems(trailing: addButton)
        }
        .sheet(isPresented: $showTodoEditor, onDismiss: {
            print(self.showTodoEditor)
        }) {
            TodoEditor(todo: Todo.default, saved: { todo in
                self.userData.todos.append(todo)
            })
        }
    }
}

struct TodoListView_Previews: PreviewProvider {
    static var previews: some View {
        TodoList()
    }
}
