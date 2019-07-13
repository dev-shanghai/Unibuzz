///**
/**
Unibuzz
Created by: dev shanghai on 10/07/2019

(** HomeCC.swift **)
Al Anbar
Copyright © 2019 Al Anbar. All rights reserved.

+-----------------------------------------------------+
|                                                     |
|                                                     |
|                                                     |
+-----------------------------------------------------+

*/

import UIKit
import FaveButton

class discoverTableViewCell: UITableViewCell {

	@IBOutlet weak var suggestion_Lbl: UILabel!
	@IBOutlet weak var deleteBtn: UIButton!
	@IBOutlet weak var likesLbl: UILabel!
	@IBOutlet weak var winner_gray: UIImageView!
	@IBOutlet weak var postDateLbl: UILabel!
	@IBOutlet weak var usernameLbl: UILabel!
	@IBOutlet weak var userImage: UIImageView!
	@IBOutlet weak var likeBtn: FaveButton!
	/*
	@IBOutlet weak var sharesLbl: UILabel!
	@IBOutlet weak var commentsLbl: UILabel!
	*/
	@IBOutlet weak var shareBtn: UIButton!
	@IBOutlet weak var commentBtn: UIButton!
	@IBOutlet weak var commentUserNameBtn: UIButton!
	@IBOutlet weak var readMoreBtn: UIButton!
	@IBOutlet weak var playBtn: UIButton!
	@IBOutlet weak var commentTimeLbl: UILabel!
	@IBOutlet weak var commentsUsernameLbl: UILabel!
	@IBOutlet weak var commentsUserImage: UIImageView!
	@IBOutlet weak var postImage: UIImageView!
	@IBOutlet weak var postDetailsBtn: UIButton!
	@IBOutlet weak var postLikeUserBtn: UIButton!
	@IBOutlet weak var readMoreBtnHeight: NSLayoutConstraint!
	@IBOutlet weak var postImageHeight_constraint: NSLayoutConstraint!

	@IBOutlet weak var btnTrophy: FaveButton!
	@IBOutlet weak var likeBtn2: UIButton!
	@IBOutlet weak var imgviewGif: UIImageView!
	@IBOutlet weak var desc_lbl: ActiveLabel!

	@IBOutlet weak var userName_btn: UIButton!

	@IBOutlet weak var post_view: UIView!

	@IBOutlet weak var ad_view: UIView!

	@IBOutlet weak var ad_img: UIImageView!

	@IBOutlet weak var adPlay_btn: UIButton!

	@IBOutlet weak var adImageHeight_constraint: NSLayoutConstraint!

	@IBOutlet weak var comentDescActive_lbl: ActiveLabel!

	@IBOutlet weak var AdDescp_lbl: UILabel!

	@IBOutlet weak var adView_btn: UIButton!

	//AdMob

	@IBOutlet weak var AdMob_view: UIView!

	@IBOutlet weak var AdmobLogo_img: UIImageView!

	@IBOutlet weak var AdMobHeadline_lbl: UILabel!

	@IBOutlet weak var AdmobTitle_lbl: UILabel!

	@IBOutlet weak var AdMobImageView_view: UIView!

	@IBOutlet weak var AdmobImage_img: UIImageView!

	@IBOutlet weak var adMobImageHeight_constraint: NSLayoutConstraint!

	@IBOutlet weak var AdMobDesc_lbl: UILabel!

	@IBOutlet weak var AdMobView_btn: UIButton!

	override func awakeFromNib() {

		super.awakeFromNib()

		comentDescActive_lbl?.customize { label in
			label.textColor = Colors.gray
			label.hashtagColor = Colors.blue
			label.mentionColor = Colors.blue
			label.URLColor = Colors.blue
		}

		desc_lbl?.customize { label in
			label.textColor = Colors.gray
			label.hashtagColor = Colors.blue
			label.mentionColor = Colors.blue
			label.URLColor = Colors.blue
		}

	}

	override func prepareForReuse() {
		super.prepareForReuse()

		btnTrophy?.isHidden = true

	}

	override func setSelected(_ selected: Bool, animated: Bool) {
		super.setSelected(selected, animated: animated)

		// Configure the view for the selected state
	}
}

