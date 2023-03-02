//
//  ContentView-ViewModal.swift
//  salvador
//
//  Created by Geury Roustand on 13.02.23.
//

import Foundation
import MapKit
import SwiftUI




extension GenerateImageView  {
    @MainActor class ViewModel: ObservableObject {
        
        @Published  var isLoading: Bool  = false
        @Published var imageData: UIImage? = nil
        
        @Published var errorString: String = ""
        @Published var showAlert: Bool = false
        
        @Published var imageURL: URL?
        
        func getImage (with userInputValue: String) async  {
            
            isLoading = true
            
            do {
                
                guard let APISecretKey  =  try? FileLoaderService(fileName: "APISecret") else{
                    throw JSONFileError.JSONFileNowFound
                }
                
                let response = try await CreateImageService.shared.generateImage(withPrompt: userInputValue, apiKey:APISecretKey.APISecret)
                
                if let  url = response.data.map(\.url).first {
                                        
                    imageURL = URL(string: "\(url)")

                    let (data, _) = try await URLSession.shared.data(from: url)
                   

                    imageData  = UIImage(data: data)

                    isLoading = false
                    
                }
                
                
            } catch JSONFileError.JSONFileNowFound {
                isLoading = false
                showAlert = true
                errorString = "JSON APISecret not found"
                
            } catch ImageError.encodingOfRequestBodyFailed{
                isLoading = false
                showAlert = true
                errorString = "Encoding Request Body Failed"
            }
            
            catch ImageError.badURL {
                isLoading = false
                showAlert = true
                errorString = "Invalid URL"
                
            }
            catch{
                isLoading = false
                showAlert = true
                errorString = error.localizedDescription
                
            }
            
            
            
        }
        
    }
    
}
