import XCTest

@testable import SassDSL

final class SassRendererTests: XCTestCase {
    func test_renderVariable() {
        var renderer = SassRenderer(options: SassRendererOptions(lineBreak: ""))
        renderer.renderVariable(name: "base-color", value: .color(.named("red")))
        
        XCTAssertEqual("$base-color: red;", renderer.result)
    }
    
    func test_renderImport() {
        var renderer = SassRenderer(options: SassRendererOptions(lineBreak: ""))
        renderer.renderImport(path: "foundation")
        
        XCTAssertEqual("@import \"foundation\";", renderer.result)
    }
    
    func test_renderSelector() {
        var renderer = SassRenderer(
            options: SassRendererOptions(
                lineBreak: "\n",
                intendation: "  "
            )
        )
        renderer.renderSelector(selector: "body") { renderer in
            renderer.renderProperty(name: "padding", value: .number(0, "px"), options: RenderOptions(intendationCount: 1))
        }
        
        let expected = """
        body {
          padding: 0.0px;
        }
        """
        XCTAssertEqual(expected, renderer.result)
    }
    
    func test_renderProperty() {
        var renderer = SassRenderer(options: SassRendererOptions(lineBreak: ""))
        renderer.renderProperty(name: "background-color", value: .color(.hex("#FFFFFF")), options: RenderOptions())
        
        XCTAssertEqual("background-color: #FFFFFF;", renderer.result)
    }
}
