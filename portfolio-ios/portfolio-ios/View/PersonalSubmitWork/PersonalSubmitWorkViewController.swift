//
//  PersonalSubmitWorkViewController.swift
//  portfolio-ios
//
//  Created by KaitoKudo on 2021/10/25.
//

import UIKit

class PersonalSubmitWorkViewController: UIViewController {

    @IBOutlet weak var addTagButton: UIButton!
    @IBOutlet weak var addThumbnailsWorkButton: UIButton!
    @IBOutlet weak var workDescriptionTextView: UITextView!
    @IBOutlet weak var wordTitleTextField: UITextField!
    @IBOutlet weak var githubLinkTextField: UITextField!
    @IBOutlet weak var youtubeLinkTextField: UITextField!
    @IBOutlet weak var workTagsCollectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        configurationUI()
    }

    private func configurationUI() {
        if #available(iOS 13.0, *) {
            addTagButton.tintColor = .gray
            addThumbnailsWorkButton.tintColor = .gray
        }
        workDescriptionTextView.layer.borderColor = UIColor.gray.cgColor
        workDescriptionTextView.layer.borderWidth = 0.2
        workDescriptionTextView.layer.cornerRadius = 5.0
        workDescriptionTextView.layer.masksToBounds = true
    }

    @IBAction func addTag(_ sender: Any) {
        print(#function)
    }

    @IBAction func addThumbnailsWork(_ sender: Any) {
        print(#function)
    }

    @IBAction func submitWork(_ sender: Any) {
        print(#function)
    }

    @IBAction func draftWork(_ sender: Any) {
        print(#function)
    }
}
