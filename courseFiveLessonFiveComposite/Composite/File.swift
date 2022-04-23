//
//  Leaf.swift
//  courseFiveLessonFiveComposite
//
//  Created by Andrey Vensko on 20.04.22.
//

import Foundation
import UIKit

/// leaf
class File: CompositeProtocol {
    var countObject: String?
    var name: String
    var extensionName = ".leaf"

    init(name: String) {
        self.name = name
    }

    func open(_ vc: UIViewController) {
        print("\(name)\(extensionName)")
    }
}
