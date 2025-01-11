//
//  TodoListView.swift
//  Todo
//
//  Created by fujita taiki on 2025/01/11.
//

import SwiftUI

 struct ToDoItem {
     var isChecked: Bool
     var task: String
 }

struct TodoListView: View {
    @State var newTask: String = ""
    @State var todoLists: [ToDoItem] = [
        ToDoItem(isChecked: false, task: "読書する"),
        ToDoItem(isChecked: false, task: "掃除する"),
        ToDoItem(isChecked: false, task: "散歩する"),
    ]
    
    var body: some View {
       VStack {
           Text("ToDoList")
               .font(.system(size: 30, weight: .bold, design: .default))
           HStack {
               TextField("タスクを入力してください", text: $newTask)
                   .textFieldStyle(.roundedBorder)
                   .padding(EdgeInsets(
                    top: 10,
                    leading: 20,
                    bottom: 10,
                    trailing: 15
                  ))
               Button("追加", action: {
                   todoLists.append(
                       ToDoItem(isChecked: false, task: newTask)
                   )
                   newTask = ""
               })
                 .padding(.trailing, 20)
                 .disabled(newTask.isEmpty)
           }
           ForEach(todoLists.indices, id: \.self) { index in
               HStack {
                   Button(action: {
                       todoLists[index].isChecked.toggle()
                   }, label: {
                       Image(systemName:
                           todoLists[index].isChecked ? "checkmark.square" : "square"
                       )
                       .imageScale(.large)
                       .foregroundStyle(.pink)
                   })
                   Text(todoLists[index].task)
               }
               .padding(.top, 1)
               .padding(.leading, 20)
               .frame(maxWidth: .infinity, alignment: .leading)
           }
       }

       Spacer()
    }
}
