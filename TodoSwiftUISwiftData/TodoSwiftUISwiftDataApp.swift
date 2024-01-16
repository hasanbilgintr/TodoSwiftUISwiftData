//
//  TodoSwiftUISwiftDataApp.swift
//  TodoSwiftUISwiftData
//
//  Created by hasan bilgin on 24.11.2023.
//

import SwiftUI

@main
struct TodoSwiftUISwiftDataApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                ListScreen()
            }
        }.modelContainer(for: [ToDo.self])
    }
}
