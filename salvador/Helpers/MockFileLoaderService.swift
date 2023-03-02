//
//  MockFileLoaderService.swift
//  salvador
//
//  Created by Geury Roustand on 27.02.23.
//

import Foundation

class MockFileLoaderService {
    var apiSecretData: APISecretData?
    var error: Error?
    
    func loadFile(fileName: String) throws -> APISecretData {
        if let error = error {
            throw error
        }
        
        guard let apiSecretData = apiSecretData else {
            throw JSONFileError.JSONFileNowFound
        }
        
        return apiSecretData
    }
}
