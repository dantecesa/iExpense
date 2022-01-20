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
    
    var body: some View {
        NavigationView {
            List {
                ForEach(expenses.items) { item in
                    HStack {
                        VStack (alignment: .leading) {
                            Text(item.name)
                            Text(item.dateTime, style: .date)
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        }
                        Spacer()
                        Text("\(item.amount.formatted(.currency(code:  Locale.current.currencyCode ?? "USD")))")
                            .foregroundColor(.secondary)
                    }
                }.onDelete(perform: removeItems)
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
