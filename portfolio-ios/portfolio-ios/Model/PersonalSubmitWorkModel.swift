//
//  PersonalSubmitWorkModel.swift
//  portfolio-ios
//
//  Created by KaitoKudo on 2021/11/29.
//

import Alamofire
import Foundation

class PersonalSubmitWorkModel {

    func submitWork(title: String, description: String, image: String, url: String, tags: String, group: String, security: Int) {
        let parameters: [String: Any] =  [
            "title": title,
            "description": description,
            "image": image,
            "URL": url,
            "tags": tags,
            "group": group,
            "security": security
        ]
        guard let requestURL = URL(string: "http://localhost:8080/article") else { return }
        AF.request(requestURL, method: .post, parameters: parameters, encoding: URLEncoding.default).responseJSON { [weak self] response in
            guard self != nil else { return }
            print(response)

        }
    }
}
