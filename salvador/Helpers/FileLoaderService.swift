//
//  DecodeLoadJson.swift
//  salvador
//
//  Created by Geury Roustand on 23.02.23.
//

import Foundation

enum JSONFileError : Error{
    case JSONFileNowFound
}

func FileLoaderService(fileName: String) throws -> APISecretData {
    
    guard let url = Bundle.main.url(forResource: fileName, withExtension: "json"),
              let data = try? Data(contentsOf: url ) ,
              let jsonData = try? JSONDecoder().decode(APISecretData.self, from: data)
        else{
            throw JSONFileError.JSONFileNowFound
            
        }
        
        return jsonData
        
        
  
        
    
    
    
    
    
    
//    var key = ""
//    guard let url = Bundle.main.url(forResource: fileName, withExtension: "json"),
//          let data = try? Data(contentsOf: url ) ,
//          let jsonData = try? JSONDecoder().decode(APISecretData.self, from: data),
//          let decodeKey = Data(base64Encoded: jsonData.OPEN_AI_API_KEY) else {
//           return ""
//    }
//    key = String(data: decodeKey, encoding: .utf8)!
    
    //    else{
    //        throw JSONFileError.JSONFileNowFound
    //
    //    }
    
//    return key
    
    
    
    //    return jsonData
    
    
}
