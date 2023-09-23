//
//  Expenses.swift
//  p7-iExpense
//
//  Created by Ali Almahoozi on 23/08/2023.
//

import Foundation

class Expenses: ObservableObject {
    
    @Published var items = [ExpenseItem]() {
        
        didSet {
            let encoder = JSONEncoder()
            
            if let encode = try? encoder.encode(items) {
                UserDefaults.standard.set(encode, forKey: "itemsData")
                
            }
        }
    }
    
    init() {
        if let savedItems = UserDefaults.standard.data(forKey: "itemsData") {
            if let decodedItems = try? JSONDecoder().decode([ExpenseItem].self, from: savedItems) {
                items = decodedItems
                return
            }
        }
        
        items = []
    }
    
}
