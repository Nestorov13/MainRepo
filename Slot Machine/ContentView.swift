//
//  ContentView.swift
//  Slot Machine
//
//  Created by Borislav on 23.09.22.
//

import SwiftUI

struct ContentView: View {
    
    @State private    var SymbolA = "Symbol1"
    @State private    var SymbolB = "Symbol2"
    @State private    var SymbolC = "Symbol3"
    @State private    var credits:Int = 9000
    
    
    var body: some View {
        
        
        
        VStack {
            
            
            // Logo part
            Text("Slot ForU")
                .font(.system(size: 68))
                .fontWeight(.black)
                .foregroundColor(Color.blue)
            HStack(spacing: 0.0){
                
                // Purchased credits
                
                Text("Your available credits: ")
                    .padding(.all)
                
                Text(String(credits))
                
                    .padding()
                    .frame(width: 100.0, height: 0)
                
            }
            Spacer()
            
            HStack(spacing: 20){
                
                    // Slot Symbols (Apple = Symbol1, Cherry = Symbol2, Star = Symbol3)
                Image(SymbolA)
                    .resizable(resizingMode: .stretch) .aspectRatio(contentMode: .fit).frame(width: 100.0, height: 100.0)
                
                Image(SymbolB)
                    .resizable(resizingMode: .stretch) .aspectRatio(contentMode: .fit).frame(width: 100.0, height: 100.0)
                
                Image(SymbolC)
                    .resizable(resizingMode: .stretch) .aspectRatio(contentMode: .fit).frame(width: 100.0, height: 100.0)
                
            }
            
            Spacer()
            
            // SPINNING Button func
            
            Button( action:
                    {
                let symbol1Rand = Int.random(in: 1...3)
                let symbol2Rand = Int.random(in: 1...3)
                let symbol3Rand = Int.random(in: 1...3)
                
                SymbolA = "Symbol" + String(symbol1Rand)
                SymbolB = "Symbol" + String(symbol2Rand)
                SymbolC = "Symbol" + String(symbol3Rand)
                
                
                // Logic for the credits
                
                if (symbol1Rand == symbol2Rand)&&(symbol1Rand == symbol3Rand)
                {
                    credits += 150
                }
                else if (symbol1Rand == symbol3Rand)
                {
                    credits += 50
                }
                else if (symbol2Rand == symbol3Rand)
                {
                    credits += 50
                }
                else if (symbol1Rand == symbol2Rand)
                {
                    credits += 50
                }
                else
                {
                    credits -= 250
                }
                
            }
                    ,label:
                    {
                Text("Spin it!")
                    .fontWeight(.bold)
                    .font(.system(size: 26))
                    .foregroundColor(.white)
                    .padding(.all)
                    .background(.red)
                    .cornerRadius(15.0)
                
                
            })
            .frame(width: 150.0, height: 100.0)
            
            
        }
        
    }
    
    
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
