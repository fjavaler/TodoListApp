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
  let itemsKey: String = "items_list"
  // MARK: Computed Properties
  @Published var items: [ItemModel] = [] {
    didSet {
      saveItems()
    }
  }
  
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
    guard
      // Checks to see if any items data exists in user defaults. Items stored as JSON objects in user defaults for this project. Normally Core Data would be used.
      let data = UserDefaults.standard.data(forKey: itemsKey),
      // Attempts to convert items data from type stored as (in this case, JSON) to ItemModels.
      let savedItems = try? JSONDecoder().decode([ItemModel].self, from: data)
    else { return }
    
    self.items = savedItems
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
