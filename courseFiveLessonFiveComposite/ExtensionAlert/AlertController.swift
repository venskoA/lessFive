//
//  AlertController.swift
//  courseFiveLessonFiveComposite
//
//  Created by Andrey Vensko on 20.04.22.
//

import Foundation
import UIKit

class AlertController {
    func actionAllert(vc: UIViewController, clousere: ((String) -> ())?) {
        let alert = UIAlertController(title: "Enter name", message: "", preferredStyle: .alert)
        let alertOK = UIAlertAction(title: "OK", style: .default) { text in
            let name = alert.textFields?[0].text ?? ""
            clousere?(name)
        }

        alert.addTextField { (text) in
            text.placeholder = "  enter"
        }
        alert.addAction(alertOK)
        vc.present(alert, animated: true, completion: nil)
    }
}
