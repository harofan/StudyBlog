//
//  ProtobufTestTests.swift
//  ProtobufTestTests
//
//  Created by Link on 2019/2/26.
//  Copyright © 2019 Link. All rights reserved.
//

import XCTest

class ProtobufTestTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
            
            testStringJsonDecode()
        }
    }
    
    func testLogDataSize() {
        /*
         Int pbData大小:8, json jsonData大小:37
         FLOAT pbData大小:20, json jsonData大小:53
         String pbData大小:32, json jsonData大小:77
         */
        print("Int pbData大小:\(ProtobufTestTests.intData.count), json jsonData大小:\(ProtobufTestTests.jsonIntData.count)")
        print("FLOAT pbData大小:\(ProtobufTestTests.floatData.count), json jsonData大小:\(ProtobufTestTests.jsonFloatData.count)")
        print("String pbData大小:\(ProtobufTestTests.stringData.count), json jsonData大小:\(ProtobufTestTests.jsonStringData.count)")
        
    }
}

/// Int
extension ProtobufTestTests {
    
    static let intInfo = IntClass.with { (intInfo) in
        intInfo.int1 = 1
        intInfo.int2 = 1
        intInfo.int3 = 1
        intInfo.int4 = 1
    }
    static let intData = try! ProtobufTestTests.intInfo.serializedData()
    
    /// 平均0.0284s 最大0.0363s
    func testIntPBEncode() {
        
        for _ in 0..<10000 {
            _ = try! ProtobufTestTests.intInfo.serializedData()
        }
    }
    
    /// 平均0.0159 最大0.022
    func testIntPBDecode() {
        for _ in 0..<10000 {
            _ = try! IntClass(serializedData: ProtobufTestTests.intData)
        }
    }
    
    static let jsonIntStr = "{\"int2\":1,\"int3\":1,\"int1\":1,\"int4\":1}"
    static let jsonIntData = jsonIntStr.data(using: String.Encoding.utf8) ?? Data()
    
    /// 平均0.0239 最大0.0324
    func testIntJsonEncode() {
        for _ in 0..<10000 {
            _ = ProtobufTestTests.jsonIntStr.data(using: String.Encoding.utf8)
        }
    }
    
    /// 平均0.0186 最大0.0237
    func testIntJsonDecode() {
        for _ in 0..<10000 {
            _ = try! JSONSerialization.jsonObject(with: ProtobufTestTests.jsonIntData, options: .mutableContainers)
        }
    }
}

/// float
extension ProtobufTestTests {
    static let floatInfo = FloatClass.with { (floatInfo) in
        floatInfo.float1 = 0.1
        floatInfo.float2 = 0.1
        floatInfo.float3 = 0.1
        floatInfo.float4 = 0.1
    }

    static let floatData = try! ProtobufTestTests.floatInfo.serializedData()
    
    /// 平均0.0211 最大0.0273
    func testFloatPBEncode() {
        
        for _ in 0..<10000 {
            _ = try! ProtobufTestTests.floatInfo.serializedData()
        }
    }
    
    /// 平均0.0208 最大0.0253
    func testFloatPBDecode() {
        for _ in 0..<10000 {
            _ = try! FloatClass(serializedData: ProtobufTestTests.floatData)
        }
    }
    
    static let jsonFloatStr = "{\"float1\":0.1,\"float2\":0.1,\"float3\":0.1,\"float4\":0.1}"
    static let jsonFloatData = jsonFloatStr.data(using: String.Encoding.utf8) ?? Data()
    
    /// 平均0.0157 最大0.0204
    func testFloatJsonEncode() {
        for _ in 0..<10000 {
            _ = ProtobufTestTests.jsonFloatStr.data(using: String.Encoding.utf8)
        }
    }
    
    /// 平均0.0295 最大0.0364
    func testFloatJsonDecode() {
        for _ in 0..<10000 {
            _ = try! JSONSerialization.jsonObject(with: ProtobufTestTests.jsonFloatData, options: .mutableContainers)
        }
    }
}

/// string
extension ProtobufTestTests {
    
    static let stringInfo = StringClass.with { (stringInfo) in
        stringInfo.string1 = "string"
        stringInfo.string2 = "string"
        stringInfo.string3 = "string"
        stringInfo.string4 = "string"
    }
    
    static let stringData = try! ProtobufTestTests.stringInfo.serializedData()
    
    /// 平均0.0343 最大0.0449
    func testStringPBEncode() {
        for _ in 0..<10000 {
            _ = try! ProtobufTestTests.stringInfo.serializedData()
        }
    }
    
    /// 平均0.156 最大0.162
    func testStringPBDcode() {
        for _ in 0..<10000 {
            _ = try! StringClass(serializedData: ProtobufTestTests.stringData)
        }
    }
    
    static let jsonStringStr = "{\"string3\":\"string\",\"string1\":\"string\",\"string2\":\"string\",\"string4\":\"string\"}"
    static let jsonStringData = jsonStringStr.data(using: String.Encoding.utf8) ?? Data()
    
    /// 平均0.0179 最大0.0274
    func testStringJsonEncode() {
        for _ in 0..<10000 {
            _ = ProtobufTestTests.jsonStringStr.data(using: String.Encoding.utf8)
        }
    }
    
    /// 平均0.0168 最大0.0236
    func testStringJsonDecode() {
        for _ in 0..<10000 {
            _ = try! JSONSerialization.jsonObject(with: ProtobufTestTests.jsonStringData, options: .mutableContainers)
        }
    }
}
