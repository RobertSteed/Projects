//
//  ContentView.swift
//  UnitConversion
//
//  Created by Robert Steed on 1/9/23.
//

import SwiftUI

struct ContentView: View {
    @State private var startingTemp = 0.0
    @State private var startingUnit = "Celcius"
    @State private var endingUnit = "Celcius"
    let tempSelection = ["Fahrenheit", "Kelvin", "Celcius"]
    
    @FocusState private var startingTempInFocus: Bool
    
    
    
    var endingTemp: Double {
        
        var tempInC = 0.0
        
        if startingUnit == "Fahrenheit" {
            tempInC = (startingTemp - 32) * 5/9
        } else if startingUnit == "Kelvin" {
            tempInC = (startingTemp - 273.15)
        } else {
            tempInC = startingTemp
        }
        if endingUnit == "Fahrenheit" {
            return tempInC * 9/5 + 32
        } else if endingUnit == "Kelvin" {
            return tempInC + 273.15
        } else {
            return tempInC
        }
    }
    
    
    
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Picker("Units", selection: $startingUnit) {
                        ForEach(tempSelection, id: \.self) {
                            Text("°\($0)")
                        }
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text("units")
                }
                Section {
                    TextField("Temperature in \(startingTemp)°", value: $startingTemp, format: .number)
                        .keyboardType(.decimalPad)
                        .focused($startingTempInFocus)
                }
                Section {
                    Picker("Units", selection: $endingUnit) { ForEach(tempSelection, id: \.self) {
                        Text("°\($0)")
                    }
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text("Convert To")
                }
                Section {
                    Text("\(endingTemp)")
                }
            }
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    Button("Done") {
                        startingTempInFocus = false
                    }
                }
            }
            .navigationTitle("Convert Your Temp")
        }
    }
}
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
    

