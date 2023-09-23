//
//  ExpenseItem.swift
//  p7-iExpense
//
//  Created by Ali Almahoozi on 23/08/2023.
//

import Foundation

struct ExpenseItem: Identifiable, Codable {
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
}
