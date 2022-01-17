//
//  PersonalSubmitWorkViewController.swift
//  portfolio-ios
//
//  Created by KaitoKudo on 2021/10/25.
//

import PhotosUI
import UIKit

class PersonalSubmitWorkViewController: UIViewController {

    @IBOutlet weak var addTagButton: UIButton!
    @IBOutlet weak var addThumbnailsWorkButton: UIButton!
    @IBOutlet weak var workDescriptionTextView: UITextView!
    @IBOutlet weak var workTitleTextField: UITextField!
    @IBOutlet weak var githubLinkTextField: UITextField!
    @IBOutlet weak var youtubeLinkTextField: UITextField!
    @IBOutlet weak var workTagsCollectionView: UICollectionView!
    @IBOutlet weak var workThumbnailCollectionView: UICollectionView!

    private var pickedImages = [UIImage]()

    override func viewDidLoad() {
        super.viewDidLoad()
        configurationUI()
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
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

        workDescriptionTextView.delegate = self
        workTitleTextField.delegate = self
        githubLinkTextField.delegate = self
        youtubeLinkTextField.delegate = self
        workThumbnailCollectionView.delegate = self
        workThumbnailCollectionView.dataSource = self
        workThumbnailCollectionView.register(UINib(nibName: "WorkThumbnailCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "photoCell")

        // キーボードに完了のツールバーを作成
        let doneToolbar = UIToolbar()
        doneToolbar.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 40)
        let spacer = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        let doneButton = UIBarButtonItem(title: "完了", style: .done, target: self, action: #selector(doneButtonTaped))
        doneToolbar.items = [spacer, doneButton]
        workDescriptionTextView.inputAccessoryView = doneToolbar
        workTitleTextField.inputAccessoryView = doneToolbar
        githubLinkTextField.inputAccessoryView = doneToolbar
        youtubeLinkTextField.inputAccessoryView = doneToolbar
    }

    @objc func doneButtonTaped(sender: UIButton) {
        workDescriptionTextView.endEditing(true)
        workTitleTextField.resignFirstResponder()
        githubLinkTextField.resignFirstResponder()
        youtubeLinkTextField.resignFirstResponder()
    }

    // キーボード出現時にViewを上にあげる
    @objc func keyboardWillShow(notification: NSNotification) {
        if workTitleTextField.isFirstResponder || workDescriptionTextView.isFirstResponder {
            return
        }

        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            if view.frame.origin.y == 0 {
                view.frame.origin.y -= keyboardSize.height
            } else {
                let suggestionHeight = self.view.frame.origin.y + keyboardSize.height
                view.frame.origin.y -= suggestionHeight
            }
        }
    }

    // キーボードが閉じられた時にViewの高さを元に戻す
    @objc func keyboardWillHide() {
        if view.frame.origin.y != 0 {
            view.frame.origin.y = 0
        }
    }

    // 作品公開非公開設定
    @IBAction func publicPrivateSettings(_ sender: Any) {
        if (sender as AnyObject).isOn {
            print("公開")
        } else {
            print("非公開")
        }
    }

    @IBAction func addTag(_ sender: Any) {
        print(#function)
    }

    @IBAction func addThumbnailsWork(_ sender: Any) {
        print(#function)

        let alertController = UIAlertController(title: "確認", message: "選択してください", preferredStyle: .actionSheet)

        // カメラが利用可能かどうかチェック
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            let cameraAction = UIAlertAction(title: "カメラ", style: .default, handler: { (_: UIAlertAction) in
                let imagePickerController = UIImagePickerController()
                imagePickerController.sourceType = .camera
                imagePickerController.delegate = self
                self.present(imagePickerController, animated: true, completion: nil)
            })
            alertController.addAction(cameraAction)
        }

        // フォトライブラリが利用可能かどうかチェック
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            let photoLibraryAction = UIAlertAction(title: "フォトライブラリ", style: .default, handler: { (_: UIAlertAction) in
                let imagePickerController = UIImagePickerController()
                imagePickerController.sourceType = .photoLibrary
                imagePickerController.delegate = self
                self.present(imagePickerController, animated: true, completion: nil)
            })
            alertController.addAction(photoLibraryAction)
        }

        // キャンセルの選択肢を定義
        let cancelAction = UIAlertAction(title: "キャンセル", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)

        alertController.popoverPresentationController?.sourceView = view // ipadで落ちてしまう対策
        present(alertController, animated: true, completion: nil)
    }

    @IBAction func submitWork(_ sender: Any) {
        print(#function)
    }

    @IBAction func draftWork(_ sender: Any) {
        print(#function)
    }
}

extension PersonalSubmitWorkViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

extension PersonalSubmitWorkViewController: UITextViewDelegate {
}

extension PersonalSubmitWorkViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        guard let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else {
            return
        }
        pickedImages.append(pickedImage)
        dismiss(animated: true, completion: {
            self.workThumbnailCollectionView.reloadData()
        })
    }
}

extension PersonalSubmitWorkViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(pickedImages.count)
        return pickedImages.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "photoCell", for: indexPath) as? WorkThumbnailCollectionViewCell else { return UICollectionViewCell() }
        let image = pickedImages[indexPath.row]
        cell.workThumbnailImageView.image = image.resize(size: .init(width: 80, height: 70))
        return cell
    }

}
