//
//  AddView.swift
//  TodoList
//
//  Created by Fred Javalera on 6/1/21.
//

import SwiftUI

struct AddView: View {
  
  // MARK: Properties
  @Environment(\.presentationMode) var presentationMode
  @EnvironmentObject var listViewModel: ListViewModel
  @State var textFieldText: String = ""
  @State var alertTitle: String = ""
  @State var showAlert: Bool = false
  
  // MARK: Body
  var body: some View {
    
    ScrollView {
      
      VStack {
        
        TextField("Type something here...", text: $textFieldText)
          .padding(.horizontal)
          .frame(height: 55)
          .background(Color(UIColor.secondarySystemBackground))
          .cornerRadius(10.0)
        
        Button(action: {
          saveButtonPressed()
        }, label: {
          Text("Save".uppercased())
            .foregroundColor(.white)
            .font(.headline)
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            .background(Color.accentColor)
            .cornerRadius(10.0)
        })//: Button
        
      }//: VStack
      .padding(14)
      
    }//: ScrollView
    .navigationTitle("Add an Item 🖋")
    .alert(isPresented: $showAlert, content: getAlert)
    
  }
  
  func saveButtonPressed() {
    if textIsAppropriate() {
      listViewModel.addItem(title: textFieldText)
      presentationMode.wrappedValue.dismiss()
    }
  }
  
  func textIsAppropriate() -> Bool {
    if textFieldText.count < 3 {
      alertTitle = "Your new todo item must be at least 3 characters long!!! 😩"
      showAlert.toggle()
      return false
    }
    
    return true
  }
  
  func getAlert() -> Alert {
    return Alert(title: Text(alertTitle))
  }
  
}

// MARK: Preview
struct AddView_Previews: PreviewProvider {
  static var previews: some View {
    
    Group {
      NavigationView {
        AddView()
      }
      .environmentObject(ListViewModel())
      .preferredColorScheme(.light)
      
      NavigationView {
        AddView()
      }
      .environmentObject(ListViewModel())
      .preferredColorScheme(.dark)
    }
    
  }
}
