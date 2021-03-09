//
//  FeedViewController.swift
//  FeedPrototype
//
//  Created by Shilpa Bansal on 06/03/21.
//

import Foundation
import UIKit

struct FeedImageViewModel {
    let description: String?
    let location: String?
    let imageName: String
}

class FeedViewController: UITableViewController {
    var feeds = [FeedImageViewModel]()
        
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        refresh()
        
        let offsetPoint = CGPoint.init(x: 0, y: -tableView.contentInset.top)
        tableView.setContentOffset(offsetPoint, animated: true)
    }
    
    @IBAction func refresh() {
        refreshControl?.beginRefreshing()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {[weak self] in
            if self?.feeds.isEmpty == true {
                self?.feeds = FeedImageViewModel.prototypeFeed
                self?.tableView.reloadData()
            }
            self?.refreshControl?.endRefreshing()
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return feeds.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FeedImageCell") as? FeedImageCell
        let feed = feeds[indexPath.row]
        cell?.configure(with: feed)
        return cell ?? UITableViewCell()
    }
}

extension FeedImageCell {
    func configure(with model: FeedImageViewModel) {
        locationLabel.text = model.location
        locationContainer.isHidden = model.location == nil
        
        descriptionLabel.text = model.description
        descriptionLabel.isHidden = model.description == nil
        
        fadeIn(UIImage(named: model.imageName))
    }
}

