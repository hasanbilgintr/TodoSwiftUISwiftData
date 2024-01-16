//
//  ToDoListView.swift
//  TodoSwiftUISwiftData
//
//  Created by hasan bilgin on 24.11.2023.
//

import SwiftUI
import SwiftData


struct ToDoListView: View {
    
    let toDos : [ToDo]
    @Environment(\.modelContext) private var context
    
    var body: some View {
        List {
            ForEach(toDos){ toDo in
                //bunla link yapıldı
                NavigationLink(value: toDo) {
                    HStack {
                        Text(toDo.name)
                        Spacer()
                        //description diyerek stringe çevirdik
                        Text(toDo.priority.description)
                    }
                }
                //silme işlemi olduğunda
            }.onDelete(perform: { indexSet in
                indexSet.forEach { index in
                    let toDo = toDos[index]
                    context.delete(toDo)
                    
                    do {
                        try context.save()
                    }catch{
                        print(error.localizedDescription)
                    }
                }
            })
            //tıklandığında gider Todo.self verildi 
        }.navigationDestination(for: ToDo.self) { toDo in
            ToDoDetailScreen(toDo: toDo)
        }
    }
}



/*
#Preview {
    ToDoListView(toDos: [ToDo(name: "Test", priority: 123)]).modelContainer(for:[ToDo.self])
}
 */
 

