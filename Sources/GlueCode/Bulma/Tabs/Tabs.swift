//
//  File.swift
//  
//
//  Created by Kevin Klaebe on 24.05.21.
//

import Foundation
import Plot

struct Tabs: Component {
    private var tabs: [Tab]
    
    var body: Component {
        Navigation {
            Div {
                List {
                    for tab in tabs {
                        ListItem {
                            Link(url: URL(string: tab.path.absoluteString)!) {
                                Text(tab.name)
                            }
                        }
                    }
                }
                .listStyle(.unordered)
            }
            .class("container")
        }
        .class("tabs")
        .class("is-centered")
    }
    
    init(tabs: [Tab]) {
        self.tabs = tabs
    }
}
