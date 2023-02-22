//
//  UnitTestingGenerateImageViewModel_Tests.swift
//  salvadorTests
//
//  Created by Geury Roustand on 21.02.23.
//

import XCTest

@testable import salvador

@MainActor class UnitTestingGenerateImageViewModel_Tests: XCTestCase {
    
    var modelView : GenerateImageViewModel!

    @MainActor override func setUpWithError() throws {
        modelView = GenerateImageViewModel()
        
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    @MainActor override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        
        modelView = nil
    }

    func test_UnitTestingGenerateImageViewModel_isLoading_ShouldBeFalse_and_imageData_ShouldBeNil(){
        
        let isLoading = modelView.isLoading
        let imageData = modelView.imageData
        
        XCTAssertFalse(isLoading)
        XCTAssertNil(imageData)
        
        
    }
    
    func test_UnitTestingGenerateImageViewModel_errorString_ShouldBeEmpty_and_showingAlert_ShouldBeFalse(){
        
        let errorString = modelView.errorString
        
        let showingAlert = modelView.showingAlert
        
        XCTAssert(errorString.isEmpty, "")
        XCTAssertFalse(showingAlert)
        
        
    }
    
    func test_UnitTestingGenerateImageViewModel_GetImage_ShouldPresentAfterFetch() async  {
        
        let userInputValue = UUID().uuidString
      
         await modelView.getImage(with: userInputValue)
        
        XCTAssertTrue((modelView.imageData != nil))


    }
 

}
