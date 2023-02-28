//
//  MockImageService.swift
//  salvadorTests
//
//  Created by Geury Roustand on 27.02.23.
//

import XCTest
@testable import salvador

final class MockImageService: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    
    func testLoadFile_WithValidData_ShouldReturnAPISecretData() throws {
        let mockService = MockFileLoaderService()
        mockService.apiSecretData = APISecretData(APISecret: "test api secret")
        
        
        let result = try mockService.loadFile(fileName: "test")
        
        XCTAssertEqual(result.APISecret, "test api secret")
    }
    
    
    func testLoadFile_WithInvalidData_ShouldThrowError() throws {
        // Arrange
        let mockFileLoader = MockFileLoaderService()
        mockFileLoader.error = JSONFileError.JSONFileNowFound
        
        // Act + Assert
        XCTAssertThrowsError(try mockFileLoader.loadFile(fileName: "test-file"))
    }
}
