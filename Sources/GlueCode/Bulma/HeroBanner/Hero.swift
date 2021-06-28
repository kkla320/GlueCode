//
//  File.swift
//  
//
//  Created by Kevin Klaebe on 24.05.21.
//

import Foundation
import Plot

struct HeroBanner<Main: Component, Footer: Component>: Component {
    var main: () -> Main
    var footer: (() -> Footer)?
    
    var body: Component {
        Element(name: "section") {
            Div {
                main()
            }
            .class("hero-body")
            
            if let footer = footer {
                Div {
                    footer()
                }
                .class("hero-foot")
            }
        }
        .class("hero")
        .class("is-primary")
    }
    
    init(
        @ComponentBuilder main: @escaping () -> Main,
        @ComponentBuilder footer: @escaping () -> Footer
    ) {
        self.main = main
        self.footer = footer
    }
}
