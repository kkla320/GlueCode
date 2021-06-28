import Foundation
import Publish
import Plot
import ShellOut
import SassPublishPlugin
import Ink
import SplashPublishPlugin
import SassDSL
import Files

extension Modifier {
    static var bulmaHeadlines: Modifier {
        Modifier(target: .headings) { html, markdown in
            print(html)
            let parts = markdown.split(separator: " ")
            let prefix = parts[0]
            let value = parts[1..<parts.endIndex].joined(separator: " ")
            
            if prefix == "######" {
                return "<h6 class=\"title is-6\">\(value)</h6>"
            }
            
            if prefix == "#####" {
                return "<h5 class=\"title is-5\">\(value)</h5>"
            }
            
            if prefix == "####" {
                return "<h4 class=\"title is-4\">\(value)</h4>"
            }
            
            if prefix == "###" {
                return "<h3 class=\"title is-3\">\(value)</h3>"
            }
            
            if prefix == "##" {
                return "<h2 class=\"title is-2\">\(value)</h2>"
            }
            
            return "<h1 class=\"title is-1\">\(value)</h1>"
        }
    }
    
    static var bulmaTables: Modifier {
        Modifier(target: .tables) { html, markdown in
            return html.replacingOccurrences(of: "<table>", with: "<table class=\"table is-striped\">")
        }
    }
}

extension Plugin {
    static var bulma: Plugin {
        return Plugin(name: "Bulma") { context in
            context.markdownParser.addModifier(.bulmaHeadlines)
            context.markdownParser.addModifier(.bulmaTables)
        }
    }
}

extension Plugin {
    static func compileSass(stylesheet: Stylesheet, cssFilePath: Path) -> Plugin {
        return Plugin(name: "Sass") { context in
            
            let temporarySassFile = Path("Resources/temporary.scss")
            let file = try context.createFile(at: temporarySassFile)
            try file.write(stylesheet.asString())
            
            try Self.compileSass(sassFilePath: temporarySassFile, cssFilePath: cssFilePath).installer(&context)
        }
    }
}

// This type acts as the configuration for your website.
struct GlueCode: Website {
    enum SectionID: String, WebsiteSectionID {
        // Add the sections that you want your website to contain here:
        case blog
        case categories
    }

    struct ItemMetadata: WebsiteItemMetadata {
        // Add any site-specific metadata that you want to use here.
    }

    // Update these properties to configure your website:
    var url = URL(string: "https://your-website-url.com")!
    var name = "GlueCode"
    var description = "A description of GlueCode"
    var language: Language { .english }
    var imagePath: Path? { nil }
}

// This will generate your website using the built-in Foundation theme:
try GlueCode()
    .publish(using: [
        .installPlugin(
            .compileSass(
                sassFilePath: "Resources/Theme/main.scss",
                cssFilePath: "styles.css"
            )
        ),
        .installPlugin(.splash(withClassPrefix: "syntax-")),
        .installPlugin(.bulma),
        .copyFiles(at: Path("Resources/JetBrainsMono"), to: Path("JetBrainsMono")),
        .addMarkdownFiles(),
        .generateHTML(withTheme: .bulma)
    ])
