///**
/**
Unibuzz
Created by: dev shanghai on 10/07/2019

(** Extensions.swift **)
Al Anbar
Copyright © 2019 Al Anbar. All rights reserved.

+-----------------------------------------------------+
|                                                     |
|                                                     |
|                                                     |
+-----------------------------------------------------+

*/

import UIKit
import Foundation


// MARK: - UIColor
extension UIColor {

	convenience init(hex: Int, alpha: Double = 1.0) {
		self.init(red: CGFloat((hex>>16)&0xFF)/255.0, green: CGFloat((hex>>8)&0xFF)/255.0, blue: CGFloat((hex)&0xFF)/255.0, alpha: CGFloat(255 * alpha) / 255)
	}

	convenience init(hexString: String, alpha: Double = 1.0) {
		let hex = hexString.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
		var int = UInt32()
		Scanner(string: hex).scanHexInt32(&int)
		let r, g, b: UInt32
		switch hex.count {
		case 3: // RGB (12-bit)
			(r, g, b) = ((int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
		case 6: // RGB (24-bit)
			(r, g, b) = (int >> 16, int >> 8 & 0xFF, int & 0xFF)
		default:
			(r, g, b) = (1, 1, 0)
		}
		self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(255 * alpha) / 255)
	}

}


// MARK: - UIApplication
extension UIApplication {

	class func topViewController(_ viewController: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
		if let nav = viewController as? UINavigationController {
			return topViewController(nav.visibleViewController)
		}
		if let tab = viewController as? UITabBarController {
			if let selected = tab.selectedViewController {
				return topViewController(selected)
			}
		}
		if let presented = viewController?.presentedViewController {
			return topViewController(presented)
		}

		return viewController
	}
}
