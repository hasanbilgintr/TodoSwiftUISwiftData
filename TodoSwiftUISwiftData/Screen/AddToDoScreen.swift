//
//  ContentView.swift
//  TodoSwiftUISwiftData
//
//  Created by hasan bilgin on 24.11.2023.
//

import SwiftUI
//eklendi
import SwiftData

struct AddToDoScreen: View {
    
    //sistemin sağladığı bütün özellikleri burdan alabiliriz
    //buda coredatada nasıl AppDelegate. den miras alınna vs ondna aldık
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss
    
    @State private var name : String = ""
    @State private var priority : Int?
    
    //name boşsa priority int değilse save butonuna pasife alcaz
    private var isFormValid : Bool {
        //name karakterleri boşluk karakterlerini çıkardığımızda hala boşsa ! ile false döndürücek
        //priority ise integer olduğu için harf dahi girilse nildir
        !name.trimmingCharacters(in: .whitespaces).isEmpty && priority != nil
    }
    var body: some View {
        //NavigationStack yazılmazsa butonlar topbarlar title görünmezdi
        //olan ekranda navigationStack varsa (hazır back olur sol üstte) NavigationStack olmaz Dikkt!!!!!!
        
        NavigationStack {
            //Form bir görüntü gibi düşünebiliri
            Form {
                TextField("Name",text: $name)
                // format : .number ile text default değeri string biz onu int dönüştürmüş olduk
                TextField("Priority",value : $priority , format : .number)
            }.navigationTitle("Add Todo")
                .toolbar {
                    //sol yada baştaki topBarLeading
                    //sağ yada sonraki topBarTrailing
                    ToolbarItem(placement: .topBarLeading) {
                        Button ("Dismiss"){
                            //dismiss action
                            //ekran direk kapanması (screen)
                            dismiss()
                        }
                    }
                    
                    ToolbarItem(placement: .topBarTrailing) {
                        Button ("Save"){
                            //save action
                            //priority integer değilse kod durucaktır ve priority optionaldan çıkardık
                            guard let priority = priority else {
                                return
                            }
                            
                            let toDo = ToDo(name: name, priority: priority)
                            //ekleme yapıldı
                            context.insert(toDo)
                            
                            do {
                                //veri tabanına kaydedildi
                                try context.save()
                            }catch{
                                print(error.localizedDescription)
                            }
                            
                            dismiss()
                            
                        }
                        //disabled(true) iken pasif olur
                        .disabled(!isFormValid)
                        
                    }
                }
        }
    }
}

#Preview {
    
    AddToDoScreen().modelContainer(for: [ToDo.self])
    
}


