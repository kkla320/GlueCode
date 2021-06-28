//
//  File.swift
//  
//
//  Created by Kevin Klaebe on 23.05.21.
//

import Foundation
import Plot

struct Navbar: Component {
    var body: Component {
        Navigation {
            Div {
                Link(url: "https://bulma.io") {
                    Image("https://bulma.io/images/bulma-logo.png")
                }
                .class("navbar-item")
                
                Span {
                    for _ in 0...2 {
                        Span()
                            .attribute(named: "aria-hidden", value: "true")
                    }
                }
                .attribute(named: "role", value: "button")
                .attribute(named: "aria-label", value: "menu")
                .attribute(named: "aria-expanded", value: "false")
                .attribute(named: "data-target", value: "navbar")
                .class("navbar-burger")
            }
            .class("navbar-brand")
            
            Div {
                Div {
                    Link(url: "https://apple.com") {
                        Text("Home")
                    }
                    .class("navbar-item")
                }
                .class("navbar-start")
            }
            .id("navbar")
            .class("navbar-menu")
        }
        .attribute(named: "aria-label", value: "main", replaceExisting: false)
        .attribute(named: "aria-label", value: "navigation", replaceExisting: false)
        .attribute(named: "role", value: "navigation")
        .class("navbar")
    }
}
