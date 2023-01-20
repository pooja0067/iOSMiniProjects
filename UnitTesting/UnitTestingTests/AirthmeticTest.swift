//
//  AirthmeticTest.swift
//  UnitTestingTests
//
//  Created by Pooja Patil on 31/08/22.
//

import XCTest
@testable import UnitTesting

class AirthmeticTest: XCTestCase {
    
    var sut: AirthmeticClass?
    var op1 = 0
    var op2 = 0
    
    override func setUpWithError() throws {
        print("setupwitherror called")
        sut = AirthmeticClass()
        op1 = 20
        op2 = 30
    }
    
    override func tearDownWithError() throws {
        print("tearDownWithError called")
        sut = nil
        op1 = 0
        op2 = 0
    }
    
    func testAdd() {
        //given
//        let n1 = 2
//        let n2 = 9
        
        //when
        let result = sut?.add(n1: op1, n2: op2)
        print("test add called")
        
        op1 = result ?? 77
        //then
        XCTAssertEqual(result, 50)
        
    }
    func testSub() {
        //given
//        let n1 = 2
//        let n2 = 9
        
        //when
        let result = sut?.sub(n1: op1, n2: op2)
        print("test sub called")
        
        //then
        XCTAssertNotEqual(result, 20)
        
    }
    func testMul() {
        //given
        let n1 = 2
        let n2 = 9
        
        //when
        let result = sut?.mul(n1: n1, n2: n2)
        print("test mul called")
        
        //then
        XCTAssertEqual(result, 18)
        
    }
    
    func testDev() {
        //given
        let n1 = 2
        let n2 = 9
        
        //when
        let result = sut?.dev(n1: n1, n2: n2)
        print("test dev called")
        
        //then
        XCTAssertEqual(result, 0)
        
    }
    
}
