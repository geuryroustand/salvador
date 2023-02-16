//
//  ImageDataRequest.swift
//  salvador
//
//  Created by Geury Roustand on 16.02.23.
//

import Foundation

struct ImageDataRequest: Encodable {
    let prompt: String
    let numberOfImage: Int
    let imageSize: String
    
    enum CodingKeys: String , CodingKey {
        
        case prompt, numberOfImage = "n", imageSize = "size"
    }
    
    
}

