///**
/**
UniversityBuzz
Created by: dev shanghai on 10/07/2019

(** homeDC.swift **)
dev shanghai
Copyright © 2019 dev shanghai. All rights reserved.

+-----------------------------------------------------+
|                                                     |
|                                                     |
|                                                     |
+-----------------------------------------------------+

*/

import Foundation
struct UserWall : Codable {
	let status : Bool?
	let message : String?
	let data : WallData?

	enum CodingKeys: String, CodingKey {

		case status = "status"
		case message = "message"
		case data = "data"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		status = try values.decodeIfPresent(Bool.self, forKey: .status)
		message = try values.decodeIfPresent(String.self, forKey: .message)
		data = try values.decodeIfPresent(WallData.self, forKey: .data)
	}

}


struct WallData : Codable {
	let posts : Posts?
	let groups : [Groups]?

	enum CodingKeys: String, CodingKey {

		case posts = "posts"
		case groups = "groups"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		posts = try values.decodeIfPresent(Posts.self, forKey: .posts)
		groups = try values.decodeIfPresent([Groups].self, forKey: .groups)
	}

}

struct Posts : Codable {

	let current_page : Int?
	let data : [PostData]?
	let first_page_url : String?
	let from : Int?
	let last_page : Int?
	let last_page_url : String?
	let next_page_url : String?
	let path : String?
	let per_page : Int?
	let prev_page_url : String?
	let to : Int?
	let total : Int?

	enum CodingKeys: String, CodingKey {

		case current_page = "current_page"
		case data = "data"
		case first_page_url = "first_page_url"
		case from = "from"
		case last_page = "last_page"
		case last_page_url = "last_page_url"
		case next_page_url = "next_page_url"
		case path = "path"
		case per_page = "per_page"
		case prev_page_url = "prev_page_url"
		case to = "to"
		case total = "total"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		current_page = try values.decodeIfPresent(Int.self, forKey: .current_page)
		data = try values.decodeIfPresent([PostData].self, forKey: .data)
		first_page_url = try values.decodeIfPresent(String.self, forKey: .first_page_url)
		from = try values.decodeIfPresent(Int.self, forKey: .from)
		last_page = try values.decodeIfPresent(Int.self, forKey: .last_page)
		last_page_url = try values.decodeIfPresent(String.self, forKey: .last_page_url)
		next_page_url = try values.decodeIfPresent(String.self, forKey: .next_page_url)
		path = try values.decodeIfPresent(String.self, forKey: .path)
		per_page = try values.decodeIfPresent(Int.self, forKey: .per_page)
		prev_page_url = try values.decodeIfPresent(String.self, forKey: .prev_page_url)
		to = try values.decodeIfPresent(Int.self, forKey: .to)
		total = try values.decodeIfPresent(Int.self, forKey: .total)
	}

}

struct PostData : Codable {

	let id : Int?
	let user_id : Int?
	let user_as : Int?
	let student_group_id : Int?
	let parent_id : Int?
	let slug : String?
	let comment : String?
	let status : Int?
	let is_delete : Int?
	let announcement : Int?
	let end_date : String?
	let is_read : Int?
	let allow_comment : Int?
	let created_at : String?
	let updated_at : String?
	let post_like_count : Int?
	let post_dislike_count : Int?
	let post_laugh_count : Int?
	let post_angry_count : Int?
	let is_favorite : Bool?
	let user_reaction : Int?
	let post_group_name : String?
	let is_poll : Bool?
	let total_poll_votes : Int?
	let total_comments : Int?



	let is_voted : Bool?
	let user : User?
	let post_options : [Post_options]?

	enum CodingKeys: String, CodingKey {

		case id = "id"
		case user_id = "user_id"
		case user_as = "user_as"
		case student_group_id = "student_group_id"
		case parent_id = "parent_id"
		case slug = "slug"
		case comment = "comment"
		case status = "status"
		case is_delete = "is_delete"
		case announcement = "announcement"
		case end_date = "end_date"
		case is_read = "is_read"
		case allow_comment = "allow_comment"
		case created_at = "created_at"
		case updated_at = "updated_at"
		case post_like_count = "post_like_count"
		case post_dislike_count = "post_dislike_count"
		case post_laugh_count = "post_laugh_count"
		case post_angry_count = "post_angry_count"
		case is_favorite = "is_favorite"
		case user_reaction = "user_reaction"
		case post_group_name = "post_group_name"
		case is_poll = "is_poll"
		case total_poll_votes = "total_poll_votes"
		case total_comments = "total_comments"
		case is_voted = "is_voted"
		case user = "user"
		case post_options = "post_options"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		id = try values.decodeIfPresent(Int.self, forKey: .id)
		user_id = try values.decodeIfPresent(Int.self, forKey: .user_id)
		user_as = try values.decodeIfPresent(Int.self, forKey: .user_as)
		student_group_id = try values.decodeIfPresent(Int.self, forKey: .student_group_id)
		parent_id = try values.decodeIfPresent(Int.self, forKey: .parent_id)
		slug = try values.decodeIfPresent(String.self, forKey: .slug)
		comment = try values.decodeIfPresent(String.self, forKey: .comment)
		status = try values.decodeIfPresent(Int.self, forKey: .status)
		is_delete = try values.decodeIfPresent(Int.self, forKey: .is_delete)
		announcement = try values.decodeIfPresent(Int.self, forKey: .announcement)
		end_date = try values.decodeIfPresent(String.self, forKey: .end_date)
		is_read = try values.decodeIfPresent(Int.self, forKey: .is_read)
		allow_comment = try values.decodeIfPresent(Int.self, forKey: .allow_comment)
		created_at = try values.decodeIfPresent(String.self, forKey: .created_at)
		updated_at = try values.decodeIfPresent(String.self, forKey: .updated_at)
		post_like_count = try values.decodeIfPresent(Int.self, forKey: .post_like_count)
		post_dislike_count = try values.decodeIfPresent(Int.self, forKey: .post_dislike_count)
		post_laugh_count = try values.decodeIfPresent(Int.self, forKey: .post_laugh_count)
		post_angry_count = try values.decodeIfPresent(Int.self, forKey: .post_angry_count)
		is_favorite = try values.decodeIfPresent(Bool.self, forKey: .is_favorite)
		user_reaction = try values.decodeIfPresent(Int.self, forKey: .user_reaction)
		post_group_name = try values.decodeIfPresent(String.self, forKey: .post_group_name)
		is_poll = try values.decodeIfPresent(Bool.self, forKey: .is_poll)
		total_poll_votes = try values.decodeIfPresent(Int.self, forKey: .total_poll_votes)
		total_comments = try values.decodeIfPresent(Int.self, forKey: .total_comments)
		is_voted = try values.decodeIfPresent(Bool.self, forKey: .is_voted)
		user = try values.decodeIfPresent(User.self, forKey: .user)
		post_options = try values.decodeIfPresent([Post_options].self, forKey: .post_options)
	}

}


struct Groups : Codable {
	let id : Int?
	let name : String?
	let user_id : Int?
	let barcode : String?

	enum CodingKeys: String, CodingKey {

		case id = "id"
		case name = "name"
		case user_id = "user_id"
		case barcode = "barcode"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		id = try values.decodeIfPresent(Int.self, forKey: .id)
		name = try values.decodeIfPresent(String.self, forKey: .name)
		user_id = try values.decodeIfPresent(Int.self, forKey: .user_id)
		barcode = try values.decodeIfPresent(String.self, forKey: .barcode)
	}

}

struct My_vote : Codable {
	let post_option_id : Int?

	enum CodingKeys: String, CodingKey {

		case post_option_id = "post_option_id"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		post_option_id = try values.decodeIfPresent(Int.self, forKey: .post_option_id)
	}

}

struct Post_options : Codable {
	let id : Int?
	let post_id : Int?
	let name : String?
	let status : Int?
	let created_at : String?
	let updated_at : String?
	let post_votes_count : Int?
	let my_vote : My_vote?

	enum CodingKeys: String, CodingKey {

		case id = "id"
		case post_id = "post_id"
		case name = "name"
		case status = "status"
		case created_at = "created_at"
		case updated_at = "updated_at"
		case post_votes_count = "post_votes_count"
		case my_vote = "my_vote"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		id = try values.decodeIfPresent(Int.self, forKey: .id)
		post_id = try values.decodeIfPresent(Int.self, forKey: .post_id)
		name = try values.decodeIfPresent(String.self, forKey: .name)
		status = try values.decodeIfPresent(Int.self, forKey: .status)
		created_at = try values.decodeIfPresent(String.self, forKey: .created_at)
		updated_at = try values.decodeIfPresent(String.self, forKey: .updated_at)
		post_votes_count = try values.decodeIfPresent(Int.self, forKey: .post_votes_count)
		my_vote = try values.decodeIfPresent(My_vote.self, forKey: .my_vote)
	}

}

struct User : Codable {
	let id : Int?
	let first_name : String?
	let last_name : String?
	let email : String?
	let profile_picture : Int?
	let allow_user : String?
	let full_name : String?
	let profile_image : String?

	enum CodingKeys: String, CodingKey {

		case id = "id"
		case first_name = "first_name"
		case last_name = "last_name"
		case email = "email"
		case profile_picture = "profile_picture"
		case allow_user = "allow_user"
		case full_name = "full_name"
		case profile_image = "profile_image"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		id = try values.decodeIfPresent(Int.self, forKey: .id)
		first_name = try values.decodeIfPresent(String.self, forKey: .first_name)
		last_name = try values.decodeIfPresent(String.self, forKey: .last_name)
		email = try values.decodeIfPresent(String.self, forKey: .email)
		profile_picture = try values.decodeIfPresent(Int.self, forKey: .profile_picture)
		allow_user = try values.decodeIfPresent(String.self, forKey: .allow_user)
		full_name = try values.decodeIfPresent(String.self, forKey: .full_name)
		profile_image = try values.decodeIfPresent(String.self, forKey: .profile_image)
	}

}

