//
//  ListViewModel.swift
//  TodoList
//
//  Created by Fred Javalera on 6/1/21.
//

import Foundation

/// List ViewModel.
class ListViewModel: ObservableObject {
  
  // MARK: Properties
  @Published var items: [ItemModel] = [] {
    didSet {
      saveItems()
    }
  }
  let itemsKey: String = "items_list"
  
  // MARK: Init
  init() {
    getItems()
  }
  
  // MARK: Functions
  func moveItem(from: IndexSet, to: Int) {
    items.move(fromOffsets: from, toOffset: to)
  }
  
  // MARK: CRUD Operations
  /// Gets all of the starting items.
  func getItems() {
    let newItems = [
      ItemModel(title: "This is the first title", isCompleted: false),
      ItemModel(title: "This is the second title", isCompleted: true),
      ItemModel(title: "This is the third title", isCompleted: false)
    ]
    
    items.append(contentsOf: newItems)
  }
  
  
  /// Deletes an item by index set.
  /// - Parameter indexSet: index set.
  func deleteItem(indexSet: IndexSet) {
    items.remove(atOffsets: indexSet)
  }
  
  /// Adds an item by title.
  /// - Parameter title: The title of the item.
  func addItem(title: String) {
    let newItem = ItemModel(title: title, isCompleted: false)
    items.append(newItem)
  }
  
  /// Updates the item passed in.
  /// - Parameter item: The item being updated.
  func updateItem(item: ItemModel) {
    if let index = items.firstIndex(where: { $0.id == item.id }) {
      items[index] = item.updateCompletion()
    }
  }
  
  /// Saves the items in the todo list.
  func saveItems() {
    if let encodedData = try? JSONEncoder().encode(items) {
      UserDefaults.standard.set(encodedData, forKey: "items_list")
    }
  }
}
