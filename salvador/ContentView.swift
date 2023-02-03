//
//  ContentView.swift
//  salvador
//
//  Created by Geury Roustand on 03.02.23.
//

import SwiftUI

struct ContentView: View {
    
    @State var userInputValue = ""
    
    @State var userIsTyping = false
    
 //https://api.openai.com/v1/images/generations
    
    var body: some View {
        ZStack(){
            VStack {
                Text("Create an image")
                    .fontWeight(.black)
                    .font(.largeTitle)
                    .padding([.top])
                
//                Form{
                    
                TextField("Search", text: $userInputValue, onEditingChanged:{
                    typing in
                    userIsTyping = typing
                    
                })
                        .textFieldStyle(.roundedBorder)
                        .padding()
                        .foregroundColor(.black)
                        .background(.black.opacity(0.5))
                
                        .onSubmit(of: .text){
                            print(userInputValue)
                        }
                        
//              }
                
                //placerholder
              
                    Image("salvador")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 300)
                
                   
            }
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
