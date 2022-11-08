//
//  Alert.swift
//  HW21 - Marvel
//
//  Created by Виктор Басиев on 08.11.2022.
//

import UIKit

extension UIViewController {
    
    func alertOk(title: String, message: String, complition: @escaping (UIAlertAction) -> Void) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "Ok", style: .default, handler: complition)
        alert.addAction(ok)
        present(alert, animated: true,  completion: nil)
    }

}
