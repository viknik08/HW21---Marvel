//
//  Extension String.swift
//  HW21 - Marvel
//
//  Created by Виктор Басиев on 05.11.2022.
//

import UIKit
import CryptoKit

extension String {
    var MD5: String {
        let computed = Insecure.MD5.hash(data: self.data(using: .utf8)!)
        return computed.map { String(format: "%02hhx", $0) }.joined()
    }
    
    static func getUrlString(image: Image, variant: String) -> String {
        return "\(image.path)/\(variant).\(image.extension)"
    }
}

extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
