import SwiftUI

struct Deadline: View {
    var date: Date

    static let taskDateFormat: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter
    }()

    var body: some View {
        HStack {
            Text("deadline").foregroundColor(.gray).fontWeight(.light)
            Spacer()
            Text(" \(date, formatter: Self.taskDateFormat)").foregroundColor(.orange)
        }
    }
}

struct TodoRow: View {
    var todo: Todo

    var body: some View {
        VStack(alignment: .leading) {
            Text(todo.text)
            todo.deadline.map {
                Deadline(date: $0)
            }
        }

    }
}

struct TodoRow_Previews: PreviewProvider {
    static var previews: some View {
        TodoRow(todo: Todo("buy milk"))
    }
}
