//
//  AddView.swift
//  iExpense
//
//  Created by Dante Cesa on 1/19/22.
//

import SwiftUI

struct AddView: View {
    @ObservedObject var expenses: Expenses
    
    @State private var name: String = ""
    @State private var type: String = "Personal"
    @State private var amount: Double = 0.0
    
    let expenseTypes: [String] = ["Business", "Personal"]
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Name", text: $name)
                    Picker("Type", selection: $type) {
                        ForEach(expenseTypes, id:\.self) { expenseType in
                            Text(expenseType)
                        }
                    }
                    TextField("Amount", value: $amount, format: .currency(code: "USD"))
                        .keyboardType(.decimalPad)
                }
                
                Section {
                    Button("Add Expense") {
                        expenses.items.append(ExpenseItem(name: name, type: type, amount: amount))
                        dismiss()
                    }
                }
            }
            .navigationTitle("Add an Expense")
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(expenses: Expenses())
    }
}
