//
//  MainView.swift
//  p7-iExpense
//
//  Created by Ali Almahoozi on 23/09/2023.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            ContentView()
                .tabItem {
                    Image(systemName: "1.lane")
                    Text("One")
                }
            AddView(expenses: Expenses())
                .tabItem {
                    Image(systemName: "2.lane")
                    Text("Two")
                }
        }
    }
}

#Preview {
    MainView()
}
