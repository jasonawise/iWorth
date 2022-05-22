//
//  ContentView.swift
//  iWorth
//
//  Created by Jason Wise on 5/21/22.
//

import SwiftUI

struct ContentView: View {
    enum Rate: String, CaseIterable, Identifiable {
        case yearly, monthly, biweekly, weekly
        var id: Self { self }
    }
    
    @State private var selectedRate: Rate = .yearly
    var body: some View {
        VStack{
            Text("How much do you make: ")
                .padding()
            List {
                Picker("Rate", selection: $selectedRate) {
                    ForEach(Rate.allCases) { rate in
                        Text(rate.rawValue.capitalized)
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
