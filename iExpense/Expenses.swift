//
//  Expenses.swift
//  iExpense
//
//  Created by Daniel Jesus Callisaya Hidalgo on 19/1/22.
//

import Foundation

class Expenses: ObservableObject {
    @Published var items = [ExpenseItem]()
}
