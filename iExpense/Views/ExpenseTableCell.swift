//
//  ExpenseTableCell.swift
//  iExpense
//
//  Created by Dante Cesa on 1/20/22.
//

import SwiftUI

struct ExpenseTableCell: View {
    var withExpenseItem: ExpenseItem
    
    var body: some View {
        HStack {
            VStack (alignment: .leading) {
                Text(withExpenseItem.name)
                Text(withExpenseItem.dateTime, style: .date)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            Spacer()
            Text("\(withExpenseItem.amount.formatted(.currency(code:  Locale.current.currencyCode ?? "USD")))")
                .foregroundColor(expenseColor(forValue: withExpenseItem.amount))
        }
    }
    
    func expenseColor(forValue: Double) -> Color {
        switch forValue {
        case let x where x < 10:
            return Color.green
        case let x where x >= 100:
            return Color.red
        default:
            return .secondary
        }
    }
}

struct ExpenseTableCell_Previews: PreviewProvider {
    static var previews: some View {
        ExpenseTableCell(withExpenseItem: ExpenseItem(name: "Test Expense", type: "Personal", amount: 5.0, dateTime: Date.now))
    }
}
