///**
/**
UniversityBuzz
Created by: dev shanghai on 10/07/2019

(** HomeCC.swift **)
dev shanghai
Copyright © 2019 dev shanghai. All rights reserved.

+-----------------------------------------------------+
|                                                     |
|                                                     |
|                                                     |
+-----------------------------------------------------+

*/

import UIKit

class HomeCC: UITableViewCell {

	@IBOutlet weak var lblPostCreator: UILabel!
	@IBOutlet weak var lblUniversityName: UILabel!
	@IBOutlet weak var lblPostTime: UILabel!
	@IBOutlet weak var lblPostText: ActiveLabel!
	@IBOutlet weak var btnReadmore: UIButton!
	
	
	override func awakeFromNib() {
		super.awakeFromNib()
		// Initialization code
	}

	override func setSelected(_ selected: Bool, animated: Bool) {
		super.setSelected(selected, animated: animated)

		// Configure the view for the selected state
	}

}
