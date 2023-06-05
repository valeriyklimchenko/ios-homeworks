//
//  extentionUIColor.swift
//  Navigation
//
//  Created by Валерий Климченко on 05.06.2023.
//

import UIKit

//extension UIColor {
//    func setupColor() -> UIColor {
//        let accentColor = #colorLiteral(red: 0.3456393778, green: 0.5991438031, blue: 0.8382619619, alpha: 1)
//        return accentColor
//    }
//}

enum AssetsColor {
   case yellow
   case black
   case blue
   case gray
   case green
   case lightGray
   case separatorColor
   case red
}

extension UIColor {

    static func appColor(_ name: AssetsColor) -> UIColor? {
        switch name {
        case .yellow:
            return UIColor(named: "appYellow")
        case .black:
            return UIColor(named: "appBlack")
        case .blue:
            return UIColor(named: "appBlue")
        case .gray:
            return UIColor(named: "appGray")
        case .lightGray:
            return UIColor(named: "appLightGray")
        case .red:
            return UIColor(named: "appRed")
        case .separatorColor:
            return UIColor(named: "appSeparatorColor")
        case .green:
            return UIColor(named: "appGreen")
        }
    }
}
