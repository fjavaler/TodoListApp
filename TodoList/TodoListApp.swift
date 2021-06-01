//
//  TodoListApp.swift
//  TodoList
//
//  Created by Fred Javalera on 6/1/21.
//

import SwiftUI

@main
struct TodoListApp: App {
  
  // MARK: - Properties
  @StateObject var listViewModel: ListViewModel = ListViewModel()
  
  // MARK: - Body
  var body: some Scene {
    
    WindowGroup {
      
      NavigationView {
        
        ListView()
      
      }//: NavigationView
      .environmentObject(listViewModel)
    
    }//: WindowGroup
  
  }//: Scene

}//: App
