///**
/**
Unibuzz
Created by: dev shanghai on 10/07/2019

(** menuDC.swift **)
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
struct menuDC : Codable {

	let menu : [Menu]?
	let sideMenu : [SideMenu]?
}

struct Menu : Codable {

	var title : String?
	var imgUrl : String?
	var txtColor : String?
}

struct SideMenu : Codable {

	var title : String?
	var imgUrl : String?

}
