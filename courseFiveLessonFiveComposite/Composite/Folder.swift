//
//  ComponentComposite.swift
//  courseFiveLessonFiveComposite
//
//  Created by Andrey Vensko on 20.04.22.
//

import Foundation
import UIKit


/// Component
class Folder: CompositeProtocol {

    var countObject: String? {
        get {
            return String(falesInTisFolder.count)
        }
    }
    var name: String
    var falesInTisFolder: [CompositeProtocol] = []

    init(name: String) {
        self.name = name
    }

    func addNewLeaf(_ name: String) {
        let newFile = File(name: name)
        falesInTisFolder.append(newFile)
    }

    func addNewFolder(_ name: String) {
        let componentComposite = Folder(name: name)
        falesInTisFolder.append(componentComposite)
    }

    func open(_ vc: UIViewController) {
        let nextVC = ViewController()
        nextVC.allFolder = self as? Folder

        vc.navigationController?.pushViewController(nextVC, animated: true)
    }
}
