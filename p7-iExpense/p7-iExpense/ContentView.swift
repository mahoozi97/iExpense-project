//
//  ContentView.swift
//  p7-iExpense
//
//  Created by Ali Almahoozi on 23/08/2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject var expenses = Expenses()
    
    @State private var showingAddExpense = false
    
    private var totalAmount: Double {
            expenses.items.reduce(0.0) { partialResult, item in
                partialResult + item.amount
            }
        }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(expenses.items, id: \.id) { item in
                    HStack {
                        VStack(alignment: .leading) {
                            
                            Text(item.name)
                                .font(.headline)
                            Text(item.type)
                        }
                        
                        Spacer()
                        
                        Text(item.amount, format: .currency(code: Locale.current.currency?.identifier ?? "BD"))
                            .foregroundColor(item.amount <= 10 ? .green : item.amount <= 100 ? .orange : .red)
                            
                    }
                }
                .onDelete(perform: removeItem)
                
                HStack {
                    Text("Total amount")
                    Spacer()
                    Text("\(totalAmount.formatted(.currency(code: Locale.current.currency?.identifier ?? "BD")))")
                }
            }
            .navigationTitle("iExpense")
        }
    }
    
    func removeItem(at offsets: IndexSet) {
        
        expenses.items.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
