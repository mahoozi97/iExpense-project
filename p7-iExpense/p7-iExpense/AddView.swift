//
//  AddView.swift
//  p7-iExpense
//
//  Created by Ali Almahoozi on 23/08/2023.
//

import SwiftUI

struct AddView: View {
    
    @ObservedObject var expenses: Expenses
    
    @State private var name = ""
    
    @State private var type = "personal"
    
    @State private var amount = 0.0
    
    let types = ["Business", "Personal"]
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
            Form {
                TextField("name", text: $name)
                
                Picker("Type", selection: $type) {
                    ForEach(types, id: \.self) {
                        Text($0)
                    }
                }
                TextField("Amount", value: $amount, format: .currency(code: Locale.current.currency?.identifier ?? "BD"))
                    .keyboardType(.decimalPad)
            }
            .navigationTitle("Add new expense")
            .toolbar {
                Button("Save") {
                    
                    let item = ExpenseItem(name: name, type: type, amount: amount)
                   
                    expenses.items.append(item)
                    dismiss()
                }
            }
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(expenses: Expenses())
    }
}
