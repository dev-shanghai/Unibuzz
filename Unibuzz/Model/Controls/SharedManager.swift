///**
/**
UniversityBuzz
Created by: dev shanghai on 10/07/2019

(** SharedManager.swift **)
dev shanghai
Copyright © 2019 dev shanghai. All rights reserved.

+-----------------------------------------------------+
|                                                     |
|                                                     |
|                                                     |
+-----------------------------------------------------+

*/


import UIKit
import SystemConfiguration

class SharedManager {

	static let MySharedInstance = SharedManager()

	var validation = Validation()

	/*
	func saveUserToNSUserDeafult(user:userData) {

		UserDefaults.standard.set(user.user?.name, forKey: Constants().UD_fullName)
		UserDefaults.standard.set(user.user?.first_name, forKey: Constants().UD_firstName)
		UserDefaults.standard.set(user.user?.last_name, forKey: Constants().UD_lastName)
		UserDefaults.standard.set(user.user?.email, forKey: Constants().UD_email)
		UserDefaults.standard.set(user.user?.phone, forKey: Constants().UD_phone)

	}
	*/

	func isConnectedToNetwork() -> Bool {

		var zeroAddress = sockaddr_in(sin_len: 0, sin_family: 0, sin_port: 0, sin_addr: in_addr(s_addr: 0), sin_zero: (0, 0, 0, 0, 0, 0, 0, 0))
		zeroAddress.sin_len = UInt8(MemoryLayout.size(ofValue: zeroAddress))
		zeroAddress.sin_family = sa_family_t(AF_INET)

		let defaultRouteReachability = withUnsafePointer(to: &zeroAddress) {
			$0.withMemoryRebound(to: sockaddr.self, capacity: 1) {zeroSockAddress in
				SCNetworkReachabilityCreateWithAddress(nil, zeroSockAddress)
			}
		}

		var flags: SCNetworkReachabilityFlags = SCNetworkReachabilityFlags(rawValue: 0)
		if SCNetworkReachabilityGetFlags(defaultRouteReachability!, &flags) == false {
			return false
		}

		// Working for Cellular and WIFI
		let isReachable = (flags.rawValue & UInt32(kSCNetworkFlagsReachable)) != 0
		let needsConnection = (flags.rawValue & UInt32(kSCNetworkFlagsConnectionRequired)) != 0
		let ret = (isReachable && !needsConnection)

		return ret
	}

	// MARK: - alertView
	/*
	func showAlertView(title:NSString) {

	let alert = UIAlertController(title: "MunawlaApp", message: title as String, preferredStyle: UIAlertController.Style.alert)
	alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
	present(alert, animated: true, completion: nil)
	}
	*/



}



extension SharedManager {

	// LogIn
	func logout() {
		UserDefaults.standard.removeObject(forKey: "isLoggedin")
		UserDefaults.standard.removeObject(forKey: "userId")
	}

	func login(userID : String) {
		UserDefaults.standard.setValue(true, forKey: "isLoggedin")
		UserDefaults.standard.setValue(userID, forKey: "userId")
	}

	func isUserLoggedin() -> Bool {

		if let data = UserDefaults.standard.value(forKey: "isLoggedin") as? Bool {

			return data
		} else { return false }
	}

	// Demo
	func isdemoCompleted() -> Bool {

		if let data = UserDefaults.standard.value(forKey: "demoCompleted") as? Bool {

			return data
		} else { return false }
	}

	func setdemoCompleted() {

		UserDefaults.standard.setValue(true, forKey: "demoCompleted")

	}

	// Remember User
	func setRememberUser(email : String, password: String) {

		UserDefaults.standard.setValue(email, forKey: "userEmail")
		UserDefaults.standard.setValue(password, forKey: "userPassword")
	}

	func removeRememberUser() {

		UserDefaults.standard.setValue(nil, forKey: "userEmail")
		UserDefaults.standard.setValue(nil, forKey: "userPassword")
	}

	func checkRememberUser() -> [String : String]? {

		if let userEmail = UserDefaults.standard.value(forKey: "userEmail") as? String,
			let userPassword = UserDefaults.standard.value(forKey: "userPassword") as? String
		{

			return ["email" : userEmail, "password" : userPassword]

		} else { return nil }
	}

	func checkAndUpdateUserPassword(password : String) {

		if SharedManager.MySharedInstance.checkRememberUser() != nil {

			UserDefaults.standard.setValue(password, forKey: "userPassword")

		}
	}

	func setPhoneNumber(phoneNumber : String) {

		UserDefaults.standard.setValue(phoneNumber, forKey: "userPhoneNumber")
	}

	func getPhoneNumber() -> String? {

		if let userPhoneNumber = (UserDefaults.standard.value(forKey: "userPhoneNumber") as? String) {

			return userPhoneNumber
		} else { return nil }

	}

	func setVerificationCode(VerificationCode : String) {

		UserDefaults.standard.setValue(VerificationCode, forKey: "userVerificationCode")
	}

	func getVerificationCode() -> String? {

		if let userVerificationCode = (UserDefaults.standard.value(forKey: "userVerificationCode") as? String) {

			return userVerificationCode
		} else { return nil }

	}

	func getUserId() -> String? {

		if let userID = (UserDefaults.standard.value(forKey: "userId") as? String) {

			return userID
		} else { return nil }

	}

	func getCurrentAppLanguage() -> String {

		if let appLanguage = (UserDefaults.standard.value(forKey: "appLanguage") as? String) {

			return appLanguage
		} else { return "" }

	}

	func setCurrentAppLanguage(language : String) {

		UserDefaults.standard.setValue(language, forKey: "appLanguage")
	}


	func getDefaultCountryDetails() -> [String : String]? {

		if let countryCode = (UserDefaults.standard.value(forKey: "countryCode") as? String),
			let countryLocale = (UserDefaults.standard.value(forKey: "countryLocale") as? String) {

			return ["code" : countryCode, "locale" : countryLocale]

		} else { return nil }

	}

	func setDefaultCountryDetails(code : String, locale : String) {

		UserDefaults.standard.setValue(code, forKey: "countryCode")
		UserDefaults.standard.setValue(locale, forKey: "countryLocale")

	}


}
