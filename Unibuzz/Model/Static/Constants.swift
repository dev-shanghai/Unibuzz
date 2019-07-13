///**
/**
Unibuzz
Created by: dev shanghai on 10/07/2019

(** AppConstants.swift **)
Al Anbar
Copyright © 2019 Al Anbar. All rights reserved.

+-----------------------------------------------------+
|                                                     |
|                                                     |
|                                                     |
+-----------------------------------------------------+

*/

import UIKit

struct Colors {

	static let systemBlack      = UIColor.black
	static let DemoViewBgColor    = UIColor(hexString: "#44D9E7")
	static let NavbarBgColor    = UIColor(hexString: "#44D9E7")
	static let NavbarTintColor    = UIColor(red: 255, green: 255, blue: 255, alpha: 1.0)
	static let HomeViewBgColor    = UIColor.white

	static let blue             = UIColor(hex: 0x2F75F2)
	static let gradient         = [UIColor(hex: 0x5A92F5), blue]
	static let gray             = UIColor.gray
}


struct AppConstants {

	// MARK: - User Defaults Constants -
	let UD_userId = "user_id"
	let UD_firstName = "user_firstName"
	let UD_lastName = "user_lastName"
	let UD_fullName = "user_fullName"
	let UD_email = "user_email"
	let UD_phone = "user_phone"
	let UD_dob = "user_dob"
	let UD_gender = "user_gender"

	let uColor = UIColor(red: 0/255, green: 102/255, blue: 255/255, alpha: 1)

	// APIs base url
	static let apiBaseUrl = "http://138.68.245.84/api/v2"



	static let CORE_DATA_MODEL = "MunawlaApp"
	static let AMAZON_ITEM_RECORD_WISH_LIST = "wish_list"
	static let AMAZON_ITEM_RECORD_SHIPMENT_LIST = "shipment_list"
}

struct APIList {

	static let wallAPI          = "/user/wall"
	static let registerAPI       = "/login/registerUser/"
	static let sendConfirmationAPI       = "/Two_way_verification/sendConformationCode/"
	static let loadProfile       = "/profile/getprofiledetails/"
	static let updateProfile       = "/login/changepassword/"

	static let getItemDetailsbyASIN = "/Get_data_from_amazon/getDetailByAsian/"

}
