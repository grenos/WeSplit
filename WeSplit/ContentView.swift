//
//  ContentView.swift
//  WeSplit
//
//  Created by Vasileios Gkreen on 07/03/2020.
//  Copyright © 2020 Vasileios Gkreen. All rights reserved.
//

import SwiftUI

/*
 
  If you create a picker by itself, outside a form, iOS will show a spinning wheel of options. Here, though, we’ve told SwiftUI that this is a form for user input, and so it has automatically changed the way our picker looks so that it doesn’t take up so much space.
 
 
 We need to add a navigation view (for the picker to navigate to another screen), which does two things: gives us some space across the top to place a title, and also lets iOS slide in new views as needed.
 
 
 It’s tempting to think that modifier should be attached to the end of the NavigationView, but it needs to be attached to the end of the Form instead. The reason is that navigation views are capable of showing many views as your program runs, so by attaching the title to the thing inside the navigation view we’re allowing iOS to change titles freely.
 
 
 
 SwiftUI lets us add views to the header and footer of a section, which in this instance we can use to add a small explanatory prompt.
 
 
 "%.2f”. That’s C’s syntax to mean “a two-digit floating-point number.”
 
 Very roughly, “%f” means “any sort of floating-point number,” which in our case will be the entire number. An alternative is “%g”, which does the same thing except it removes insignificant zeroes from the end – $12.50 would be written as $12.5. Putting “.2” into the mix is what asks for two digits after the decimal point, regardless of what they are. SwiftUI is smart enough to round those intelligently, so we still get good precision.
 
 */


struct ContentView: View {
    
    //SwiftUI must use strings to store text field values.
    @State private var checkAmount = ""
    
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 2
    
    let tipPercentages = [10, 15, 20, 25, 0]
    
    
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercentages[tipPercentage])
        //if checkAmount cant be converted into a Double will become nil
        // we use nil coalescing operator --> ?? to ensure that is never nil
        let orderAmount = Double(checkAmount) ?? 0
        
        //calculate the tip value by dividing orderAmount by 100 and multiplying by tipSelection.
        let tipValue = orderAmount / 100 * tipSelection
        //calculate the grand total of the check by adding the tip value to orderAmount.
        let grandTotal = orderAmount + tipValue
        //figure out the amount per person by dividing the grand total by peopleCount.
        let amountPerPerson = grandTotal / peopleCount
        
        return amountPerPerson
    }
    
    
    var totalAmuntToBepaid: Double {
        let tipSelection = Double(tipPercentages[tipPercentage])
        //if checkAmount cant be converted into a Double will become nil
        // we use nil coalescing operator --> ?? to ensure that is never nil
        let orderAmount = Double(checkAmount) ?? 0
        
        let tipValue = orderAmount / 100 * tipSelection
        let grandTotal = orderAmount + tipValue

        return grandTotal
    }
    
    
    
    var body: some View {
        
        NavigationView{
            
            Form {
                
                Section {
                    TextField("Amount", text: $checkAmount)
                        .keyboardType(.decimalPad)
                    
                    Picker(selection: $numberOfPeople, label: Text("Number of People")) {
                        ForEach(2..<100) { people in
                            Text("\(people) people")
                        }
                    }
                }
                
                
                Section(header: Text("Tip Percentage")) {
                    Picker(selection: $tipPercentage, label: Text("Tip Percentage")) {
                        ForEach(0..<tipPercentages.count){ percentage in
                            Text("\(self.tipPercentages[percentage])")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                
                Section(header: Text("Amount per person")) {
                    Text("$\(totalPerPerson, specifier: "%.2f")")
                }
                
            
                Section(header: Text("Total Amount")) {
                    Text("$\(totalAmuntToBepaid, specifier: "%.2f")")
                }
                
            }
            
            
            .navigationBarTitle("WeSplit")
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
