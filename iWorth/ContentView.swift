//
//  ContentView.swift
//  iWorth
//
//  Created by Jason Wise on 5/21/22.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedRate = "Yearly"
    @State private var salary = 0
    @State private var workingHours = 0
    @State private var purchaseCost = 0
    @State private var hourlyRate = 0
    @State private var purchaseCostPerHour = 0
    
    var rates = ["Yearly", "Monthly", "Biweekly", "Weekly"]
    
    func selectedRateMapToValues(rate: String) -> Int {
        switch rate {
        case "Yearly":
            return 52
        case "Monthly":
            return 4
        case "Biweekly":
            return 2
        case "Weekly":
            return 1
        default:
            return 0
        }
    }
    
    func calculatePurchaseCostPerHour(hourlyRate: Int, purchaseCostPerHour: Int) -> Int {
        return hourlyRate * purchaseCostPerHour
    }
    
    func calculateHourlyRate(rate: Int, salary: Int, workingHours: Int) -> Int {
        let weeklyRate = salary / rate
        let hourlyRate = weeklyRate / workingHours
        
        return hourlyRate
    }
    
    var body: some View {
        VStack(alignment: .leading) {
                    Text("How much do you make: ")
                        
                    TextField("How much do you make?", value: $salary, format: .currency(code: "USD"))
                    Picker("Rates", selection: $selectedRate) {
                        ForEach(rates, id:\.self) {
                            Text($0)
                        }
                    }.pickerStyle(.segmented).padding(.horizontal)
                Divider().padding(.top)
                Text("Average hours worked a week: ")
            TextField("Average hours worked a week", value: $workingHours, format: .number)
                Divider()
                Text("How much does your purchase cost?")
                TextField("How much does your purchase cost?", value: $purchaseCost, format: .currency(code: "USD"))
            Spacer()
        }.padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
