//
//  ContentView.swift
//  WeSplit
//
//  Created by Vasileios Gkreen on 07/03/2020.
//  Copyright © 2020 Vasileios Gkreen. All rights reserved.
//

import SwiftUI

//This limit of 10 children inside a parent actually applies everywhere in SwiftUI.

//SwiftUI destroys and recreates your structs frequently, so keeping them small and simple structs is important for performance

//ContentView is a struct, which might be created as a constant. If you think back to when you learned about structs, that means it’s immutable – we can’t change its values freely.

//we can’t write mutating var body: some View – it just isn’t allowed instead we can use a property wrapper from SwiftUI called @State

//Apple recommends we add private access control to those properties, like this: @State private var tapCount = 0.


//Swift differentiates between “show the value of this property here” and “show the value of this property here, but write any changes back to the property.”

//In Swift, we mark these two-way bindings with a special symbol so they stand out: we write a dollar sign before them. This tells Swift that it should read the value of the property but also write it back as any changes happen.


//When we only need to read a value but write back a new value we dont need to reference the state's name with a dollar sign before.

struct EXAMPLE_CODE: View {
    
    @State private var name: String = ""
    
    //The students array doesn’t need to be marked with @State because it’s a constant; it isn’t going to change.
    let students = ["Vas", "Giulia", "Vasilis", "Laura"]
    //The selectedStudent property starts with the value 0 but can change, which is why it’s marked with @State.
    @State private var selectedStudent = 0
    
    var body: some View {
        
        NavigationView{
            
            Form {
                Section {
                    TextField("Enter your name", text: $name)
                    Text("You typed... \(name)")
                }
                
                Section {
                    Text("Hello World")
                    Text("Hello World")
                }
                
                VStack(alignment: .leading) {
                    Text("This is a Picker").font(.caption).foregroundColor(.gray)
                    Picker(selection: $selectedStudent, label: Text("Select your student")) {
                        ForEach(0..<students.count) { student in
                            Text(self.students[student])
                        }
                    }
                }
                
            }
                
                //Modifiers are regular methods with one small difference: they always return a new instance of whatever you use them on.
                .navigationBarTitle("WeSplit", displayMode: .inline)
        }
        
    }
}

struct EXAMPLE_CODE_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

