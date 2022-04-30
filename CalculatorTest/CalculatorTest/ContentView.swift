//
//  ContentView.swift
//  CalculatorTest
//
//  Created by Israel Manzo on 4/28/22.
//

import SwiftUI

class Calculations: ObservableObject {
    
    @Published var counter = 0
    @Published var input = ""
    
    func increasing() {
        guard counter < 10 else { return }
        counter += 1
    }
    
    func decreasing() {
        guard counter > 0 else { return }
        counter -= 1
    }
    
    func adding() -> Int {
        (Int(input) ?? 0) + 2
    }
}

struct ContentView: View {
    
    @StateObject var cal = Calculations()
    
    @State var number = 0
    
    var body: some View {
        VStack {
            VStack {
                TextField("Enter something", text: $cal.input)
                Text("Number: \(number)")
                    .font(.title)
                Button {
                    number = cal.adding()
                } label: {
                    Text("Adding")
                }

            }
            .padding()
            Text("Count: \(cal.counter)")
                .font(.title)
            
            HStack {
                Button {
                    cal.increasing()
                } label: {
                    Image(systemName: "plus")
                }
                
                Button {
                    cal.decreasing()
                } label: {
                    Image(systemName: "minus")
                }

            }
            .buttonStyle(.bordered)
            .padding()
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.portraitUpsideDown)
    }
}
