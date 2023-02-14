//
//  ContentView-ViewModal.swift
//  salvador
//
//  Created by Geury Roustand on 13.02.23.
//

import Foundation
import MapKit

extension GenerateImageView {
    @MainActor class GenerateImageViewModel: ObservableObject {
        @Published  var isLoading: Bool  = false
        @Published var imageData: UIImage? = nil
        
        func getImage (with userInputValue: String) async  {
            
            isLoading = true
            
            do {
                
                let response = try await CreateImage.shared.generateImage(withPrompt: userInputValue, apiKey: APISecret)
            
                if let  url = response.data.map(\.url).first {
                    
                    print("URL", url)
                    let (data, _) = try await URLSession.shared.data(from: url)
                    
                    imageData  = UIImage(data: data)
                    
                    isLoading = false

                }
            } catch{
                isLoading = false
                print(error)
            }
            
            
            
        }
        
        
    }
    
}
