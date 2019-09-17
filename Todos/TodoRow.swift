import SwiftUI

struct TodoRow: View {

    var todo: Todo

    func toggleTodo() {
        print("toggled")
    }

    var body: some View {
        HStack {
            Button(action: { self.toggleTodo() }, label: {
                if todo.done {
                    Text("DONE").foregroundColor(.green)
                } else {
                    Text("TODO").foregroundColor(.red)
                }
            })
            Text(todo.text)
        }

    }
}

struct TodoRow_Previews: PreviewProvider {
    static var previews: some View {
        TodoRow(todo: Todo("buy milk"))
    }
}
