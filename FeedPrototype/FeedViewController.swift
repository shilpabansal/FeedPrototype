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
    let feedModel = FeedImageViewModel.prototypeFeed
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return feedModel.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FeedImageCell") as? FeedImageCell
        let feed = feedModel[indexPath.row]
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

