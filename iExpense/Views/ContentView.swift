//
//  ContentView.swift
//  iExpense
//
//  Created by Dante Cesa on 1/18/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var expenses = Expenses()
    @State var showingAddView: Bool = false
    @State var selectedExpenseType: String = "Business"
    let expenseTypes: [String] = ["Business", "Personal"]
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    Picker("Expense Type", selection: $selectedExpenseType) {
                        ForEach(expenseTypes, id:\.self) { type in
                            Text(type)
                        }
                    }.pickerStyle(.segmented)
                    
                    ForEach(expenses.items) { item in
                        if item.type == selectedExpenseType {
                            ExpenseTableCell(withExpenseItem: item)
                        }
                    }.onDelete(perform: removeItems)
                }
            }
            .navigationTitle("iExpense")
            .toolbar {
                Button {
                    showingAddView = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showingAddView) {
                AddView(expenses: expenses)
            }
        }
    }
    
    func removeItems(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
