///**
/**
Unibuzz
Created by: dev shanghai on 10/07/2019

(** StoryBoard.swift **)
Al Anbar
Copyright © 2019 Al Anbar. All rights reserved.

+-----------------------------------------------------+
|                                                     |
|                                                     |
|                                                     |
+-----------------------------------------------------+

*/

import Foundation
import  UIKit

extension UIViewController {

	class var storyboardID : String {
		return "\(self)"
	}
	static func instantiate(fromAppStoryboard appStoryboard: AppStoryboard) -> Self {
		return appStoryboard.viewController(viewControllerClass: self)
	}
}

enum AppStoryboard : String {

	case Main,LoginRegistration
	var instance : UIStoryboard {
		return UIStoryboard(name: self.rawValue, bundle: Bundle.main)
	}



	func viewController<T : UIViewController>(viewControllerClass : T.Type) -> T {

		let storyboardID = (viewControllerClass as UIViewController.Type).storyboardID
		print("SI")
		guard let scene = instance.instantiateViewController(withIdentifier: storyboardID) as? T else {
			fatalError("ViewController with identifier \(storyboardID), not found in \(self.rawValue) Storyboard")
		}

		return scene
	}
	func initialViewController() -> UIViewController? {
		return instance.instantiateInitialViewController()
	}
}
