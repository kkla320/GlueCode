import XCTest

@testable import SassDSL

final class ColorTests: XCTestCase {
    func test_description_hex() {
        let color = Color.hex("#FFFFFF")
        
        XCTAssertEqual("#FFFFFF", color.description)
    }
    
    func test_description_hex_withoutHash() {
        let color = Color.hex("FFFFFF")
        
        XCTAssertEqual("#FFFFFF", color.description)
    }
    
    func test_description_named() {
        let color = Color.named("red")
        
        XCTAssertEqual("red", color.description)
    }
    
    func test_description_rgb() {
        let color = Color.rgb(red: 100, green: 100, blue: 100)
        
        XCTAssertEqual("rgb(100, 100, 100)", color.description)
    }
    
    func test_description_rgbOver255() {
        let color = Color.rgb(red: 500, green: 500, blue: 500)
        
        XCTAssertEqual("rgb(255, 255, 255)", color.description)
    }
    
    func test_description_rgbUnder0() {
        let color = Color.rgb(red: -500, green: -500, blue: -500)
        
        XCTAssertEqual("rgb(0, 0, 0)", color.description)
    }
    
    func test_description_rgba() {
        let color = Color.rgba(red: 100, green: 100, blue: 100, alpha: 50)
        
        XCTAssertEqual("rgba(100, 100, 100, 50)", color.description)
    }
    
    func test_description_rgbaOver255() {
        let color = Color.rgba(red: 500, green: 500, blue: 500, alpha: 200)
        
        XCTAssertEqual("rgba(255, 255, 255, 100)", color.description)
    }
    
    func test_description_rgbaUnder0() {
        let color = Color.rgba(red: -500, green: -500, blue: -500, alpha: -20)
        
        XCTAssertEqual("rgba(0, 0, 0, 0)", color.description)
    }
    
    func test_description_hsl() {
        let color = Color.hsl(hue: 180, saturation: 50, lightness: 50)
        
        XCTAssertEqual("hsl(180, 50%, 50%)", color.description)
    }
    
    func test_description_hslOver255() {
        let color = Color.hsl(hue: 400, saturation: 200, lightness: 200)
        
        XCTAssertEqual("hsl(360, 100%, 100%)", color.description)
    }
    
    func test_description_hslUnder0() {
        let color = Color.hsl(hue: -400, saturation: -200, lightness: -200)
        
        XCTAssertEqual("hsl(0, 0%, 0%)", color.description)
    }
    
    func test_description_hsla() {
        let color = Color.hsla(hue: 180, saturation: 50, lightness: 50, alpha: 50)
        
        XCTAssertEqual("hsla(180, 50%, 50%, 50)", color.description)
    }
    
    func test_description_hslaOver255() {
        let color = Color.hsla(hue: 400, saturation: 200, lightness: 200, alpha: 200)
        
        XCTAssertEqual("hsla(360, 100%, 100%, 100)", color.description)
    }
    
    func test_description_hslaUnder0() {
        let color = Color.hsla(hue: -400, saturation: -200, lightness: -200, alpha: -20)
        
        XCTAssertEqual("hsla(0, 0%, 0%, 0)", color.description)
    }
}
