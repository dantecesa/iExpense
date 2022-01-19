//
//  ExpenseType.swift
//  iExpense
//
//  Created by Dante Cesa on 1/19/22.
//

import Foundation

struct ExpenseItem: Identifiable {
    var id: UUID = UUID()
    let name: String
    let type: String
    let amount: Double
}
