//
//  ContentView.swift
//  iExpense
//
//  Created by Daniel Jesus Callisaya Hidalgo on 15/1/22.
//

import SwiftUI

class User: ObservableObject {
    @Published var firstName = "Bilbo"
    @Published var lastName = "Baggins"
}

struct ContentView: View {
    @State private var showingSheet = false
    @StateObject  var user = User()
    var body: some View {
        Button("Show Sheet") {
            showingSheet.toggle()
               }
        .sheet(isPresented: $showingSheet) {
            SecondView(name: "twostraws")
        }
    }
}


struct SecondView: View {
    let name: String
    @Environment(\.dismiss) var dismiss

      var body: some View {
          VStack {
              Text("Hello, \(name)!")
              Button("Dismiss") {
                  dismiss()
              }
          }
          
      }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
