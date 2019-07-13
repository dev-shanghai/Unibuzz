///**
/**
Unibuzz
Created by: dev shanghai on 13/07/2019

(** Designable.swift **)
Al Anbar
Copyright © 2019 Al Anbar. All rights reserved.

+-----------------------------------------------------+
|                                                     |
|                                                     |
|                                                     |
+-----------------------------------------------------+

*/

import UIKit


@IBDesignable
class DesignableUITextField: UITextField {

	// Provides left padding for images
	override func leftViewRect(forBounds bounds: CGRect) -> CGRect {
		var textRect = super.leftViewRect(forBounds: bounds)
		textRect.origin.x += leftPadding
		return textRect
	}

	@IBInspectable var leftImage: UIImage? {
		didSet {
			updateView()
		}
	}

	@IBInspectable var leftPadding: CGFloat = 0

	@IBInspectable var color: UIColor = UIColor.lightGray {
		didSet {
			updateView()
		}
	}

	func updateView() {
		if let image = leftImage {
			leftViewMode = UITextField.ViewMode.always
			let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
			imageView.contentMode = .scaleAspectFit
			imageView.image = image
			// Note: In order for your image to use the tint color, you have to select the image in the Assets.xcassets and change the "Render As" property to "Template Image".
			imageView.tintColor = color
			leftView = imageView
		} else {
			leftViewMode = UITextField.ViewMode.never
			leftView = nil
		}

		// Placeholder text color
		attributedPlaceholder = NSAttributedString(string: placeholder != nil ?  placeholder! : "", attributes:[NSAttributedString.Key.foregroundColor: color])
	}
}

extension UIView {

	@IBInspectable var cornerRadius: CGFloat {
		get {
			return layer.cornerRadius
		}
		set {
			layer.cornerRadius = newValue
			layer.masksToBounds = newValue > 0
		}
	}

	@IBInspectable var borderWidth: CGFloat {
		get {
			return layer.borderWidth
		}
		set {
			layer.borderWidth = newValue
		}
	}

	@IBInspectable var borderColor: UIColor {
		get {
			return UIColor(cgColor: layer.borderColor!)
		}
		set {
			layer.borderColor = newValue.cgColor
		}
	}

	@IBInspectable var makeRound: Bool {

		get {
			return false
		}
		set {

			if newValue == true {

				self.layer.cornerRadius = self.frame.size.height/2
				self.layer.masksToBounds = true
			}
		}

	}
}

/*

extension UITextField {

@IBInspectable var placeholderColor: UIColor {
get {
return attributedPlaceholder?.attribute(.foregroundColor, at: 0, effectiveRange: nil) as? UIColor ?? .clear
}
set {
guard let attributedPlaceholder = attributedPlaceholder else { return }
let attributes: [NSAttributedString.Key: UIColor] = [.foregroundColor: newValue]
self.attributedPlaceholder = NSAttributedString(string: attributedPlaceholder.string, attributes: attributes)
}
}

@IBInspectable var leftViewModeIcon: UIImage {
get {
return UIImage(named: "dropDownIcon")!
}
set {

self.leftViewMode = .always
let imageView = UIImageView();
imageView.image = newValue
self.leftView = imageView

}
}

}

*/
