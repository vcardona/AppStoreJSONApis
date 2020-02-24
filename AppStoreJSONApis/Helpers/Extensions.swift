//
//  Extensions.swift
//  AppStoreJSONApis
//
//  Created by Victor Hugo on 3/02/20.
//  Copyright © 2020 Vintage Robot. All rights reserved.
//

import UIKit

extension UILabel {
    convenience init(text: String, font: UIFont, numberOfLines: Int = 1 )
    {
        self.init(frame: .zero)
        self.text = text
        self.font = font
        self.numberOfLines = numberOfLines
    }
}

