//
//  subRedditTableViewController2.swift
//  RedditObjC
//
//  Created by Ivan Ramirez on 9/20/18.
//  Copyright © 2018 ramcomw. All rights reserved.
//

import UIKit

class subRedditTableViewController: UITableViewController {
    
    @IBOutlet weak var redditSearchBar: UISearchBar!

    var posts: [IRPost]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        redditSearchBar.delegate = self
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts?.count ?? 0
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "postCell", for: indexPath) as? RedditTableViewCell
    
        let post = posts?[indexPath.row]
        if let post = post {
            IRSubredditClient.fetchImageData(forUrl: post.imageUrl) { (photo) in
                DispatchQueue.main.async {
                    cell?.postImageView.image = photo
                }
            }
        }
        cell?.post = post
        return cell ?? UITableViewCell()
    }
}


extension subRedditTableViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchTerm = searchBar.text else {return}
        IRSubredditClient.fetchAllSubReddits(forTitle: searchTerm, with: { (posts) in
            self.posts = posts
            //so the image isnt blank
            DispatchQueue.main.async {
            self.tableView.reloadData()
            print("Search Button Clicked")
        }
        })
    }
}
