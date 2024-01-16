//
//  ListScreen.swift
//  TodoSwiftUISwiftData
//
//  Created by hasan bilgin on 24.11.2023.
//

import SwiftUI
//eklendi
import SwiftData

struct ListScreen: View {
    
    //Todo.name datalarına göre .forward diyerek a dan zye sıralar. reverse z den a ya retrstir
    @Query(sort: \ToDo.name, order: .forward) private var toDos : [ToDo]
    
    @State private var isAddToDoPresented : Bool = false
    
    var body: some View {
        
        NavigationStack {
            ToDoListView(toDos: toDos)
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button("Add Todo"){
                            //navigatate to addtodoscreen
                            //true yapınca sheet metodu çalışır hale geçiyor
                            isAddToDoPresented = true
                        }
                    }
                    //ios 17 ve sonrası için
                    //isPresented ekran şuan gösteriliyormu
                    //content ne gösterilcek?
                }.sheet(isPresented: $isAddToDoPresented, content: {
                    AddToDoScreen()
                })
        }
    }
}

#Preview {
    ListScreen().modelContainer(for: [ToDo.self])
}

