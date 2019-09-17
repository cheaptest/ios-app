//
//  TodoEditor.swift
//  Todos
//
//  Created by Xiaoxing Hu on 17/09/19.
//  Copyright © 2019 huxiaoxing. All rights reserved.
//

import SwiftUI

struct TodoEditor: View {

    @Binding var todo: Todo

    var body: some View {
        List {
            HStack {
                Text("text").bold()
                Divider()
                TextField("text", text: $todo.text)
            }
            VStack {
                Text("Deadline").bold()
//                DatePicker("Deadline", selection: $todo.deadline)
            }
        }
    }
}

struct TodoEditor_Previews: PreviewProvider {
    static var previews: some View {
        TodoEditor(todo: .constant(.default))
    }
}
