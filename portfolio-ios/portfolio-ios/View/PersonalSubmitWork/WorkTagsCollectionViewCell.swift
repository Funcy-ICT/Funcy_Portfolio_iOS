//
//  WorkTagsCollectionViewCell.swift
//  portfolio-ios
//
//  Created by 工藤 海斗 on 2022/04/03.
//

import UIKit

protocol TagDeletable: AnyObject {
    func deleteTag(index: Int)
}

class WorkTagsCollectionViewCell: UICollectionViewCell {

    weak var tagDeletable: TagDeletable?
    @IBOutlet weak var tagLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    @IBAction func deleteTagButton(_ sender: Any) {
        tagDeletable?.deleteTag(index: self.tag)
    }
    
}
