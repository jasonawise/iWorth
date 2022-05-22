//
//  ContentView.swift
//  iWorth
//
//  Created by Jason Wise on 5/21/22.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedRate = "Yearly"
    @State private var salary = ""
    @State private var workingHours = ""
    @State private var purchaseCost = ""
    @State private var hourlyRate = 0
    @State private var purchaseCostPerHour = 0
    
    var rates = ["Yearly", "Monthly", "Biweekly", "Weekly"]
    
    func selectedRateMapToValues(rate: String) -> Int {
        switch rate {
        case "Yearly":
            return 52
        case "Monthly":
            return 12
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
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    TextField("How much do you make?", text: $salary).padding()
                    Picker("Rates", selection: $selectedRate) {
                        ForEach(rates, id:\.self) {
                            Text($0)
                        }
                    }.padding()
                }
                
                TextField("Average hours worked a week", text: $workingHours).padding()
                
                TextField("How much does your purchase cost?", text: $purchaseCost).padding()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
