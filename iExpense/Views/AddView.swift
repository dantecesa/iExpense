//
//  AddView.swift
//  iExpense
//
//  Created by Dante Cesa on 1/19/22.
//

import SwiftUI

struct AddView: View {
    @ObservedObject var expenses: Expenses
    
    @State private var name: String?
    @State private var type: String = "Personal"
    @State private var amount: Double?
    
    let expenseTypes: [String] = ["Business", "Personal"]
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Expense Name", text: $name ?? "")
                    Picker("Type", selection: $type) {
                        ForEach(expenseTypes, id:\.self) { expenseType in
                            Text(expenseType)
                        }
                    }.pickerStyle(.segmented)
                    TextField("Amount", value: $amount, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                        .keyboardType(.decimalPad)
                } header: {
                    Text("Expense Details")
                }
                
                Section {
                    Button("Add") {
                        addExpenseAndDismiss(named: name ?? "Empty", andType: type, withAmount: amount ?? 0)
                    }
                }
            }
            .navigationTitle(name ?? "New Expense")
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarLeading, content: {
                    Button("Cancel") {
                        dismiss()
                    }
                })
                
                ToolbarItemGroup(placement: .navigationBarTrailing, content: {
                    Button("Add") {
                        addExpenseAndDismiss(named: name ?? "Empty", andType: type, withAmount: amount ?? 0)
                    }
                })
            }
        }
    }
    
    func addExpenseAndDismiss(named: String, andType: String, withAmount: Double) {
        expenses.items.append(ExpenseItem(name: name ?? "", type: type, amount: amount ?? 0, dateTime: Date.now))
        dismiss()
    }
}

func ??<T>(lhs: Binding<Optional<T>>, rhs: T) -> Binding<T> {
    Binding(
        get: { lhs.wrappedValue ?? rhs },
        set: { lhs.wrappedValue = $0 }
    )
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(expenses: Expenses())
    }
}
