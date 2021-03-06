//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Daniel Jesus Callisaya Hidalgo on 19/1/22.
//

import Foundation
struct ExpenseItem: Identifiable, Codable {
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
    
}
