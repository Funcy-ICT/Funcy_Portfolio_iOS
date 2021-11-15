//
//  PhotoSubmitCollectionViewCell.swift
//  portfolio-ios
//
//  Created by KaitoKudo on 2021/11/15.
//

import UIKit

protocol PhotoSubmitCustomCellDelegate: AnyObject {
    func didTapdeleteWorkThumbnailButton(cell: UICollectionViewCell)
}

class PhotoSubmitCollectionViewCell: UICollectionViewCell {

    weak var delegate: PhotoSubmitCustomCellDelegate?

    @IBOutlet weak var workThumbnailImageView: UIImageView!
    @IBOutlet weak var deleteWorkThumbnailButton: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    @IBAction func deleteWorkThumbnail(_ sender: Any) {
        delegate?.didTapdeleteWorkThumbnailButton(cell: self)
    }
}
