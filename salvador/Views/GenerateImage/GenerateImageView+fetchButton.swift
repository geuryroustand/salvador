//
//  FetchButtonView.swift
//  salvador
//
//  Created by Geury Roustand on 15.02.23.
//

import SwiftUI


extension GenerateImageView{
    
 var fetchButton: some View {
        
        HStack {
            TextField("Generate a image", text: $userInputValue, axis: .vertical)

            
            //                                                 FetchButtonView(userInputValue: $userInputValue)
            
            Button("Create"){
                Task{
                    
                    await viewModel.getImage(with: userInputValue)
                    
                    userInputValue = ""
                    
                }
                
            }
            .buttonStyle(.borderedProminent)
            
        }
        
    }
}
