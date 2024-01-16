//
//  Todo.swift
//  TodoSwiftUISwiftData
//
//  Created by hasan bilgin on 24.11.2023.
//

import Foundation
//eklendi
import SwiftData

//SwiftDat ile bağlantılı ve bu sınıftan oluşturulan veri tabanında objeleri oluşturucağını @Model ile belirtiyoruz
@Model
//final koyarak
final class ToDo {
    var name : String
    //priority öncelik demektir
    var priority : Int
    
    init(name: String, priority: Int) {
        self.name = name
        self.priority = priority
    }
}
