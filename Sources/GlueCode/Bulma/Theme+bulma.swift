//
//  File.swift
//  
//
//  Created by Kevin Klaebe on 27.04.21.
//

import Foundation
import Plot
import Publish

public extension Theme {
    static var bulma: Self {
        Theme(
            htmlFactory: BulmaHTMLFactory()
        )
    }
}

struct BulmaHTMLFactory<Site: Website>: HTMLFactory {
    func makeIndexHTML(for index: Index, context: PublishingContext<Site>) throws -> HTML {
        HTML(head: [
            .stylesheet(Path("/styles.css")),
            .stylesheet(Path("/JetBrainsMono/fonts.css"))
        ]) {
            HeroBanner {
                Div {
                    Text("Glue-codes")
                        .class("title")
                }
                .class("container")
                .class("has-text-centered", replaceExisting: false)
            } footer: {
                Tabs(tabs: context.sections.map({ Tab(name: $0.title, path: $0.path) }))
            }
        }
    }
    
    func makeSectionHTML(for section: Section<Site>, context: PublishingContext<Site>) throws -> HTML {
        HTML(head: [
            .stylesheet(Path("/styles.css"))
        ]) {
            HeroBanner {
                Div {
                    Text("Glue-codes")
                        .class("title")
                }
                .class("container")
                .class("has-text-centered", replaceExisting: false)
            } footer: {
                Tabs(tabs: context.sections.map({ Tab(name: $0.title, path: $0.path) }))
            }
            
            Container {
                for item in section.items {
                    Card(item: item)
                }
            }
        }
    }
    
    func makeItemHTML(for item: Item<Site>, context: PublishingContext<Site>) throws -> HTML {
        HTML(head: [
            .stylesheet(Path("/styles.css")),
            .stylesheet(Path("/JetBrainsMono/fonts.css"))
        ]) {
            HeroBanner {
                Container {
                    Text("Glue-codes")
                        .class("title")
                }
                .class("has-text-centered", replaceExisting: false)
            } footer: {
                Tabs(tabs: context.sections.map({ Tab(name: $0.title, path: $0.path) }))
            }
            
            Container {
                item.content.body
            }
        }
        
//        HTML(
//            .lang(context.site.language),
//            .head(for: item, on: context.site),
//            .body(
//                .class("item-page"),
//                .header(for: context, selectedSection: item.sectionID),
//                .wrapper(
//                    .article(
//                        .div(
//                            .class("content"),
//                            .contentBody(item.body)
//                        ),
//                        .span("Tagged with: "),
//                        .tagList(for: item, on: context.site)
//                    )
//                ),
//                .footer(for: context.site)
//            )
//        )
    }
    
    func makePageHTML(for page: Page, context: PublishingContext<Site>) throws -> HTML {
        HTML(
            .lang(context.site.language),
            .head(for: page, on: context.site),
            .body(
//                .header(for: context, selectedSection: nil),
//                .wrapper(.contentBody(page.body)),
//                .footer(for: context.site)
            )
        )
    }
    
    func makeTagListHTML(for page: TagListPage, context: PublishingContext<Site>) throws -> HTML? {
        HTML(
            .lang(context.site.language),
            .head(for: page, on: context.site, stylesheetPaths: ["BulmaTheme/bulma.min.css"]),
            .body(
//                .header(for: context, selectedSection: nil),
//                .wrapper(
//                    .h1("Browse all tags"),
//                    .ul(
//                        .class("all-tags"),
//                        .forEach(page.tags.sorted()) { tag in
//                            .li(
//                                .class("tag"),
//                                .a(
//                                    .href(context.site.path(for: tag)),
//                                    .text(tag.string)
//                                )
//                            )
//                        }
//                    )
//                ),
//                .footer(for: context.site)
            )
        )
    }
    
    func makeTagDetailsHTML(for page: TagDetailsPage, context: PublishingContext<Site>) throws -> HTML? {
        HTML(
            .lang(context.site.language),
            .head(for: page, on: context.site, stylesheetPaths: ["BulmaTheme/bulma.min.css"]),
            .body(
//                .header(for: context, selectedSection: nil),
//                .wrapper(
//                    .h1(
//                        "Tagged with ",
//                        .span(.class("tag"), .text(page.tag.string))
//                    ),
//                    .a(
//                        .class("browse-all"),
//                        .text("Browse all tags"),
//                        .href(context.site.tagListPath)
//                    ),
//                    .itemList(
//                        for: context.items(
//                            taggedWith: page.tag,
//                            sortedBy: \.date,
//                            order: .descending
//                        ),
//                        on: context.site
//                    )
//                ),
//                .footer(for: context.site)
            )
        )
    }
}
