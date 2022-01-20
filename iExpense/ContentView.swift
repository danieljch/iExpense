//
//  ContentView.swift
//  iExpense
//
//  Created by Daniel Jesus Callisaya Hidalgo on 15/1/22.
//

import SwiftUI



struct ContentView: View {
    @StateObject var expenses = Expenses()
    @State private var showingAddExpense = false
   
    var body: some View {
        NavigationView {
            List {
                //Challenge 3
                Section(header: Text("Personal")){
                ForEach(expenses.items) { item in
                    if item.type == "Personal" { HStack {
                           VStack(alignment: .leading) {
                               Text(item.name)
                                   .font(.headline)
                               Text(item.type)
                           }

                           Spacer()
                        TextCurrency(value: item.amount) //Challenge 2
                        //Text(item.amount, format: .currency(code: Locale.current.currencyCode ?? "USD")) // Challenge 1
                       }
                    }
                }
                .onDelete(perform: removeItems)
                }
                //Challenge 3 
                Section(header: Text("Business")){
                ForEach(expenses.items) { item in
                    if item.type == "Business" {
                        
                   HStack {
                           VStack(alignment: .leading) {
                               Text(item.name)
                                   .font(.headline)
                               Text(item.type)
                           }

                           Spacer()
                        TextCurrency(value: item.amount) //Challenge 2
                        //Text(item.amount, format: .currency(code: Locale.current.currencyCode ?? "USD")) // Challenge 1
                       }
                    }
                }
                .onDelete(perform: removeItems)
                }
            }
            .navigationTitle("iExpense")
            .toolbar {
                Button {
                    showingAddExpense = true
                } label: {
                    Image(systemName: "plus")
                }
            }
        }.sheet(isPresented: $showingAddExpense) {
          AddView(expenses: expenses)
        }
    }
    func removeItems(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
    //Challenge 2
    struct TextCurrency: View{
        let value: Double
        
        var body: some View{
            Text(value, format: .currency(code: Locale.current.currencyCode ?? "USD")).foregroundColor(formatAmount(amount: value))
        }
        func formatAmount(amount: Double) -> Color{
            switch amount {
            case 0..<10:    return .red
            case 10..<100: return .blue
            case 100...1000 : return .green
            default: return .gray
            }
        }
    }
    
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
