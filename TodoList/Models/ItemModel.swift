//
//  Items.swift
//  TodoList
//
//  Created by Fred Javalera on 6/1/21.
//

import Foundation

/// Immutable Struct
struct ItemModel: Identifiable, Codable {
  
  // MARK: Properties
  let id: String
  let title: String
  let isCompleted: Bool
  
  // MARK: Init
  init(id: String = UUID().uuidString, title: String, isCompleted: Bool) {
    self.id = id
    self.title = title
    self.isCompleted = isCompleted
  }
  
  // MARK: Methods
  func updateCompletion() -> ItemModel {
    return ItemModel(id: self.id, title: self.title, isCompleted: !self.isCompleted)
  }

}
