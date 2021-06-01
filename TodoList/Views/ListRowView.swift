//
//  ListRowView.swift
//  TodoList
//
//  Created by Fred Javalera on 6/1/21.
//

import SwiftUI

struct ListRowView: View {
  
  // MARK: Properties
  let item: ItemModel
  
  // MARK: Body
  var body: some View {
    
    HStack {
      
      Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
        .foregroundColor(item.isCompleted ? .green : .red)
      
      Text(item.title)
      
      Spacer()
    
    }//: HStack
    .font(.title2)
    .padding(.vertical, 8)
  
  }

}

// MARK: Preview
struct ListRowView_Previews: PreviewProvider {
  
  static var item1 = ItemModel(title: "First item", isCompleted: false)
  static var item2 = ItemModel(title: "Second item", isCompleted: true)
  
    static var previews: some View {
      Group {
        ListRowView(item: item1)
        ListRowView(item: item2)
      }
      .previewLayout(.sizeThatFits)
    }
}
