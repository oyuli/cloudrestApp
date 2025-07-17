//
//  SwiftUI+Font.swift
//  cloudrestApp
//
//  Created by Vaibhavi Bandaru on 7/17/25.
//

import SwiftUI

extension Font {
    static func lexend(fontStyle: Font.TextStyle = .body, fontWeight: Weight = .regular) -> Font {
        return Font.custom(CustomFont(weight: fontWeight).rawValue, size: 20)
    }
}

extension Font.TextStyle {
    var size: CGFloat {
        switch self {
        case.largeTitle: return 34
        case.title: return 28
        case.title2: return 24
        case.title3: return 20
        case.headline: return 18
        case.body: return 17
        case.callout: return 15
        case.subheadline: return 14
        case.footnote: return 13
        case.caption: return 12
        case.caption2: return 11
        @unknown default: return 10
        }
    }
}

enum CustomFont: String {
    case regular = "Lexend-Regular"
    case bold = "Lexend-Bold"
    case medium = "Lexend-Medium"
    
    init(weight: Font.Weight){
        switch weight {
        case.regular:
            self = .regular
        case.bold:
            self = .bold
        case.medium:
            self = .medium
        default:
            self = .regular
        }
    }
}
