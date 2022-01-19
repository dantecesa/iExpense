//
//  Expenses.swift
//  iExpense
//
//  Created by Dante Cesa on 1/19/22.
//

import Foundation

class Expenses: ObservableObject {
    @Published var items: [ExpenseItem] = []
}
