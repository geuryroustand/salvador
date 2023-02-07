//
//  fetchImage.swift
//  salvador
//
//  Created by Geury Roustand on 06.02.23.
//

import SwiftUI

enum ImageError: Error {
    case badURL
}


class createImage {
    
    static let shared = createImage()
    
    func generateImage(withPrompt prompt: String, apiKey: String) async throws -> apiData {
       
        guard let url = URL(string: "https://api.openai.com/v1/images/generations") else {
            throw ImageError.badURL
        }
        
        let parameters: [String: Any] = [
            "prompt":prompt,
            "n": 1,
            "size":"1024x1024"
        ]
        
        let data: Data = try JSONSerialization.data(withJSONObject: parameters)
    
        var request = URLRequest(url: url)
        
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("Bearer \(apiKey)", forHTTPHeaderField: "Authorization")
        
        request.httpMethod = "POST"
        request.httpBody = data
        
        let (response, _) = try await URLSession.shared.data(for: request)
        
        let result = try JSONDecoder().decode(apiData.self,  from: response)
        
        return result
        
    }
}
