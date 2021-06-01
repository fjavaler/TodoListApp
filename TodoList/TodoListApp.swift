//
//  TodoListApp.swift
//  TodoList
//
//  Created by Fred Javalera on 6/1/21.
//

import SwiftUI

@main
struct TodoListApp: App {
  
  @StateObject var listViewModel: ListViewModel = ListViewModel()
  
  var body: some Scene {
    WindowGroup {
      NavigationView {
        ListView()
      }
      .environmentObject(listViewModel)
    }
  }
}
