///**
/**
Unibuzz
Created by: dev shanghai on 10/07/2019

(** HomeVC.swift **)
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
import SVProgressHUD
import SDWebImage

class HomeVC : UIViewController {

	@IBOutlet weak var tbWallPosts: UITableView!
	@IBOutlet weak var topSearchbar: UISearchBar!

	// Constraints
	@IBOutlet weak var constrSearchbarRightside: NSLayoutConstraint!



	var wallData : WallData?

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.


		self .setupSideMenu()
		//self .performWSToLoadItemWallPosts(params: ["" : "" as AnyObject])

		// Cell registration from the nib
		let cellNib = UINib.init(nibName: "HomeCC", bundle: Bundle.main)
		self.tbWallPosts.register(cellNib, forCellReuseIdentifier: "HomeCC")

		let cancelButtonAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
		UIBarButtonItem.appearance().setTitleTextAttributes(cancelButtonAttributes , for: .normal)
		self.topSearchbar.delegate = self

	}



	// MARK: - sideMenu Setup
	func setupSideMenu() {

		SideMenuManager.default.menuWidth = self.view.frame.size.width - self.view.frame.size.width/4
		SideMenuManager.default.menuPresentMode = .menuSlideIn
		SideMenuManager.default.menuAnimationPresentDuration = 0.5
		SideMenuManager.default.menuAnimationDismissDuration = 0.5
		SideMenuManager.default.menuShadowColor  = UIColor.darkGray
		SideMenuManager.default.menuAnimationFadeStrength = 0.5
		SideMenuManager.default.menuAnimationBackgroundColor = UIColor.clear

	}

	// MARK: - ib outlets
	@IBAction func didTapSideMenu(_ sender: Any) {

		let LeftMenu = self.storyboard?.instantiateViewController(withIdentifier: "LeftMenuNavigationController") as! UISideMenuNavigationController
		self.present(LeftMenu, animated: true, completion: nil)

	}


}




// MARK: - Web-Services
extension HomeVC {


	func performWSToLoadItemWallPosts(params : [String : AnyObject]) {

		if !(SharedManager.MySharedInstance.isConnectedToNetwork()){

			Utility.showAlert(message: "Check your internet Connection and try again.", buttonTitles: ["OK"], completion :{ response in})
			return
		}

		SVProgressHUD.show()

		WebServices.URLResponse(APIList.wallAPI, method: .get, parameters: nil, headers:nil, withSuccess: { (response) in




			do {

				let FULLResponse = try
					JSONDecoder().decode(UserWall.self, from: response)


				let status = FULLResponse.status

				if status == true {

					self.wallData = FULLResponse.data
					self.tbWallPosts.reloadData()

				} else {

				}

				SVProgressHUD.dismiss()

			} catch let jsonerror{

				print("error parsing json objects",jsonerror)
				do{
					let errorResponse = try JSONDecoder().decode(UserWall.self, from: response)

					let errorMessage = errorResponse.message

					Utility.showAlert(message: errorMessage ?? "Error in Api response.", buttonTitles: ["OK"], completion :{ response in})

					SVProgressHUD.dismiss()

				}catch let jsonerror{

					print("error parsing json objects",jsonerror)
					SVProgressHUD.dismiss()
				}
			}

		}){ (error) in

			SVProgressHUD.dismiss()
		}
	}


}

extension HomeVC : UITableViewDelegate , UITableViewDataSource {

	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

		return 3 //self.wallData?.posts?.data?.count ?? 0

	}

	func numberOfSections(in tableView: UITableView) -> Int {

		return 1
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

		let customCell = tableView.dequeueReusableCell(withIdentifier: "HomeCC") as! HomeCC

		customCell.lblPostCreator.text = "Asim Khan "
		customCell.lblPostTime.text = "01:23 pm"
		customCell.lblUniversityName.text = "University of Sharjah"
		customCell.lblPostText.text = "Hi this is Asim \nI would like to sale my iPhone 7."

		customCell.btnReadmore.tag = indexPath.row
		customCell.btnReadmore.addTarget(self, action: #selector(didTapReadMoreButton(sender:)), for: UIControl.Event.touchUpInside)

		/*
		cell?.postDateLbl.text = self.wallData?.posts?.data?[indexPath.row].end_date ?? ""

		if let imgURL = URL(string: self.wallData?.posts?.data?[indexPath.row].user?.profile_image ?? "") {


			cell?.userImage?.sd_setImage(with: imgURL, placeholderImage: nil, options: [], completed: nil)
		}
		*/


		return customCell

	}

	@objc func didTapReadMoreButton(sender: UIButton) {



	}

	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

		return 300.0
	}





}



extension HomeVC : UISearchBarDelegate {

	func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {

		searchBar.setShowsCancelButton(true, animated: true)

		UIView.animate(withDuration: 0.6, delay: 0.1, options:UIView.AnimationOptions.curveEaseOut ,animations: {

			self.constrSearchbarRightside.constant = 0.0
			self.view.layoutIfNeeded()

		}) { (status) in


		}

	}

	func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {

		searchBar.setShowsCancelButton(false, animated: true)
		UIView.animate(withDuration: 0.6, delay: 0.1, options:UIView.AnimationOptions.curveEaseIn ,animations: {

			self.constrSearchbarRightside.constant = 70.0
			self.view.layoutIfNeeded()

		}) { (status) in


		}

	}

	func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {

		self.view.endEditing(true)

	}



}
