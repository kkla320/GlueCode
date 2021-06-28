import XCTest

@testable import SassDSL

final class ValueTests: XCTestCase {
    func test_description_string() {
        let value = Value.string("Test")
        
        XCTAssertEqual("\"Test\"", value.description)
    }
    
    func test_description_bool_true() {
        let value = Value.bool(true)
        
        XCTAssertEqual("true", value.description)
    }
    
    func test_description_bool_false() {
        let value = Value.bool(false)
        
        XCTAssertEqual("false", value.description)
    }
    
    func test_description_null() {
        let value = Value.null
        
        XCTAssertEqual("null", value.description)
    }
    
    func test_description_number_withUnit() {
        let value = Value.number(100, "px")
        
        XCTAssertEqual("100.0px", value.description)
    }
    
    func test_description_number_withoutUnit() {
        let value = Value.number(100, nil)
        
        XCTAssertEqual("100.0", value.description)
    }
    
    func test_description_color() {
        let value = Value.color(.named("red"))
        
        XCTAssertEqual("red", value.description)
    }
    
    func test_description_list() {
        let value = Value.list([.number(1, "px"), .string("solid"), .color(.named("red"))])
        
        XCTAssertEqual("1.0px \"solid\" red", value.description)
    }
}
