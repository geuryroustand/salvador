//
//  ContentView-ViewModal.swift
//  salvador
//
//  Created by Geury Roustand on 13.02.23.
//

import Foundation
import MapKit
import SwiftUI




//extension GenerateImageView  {
@MainActor class GenerateImageViewModel: ObservableObject {
    
    @Published  var isLoading: Bool  = false
    @Published var imageData: UIImage? = nil
    
    @Published var errorString: String = ""
    @Published var showingAlert: Bool = false
    
    func getImage (with userInputValue: String) async  {
        
        isLoading = true
        
        do {
            
            let APISecretKey  =  loadJson(fileName: "APISecret")

            let response = try await CreateImage.shared.generateImage(withPrompt: userInputValue, apiKey:APISecretKey.APISecret)
            
            print("response", response)
            
            if let  url = response.data.map(\.url).first {
                
                let (data, _) = try await URLSession.shared.data(from: url)
                
                imageData  = UIImage(data: data)
                
                isLoading = false
                
            }
        } catch{
            isLoading = false
            
            showingAlert = true
            errorString = error.localizedDescription
            
        }
        
        
        
    }
    
    
    
    
    func loadJson(fileName: String) -> APISecretData {
        
        guard let url = Bundle.main.url(forResource: fileName, withExtension: "json")else{
     
            fatalError("Could not find \(fileName) in the project")

        }
        
        guard let data = try? Data(contentsOf: url ) else {
            fatalError("Could not find \(fileName) in the project")
        }
        
        
        
        
        guard let jsonData = try? JSONDecoder().decode(APISecretData.self, from: data) else {
            fatalError("Could not find \(fileName) in the project")
        }
        
        
        
        return jsonData
        
    }
    
}
    
//}
