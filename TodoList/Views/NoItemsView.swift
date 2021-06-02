//
//  NoItemsView.swift
//  TodoList
//
//  Created by Frederick Javalera on 6/1/21.
//

import SwiftUI

struct NoItemsView: View {
  
  // MARK: Properties
  @State var animate: Bool = false
  let secondaryAccentColor = Color("SecondaryAccentColor")
  
  // MARK: Body
  var body: some View {
    
    ScrollView {
      
      VStack(spacing: 10) {
        
        Text("There are no items!")
          .font(.title)
          .fontWeight(.semibold)
        
        Text("Are you a productive person? I think you should click the add button and add a bunch of items to your todo list!")
          .padding(.bottom, 20)
        
        NavigationLink(
          destination: AddView(),
          label: {
            
            Text("Add Something 🥳")
              .foregroundColor(.white)
              .font(.headline)
              .frame(height: 55)
              .frame(maxWidth: .infinity)
              .background(animate ? secondaryAccentColor : Color.init("AccentColor"))
              .cornerRadius(10.0)
            
          })//: NavigationLink
          .padding(.horizontal, animate ? CGFloat(30) : CGFloat(50))
          .shadow(
            color: animate ? secondaryAccentColor.opacity(0.7) : Color.accentColor.opacity(0.7),
            radius: animate ? 30 : 10,
            x: 0,
            y: animate ? 50 : 30)
          .scaleEffect(animate ? 1.1 : 1.0)
          .offset(y: animate ? -7 : 0)
        
      }//: VStack
      .frame(maxWidth: 400)
      .multilineTextAlignment(.center)
      .padding(40)
      .onAppear(perform: addAnimation)
      
    }//: ScrollView
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    
  }
  
  func addAnimation() {
    
    // Makes sure animate isn't already true. If it is, returns.
    guard !animate else { return }
    
    DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
      withAnimation(
        Animation
          .easeInOut(duration: 2.0)
          .repeatForever()
      ) {
        animate.toggle()
      }
    }
    
  }
  
}

// MARK: Preview
struct NoItemsView_Previews: PreviewProvider {
  static var previews: some View {
    NoItemsView()
      .previewLayout(.sizeThatFits)
  }
}
