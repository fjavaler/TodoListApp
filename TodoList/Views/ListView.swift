//
//  ListView.swift
//  TodoList
//
//  Created by Fred Javalera on 6/1/21.
//

import SwiftUI

struct ListView: View {
  
  // MARK: Properties
  @EnvironmentObject var listViewModel: ListViewModel
  
  // MARK: Body
  var body: some View {
    
    List {
      
      ForEach(listViewModel.items) { item in
        ListRowView(item: item)
          .onTapGesture {
            withAnimation(.linear) {
              listViewModel.updateItem(item: item)
            }
          }
      }
      .onDelete(perform: listViewModel.deleteItem)
      .onMove(perform: listViewModel.moveItem)
      
    }//: List
    .listStyle(PlainListStyle())
    .navigationTitle("Todo List 📝")
    .navigationBarItems(
      leading: EditButton(),
      trailing:
        NavigationLink("Add", destination: AddView())
    )
    
  }//: View
  
}//: View

// MARK: Preview
struct ListView_Previews: PreviewProvider {
  static var previews: some View {
    NavigationView {
      ListView()
    }
    .environmentObject(ListViewModel())
  }
}
