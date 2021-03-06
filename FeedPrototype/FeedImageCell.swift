//
//  FeedImageCell.swift
//  FeedPrototype
//
//  Created by Shilpa Bansal on 06/03/21.
//

import Foundation
import UIKit

final class FeedImageCell: UITableViewCell {
    @IBOutlet private(set) var locationContainer: UIView!
    @IBOutlet private(set) var locationLabel: UILabel!
    @IBOutlet private(set) var feedImageContainer: UIView!
    @IBOutlet private(set) var feedImageView: UIImageView!
    @IBOutlet private(set) var descriptionLabel: UILabel!
}
