//
//  CompositeProtocol.swift
//  courseFiveLessonFiveComposite
//
//  Created by Andrey Vensko on 20.04.22.
//

import Foundation
import UIKit


/// protocol Composite
/// The composite pattern describes a group of objects that are treated the same way as a single instance of the same type of object
protocol CompositeProtocol{
    var name: String { get }
    var countObject: String? { get }
   
    func open(_ vc: UIViewController)
}
