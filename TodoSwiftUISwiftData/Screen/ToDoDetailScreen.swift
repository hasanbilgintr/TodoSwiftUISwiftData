//
//  ToDoDetailScreen.swift
//  TodoSwiftUISwiftData
//
//  Created by hasan bilgin on 24.11.2023.
//

import SwiftUI
import SwiftData

struct ToDoDetailScreen: View {
    
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss
    
    @State private var name : String = ""
    @State private var priority : Int?
    
    let toDo : ToDo
    
    var body: some View {
            //Form bir görüntü gibi düşünebiliri
            Form {
                TextField("Name",text: $name)
                // format : .number ile text default değeri string biz onu int dönüştürmüş olduk
                TextField("Priority",value : $priority , format : .number)
                Button("Update"){
                    //action
                    guard let priority = priority else {return}
                    toDo.name = name
                    toDo.priority = priority
                    //olan bir şeyi değiştirdiğimiz için update gerek yok zaten aynısına atamasını yapıuyoruz
                    do {
                        try context.save()
                    }catch {
                        print(error.localizedDescription)
                    }
                    dismiss()
                    
                }.frame(maxWidth: .infinity,alignment: .center)
                
                //ekran ilk açıldığında
            }.onAppear(perform: {
                name = toDo.name
                priority = toDo.priority
            })
        }
}

/*
 #Preview {
 ToDoDetailScreen()
 }
 */
