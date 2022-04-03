//
//  WorkThumbnailCollectionViewCell.swift
//  portfolio-ios
//
//  Created by KaitoKudo on 2021/11/29.
//

import UIKit

protocol WorkThumbnailDeletable: AnyObject {
    func deleteWorkThumbnail(index: Int)
}

class WorkThumbnailCollectionViewCell: UICollectionViewCell {

    weak var workThumbnailDeletable: WorkThumbnailDeletable?
    
    @IBOutlet weak var workThumbnailImageView: UIImageView!
    @IBOutlet weak var deleteWorkThumbnailButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()

        deleteWorkThumbnailButton.tintColor = .gray
    }

    @IBAction func deleteWorkThumbnail(_ sender: Any) {
        workThumbnailDeletable?.deleteWorkThumbnail(index: self.tag)
    }
}
