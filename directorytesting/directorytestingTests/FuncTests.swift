//
//  FuncTests.swift
//  directorytestingTests
//
//  Created by Robert Steed on 1/3/23.
//

import XCTest
@testable import directorytesting
final class FuncTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    
    func test_FuncIsAccessable_Everywhere() {
       let numbers = FuncStruct.evenNumbers(arr: [20, 3, 7, 22])
        XCTAssert(numbers == [20, 22])
    }
        
    func test_funcTakesBigNumbers_Everywhere() {
        let bigNumbers = FuncStruct.evenNumbers(arr: [102239039230934123, 234895575683452643, 495056854902, 34905865638450694])
        
        XCTAssert(bigNumbers == [34905865638450694, 495056854902])
    }
    
    

}
