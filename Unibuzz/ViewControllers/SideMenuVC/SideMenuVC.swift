///**
/**
Unibuzz
Created by: dev shanghai on 10/07/2019

(** SideMenuVC.swift **)
Al Anbar
Copyright © 2019 Al Anbar. All rights reserved.

+-----------------------------------------------------+
|                                                     |
|                                                     |
|                                                     |
+-----------------------------------------------------+

*/

import UIKit
import SideMenu

class SideMenuVC: UIViewController{

	@IBOutlet weak var tbSideMenu: UITableView!

	var userMenuArray : [SideMenu]?

	override func viewDidLoad() {
		super.viewDidLoad()

		userMenuArray = [

			SideMenu(title: "Home", imgUrl: "tabBarProfileIcon"),
			SideMenu(title: "My Orders", imgUrl: "tabBarProfileIcon"),
			SideMenu(title: "Shop Now", imgUrl: "tabBarProfileIcon"),
			SideMenu(title: "My Profile", imgUrl: "tabBarProfileIcon"),
			SideMenu(title: "About Munawla", imgUrl: "tabBarProfileIcon"),
			SideMenu(title: "Let us Help You", imgUrl: "tabBarProfileIcon"),
			SideMenu(title: "Log Out", imgUrl: "tabBarProfileIcon")

		]

		let headerNib = UINib.init(nibName: "MenuHeader", bundle: Bundle.main)
		self.tbSideMenu.register(headerNib, forHeaderFooterViewReuseIdentifier: "MenuHeader")

		let cellNib = UINib.init(nibName: "MenuCell", bundle: Bundle.main)
		self.tbSideMenu.register(cellNib, forCellReuseIdentifier: "MenuCell")

	}

	override func didReceiveMemoryWarning() {

		super.didReceiveMemoryWarning()
	}

	@IBAction func didTapBack(_ sender: Any) {

		self.dismiss(animated: true, completion: nil)

	}
}

extension SideMenuVC: UITableViewDataSource, UITableViewDelegate {

	func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {

		let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "MenuHeader") as! MenuHeader


		return headerView

	}


	func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {

		return 52.0

	}

	func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {

		return 0.0001

	}

	func numberOfSections(in tableView: UITableView) -> Int {

		return 2

	}

	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
	{
		return 52.0
	}

	public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

		return userMenuArray?.count ?? 0
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

		if let menuArray = userMenuArray{

			let menu = menuArray[indexPath.row]


			let customCell = tableView.dequeueReusableCell(withIdentifier: "MenuCell") as! MenuCell
			customCell.lblCellTitle.text = menu.title



			return customCell


			/*
			if indexPath.section == 1 {



			} else {

				let cell = tableView.dequeueReusableCell(withIdentifier: "SideMenuCC") as! SideMenuCC
				cell.lblMenuTitle.text = menu.title
				//cell.imgMenu.image = UIImage(named: menu.imgUrl ?? "")

				return cell
			}
			*/


		}


		return UITableViewCell()

	}

	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

		tableView.deselectRow(at: indexPath, animated: false)

		if let menuArray = userMenuArray{

			let menu = menuArray[indexPath.row]

			if (menu.title == "Home")
			{



				self.dismiss(animated: true, completion: nil)




			}

			else if (menu.title == "My Orders") {


			}

			else if (menu.title == "Log Out") {

			}

		}
	}
}
