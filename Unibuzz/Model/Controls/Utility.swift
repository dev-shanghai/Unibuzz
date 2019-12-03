///**
/**
UniversityBuzz
Created by: dev shanghai on 10/07/2019

(** Utility.swift **)
dev shanghai
Copyright © 2019 dev shanghai. All rights reserved.

+-----------------------------------------------------+
|                                                     |
|                                                     |
|                                                     |
+-----------------------------------------------------+

*/


import Foundation
import UIKit
import ESTabBarController_swift

class Utility {

	static var appDelegate : AppDelegate {
		return (UIApplication.shared.delegate as? AppDelegate)!
	}

	class func removeNullFromJSONData(_ JSONData: Any) -> Any {
		if JSONData as? NSNull != nil {
			return JSONData
		}

		var JSONObject: Any!

		if JSONData as? NSData != nil {
			JSONObject = try! JSONSerialization.data(withJSONObject: JSONData, options: JSONSerialization.WritingOptions.prettyPrinted)
		}
		else {
			JSONObject = JSONData
		}

		if JSONObject as? NSArray != nil {
			let mutableArray: NSMutableArray = NSMutableArray(array: JSONObject as! [Any], copyItems: true)
			let indexesToRemove: NSMutableIndexSet = NSMutableIndexSet()

			for index in 0 ..< mutableArray.count {
				let indexObject: Any = mutableArray[index]

				if indexObject as? NSNull != nil {
					indexesToRemove.add(index)
				}
				else {
					mutableArray.replaceObject(at: index, with: removeNullFromJSONData(indexObject))
				}
			}

			mutableArray.removeObjects(at: indexesToRemove as IndexSet)

			return mutableArray;
		}
		else if JSONObject as? NSDictionary != nil {
			let mutableDictionary: NSMutableDictionary = NSMutableDictionary(dictionary: JSONObject as! [AnyHashable : Any], copyItems: true)

			for key in mutableDictionary.allKeys {
				let indexObject: Any = mutableDictionary[key] as Any

				if indexObject as? NSNull != nil {
					mutableDictionary.removeObject(forKey: key)
				}
				else {
					mutableDictionary.setObject(removeNullFromJSONData(indexObject), forKey: key as! NSCopying)
				}
			}

			return mutableDictionary
		}
		else {
			return JSONObject ?? 0
		}
	}


	static func showAlert(title:String = "UniversityBuzz", message:String, buttonTitles:[String], completion: @escaping (_ responce: String) -> Void) {

		let alertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)

		let attributes = [NSAttributedString.Key.font:UIFont(name: "Dubai-Light", size: 16.0)!]

		let attributedString = NSMutableAttributedString(string: title)
		attributedString.addAttributes(attributes, range:NSMakeRange(0, attributedString.length))

		alertController.setValue(attributedString, forKey: "attributedTitle")

		// Change Message Font:
		var messageMutableString = NSMutableAttributedString()
		messageMutableString = NSMutableAttributedString(string: message as String, attributes: [NSAttributedString.Key.font:UIFont(name: "Dubai-Regular", size: 14.0)!])

		// Change Message Color:

		messageMutableString.addAttribute(NSAttributedString.Key.foregroundColor, value: Colors.systemBlack, range: NSRange(location:0,length:message.count))

		alertController.setValue(messageMutableString, forKey: "attributedMessage")


		// Actions.
		for btnTitle in buttonTitles{

			let action = UIAlertAction(title: btnTitle, style: UIAlertAction.Style.default, handler: { action in
				completion(btnTitle)

			})
			if btnTitle == "Cancel"{
				action.setValue(Colors.systemBlack, forKey: "titleTextColor")
			}

			alertController.addAction(action)
		}

		UIApplication.topViewController()?.present(alertController, animated: true, completion: nil)
	}



	// MARK: - TabBar
	static func systemStyle() -> UITabBarController {

		let tabBarController = UITabBarController()

		let homeVC = UINavigationController(rootViewController: HomeVC.instantiate(fromAppStoryboard: .Main))
		let myShipmentsVC = UINavigationController(rootViewController: HomeVC.instantiate(fromAppStoryboard: .Main))
		let shopNowVC = UINavigationController(rootViewController: HomeVC.instantiate(fromAppStoryboard: .Main))
		let profileVC = UINavigationController(rootViewController: HomeVC.instantiate(fromAppStoryboard: .Main))
		let helpVC = UINavigationController(rootViewController: HomeVC.instantiate(fromAppStoryboard: .Main))


		homeVC.navigationBar.isHidden = true
		myShipmentsVC.navigationBar.isHidden = true
		shopNowVC.navigationBar.isHidden = true
		profileVC.navigationBar.isHidden = true
		helpVC.navigationBar.isHidden = true

		homeVC.tabBarItem = UITabBarItem.init(title: "Home", image: UIImage(named: "home"), selectedImage: UIImage(named: "home_1"))
		myShipmentsVC.tabBarItem = UITabBarItem.init(title: "My Shipments", image: UIImage(named: "find"), selectedImage: UIImage(named: "find_1"))
		shopNowVC.tabBarItem = UITabBarItem.init(title: "Shop Now", image: UIImage(named: "find"), selectedImage: UIImage(named: "find_1"))
		profileVC.tabBarItem = UITabBarItem.init(title: "Profile", image: UIImage(named: "find"), selectedImage: UIImage(named: "find_1"))
		helpVC.tabBarItem = UITabBarItem.init(title: "Help", image: UIImage(named: "find"), selectedImage: UIImage(named: "find_1"))

		tabBarController.tabBar.shadowImage = nil

		tabBarController.viewControllers = [homeVC, myShipmentsVC, shopNowVC, profileVC, helpVC]

		return tabBarController
	}

}

