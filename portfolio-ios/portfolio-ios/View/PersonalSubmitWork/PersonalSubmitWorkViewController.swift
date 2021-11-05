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

    override func viewDidLoad() {
        super.viewDidLoad()

        if #available(iOS 13.0, *) {
            addTagButton.tintColor = .gray
            addThumbnailsWorkButton.tintColor = .gray
        }
    }

    @IBAction func addTag(_ sender: Any) {
        print(#function)
    }

    @IBAction func addThumbnailsWork(_ sender: Any) {
        print(#function)
    }
}
