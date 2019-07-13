///**
/**
Unibuzz
Created by: dev shanghai on 10/07/2019

(** SideMenuCC.swift **)
Al Anbar
Copyright © 2019 Al Anbar. All rights reserved.

+-----------------------------------------------------+
|                                                     |
|                                                     |
|                                                     |
+-----------------------------------------------------+

*/

import UIKit

class SideMenuCC: UITableViewCell {

	@IBOutlet weak var imgSideMenu: UIImageView!
	@IBOutlet weak var btnSideMenu: UIButton!
	@IBOutlet weak var viewSideMenuBG: UIView!
	@IBOutlet weak var viewDivider: UIView!

	@IBOutlet weak var lblMenuTitle: UILabel!
	@IBOutlet weak var imgMenu: UIImageView!

	override func awakeFromNib() {
		super.awakeFromNib()
		// Initialization code
	}

	override func setSelected(_ selected: Bool, animated: Bool) {
		super.setSelected(selected, animated: animated)

		// Configure the view for the selected state
	}

}
