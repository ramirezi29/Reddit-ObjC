//
//  RedditTableViewCell.swift
//  RedditObjC
//
//  Created by Ivan Ramirez on 9/20/18.
//  Copyright © 2018 ramcomw. All rights reserved.
//

import UIKit

class RedditTableViewCell: UITableViewCell {

 
    
    @IBOutlet weak var postImageView: UIImageView!
    @IBOutlet weak var upsLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var CommentCountLabel: UILabel!
    
    //landingPad
    var post: IRPost? {
        didSet{
            updateViews()
        }
    }
    
    func updateViews(){
        guard let post = post else {return}
        titleLabel.text = post.title
        upsLabel.text = "\(post.ups)"
        CommentCountLabel.text = "\(post.commentCount)"
       
    }
}
