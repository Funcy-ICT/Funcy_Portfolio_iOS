//
//  TagsViewController.swift
//  portfolio-ios
//
//  Created by 工藤 海斗 on 2022/04/03.
//

import UIKit

class TagsViewController: UIViewController {

    @IBOutlet weak var tagsTableView: UITableView!
    var tags: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurationUI()
    }
    
    private func configurationUI() {
        tagsTableView.register(UINib(nibName: "TagsTableViewCell", bundle: nil), forCellReuseIdentifier: "tagsCell")
        tagsTableView.delegate = self
        tagsTableView.dataSource = self
    }
}

extension TagsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "tagsCell", for: indexPath) as? TagsTableViewCell else { return UITableViewCell() }
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 16
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let marginView = UIView()
        marginView.backgroundColor = .clear
        return marginView
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return .leastNonzeroMagnitude
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tagsCell", for: indexPath) as? TagsTableViewCell
        guard let tagText = cell?.tagLabel.text else { return }
        let personalSubmitWorkViewController = storyboard?.instantiateViewController(withIdentifier: "PersonalSubmitWork") as! PersonalSubmitWorkViewController
        tags.append(tagText)
        personalSubmitWorkViewController.tags = self.tags
        dismiss(animated: true)
    }
}
