//
//  PersonalSubmitWorkViewController.swift
//  portfolio-ios
//
//  Created by KaitoKudo on 2021/10/25.
//

import PhotosUI
import UIKit

class PersonalSubmitWorkViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

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
        wordTitleTextField.delegate = self
        githubLinkTextField.delegate = self
        youtubeLinkTextField.delegate = self

        // キーボードに完了のツールバーを作成
        let doneToolbar = UIToolbar()
        doneToolbar.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 40)
        let spacer = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        let doneButton = UIBarButtonItem(title: "完了", style: .done, target: self, action: #selector(doneButtonTaped))
        doneToolbar.items = [spacer, doneButton]
        workDescriptionTextView.inputAccessoryView = doneToolbar
        wordTitleTextField.inputAccessoryView = doneToolbar
        githubLinkTextField.inputAccessoryView = doneToolbar
        youtubeLinkTextField.inputAccessoryView = doneToolbar
    }

    @objc func doneButtonTaped(sender: UIButton) {
        workDescriptionTextView.endEditing(true)
        wordTitleTextField.resignFirstResponder()
        githubLinkTextField.resignFirstResponder()
        youtubeLinkTextField.resignFirstResponder()
    }

    // キーボード出現時にViewを上にあげる
    @objc func keyboardWillShow(notification: NSNotification) {
        if wordTitleTextField.isFirstResponder || workDescriptionTextView.isFirstResponder {
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

    @IBAction func addTag(_ sender: Any) {
        print(#function)
    }

    @IBAction func addThumbnailsWork(_ sender: Any) {
        print(#function)
        
        let alertController = UIAlertController(title: "確認", message: "選択してください", preferredStyle: .actionSheet)

        // カメラが利用可能かどうかチェック
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            // カメラを起動するための選択肢を定義
            // UIAlertActionは選択肢を表示させるクラス
            let cameraAction = UIAlertAction(title: "カメラ", style: .default, handler: { (_: UIAlertAction) in

                // カメラを起動
                let imagePickerController = UIImagePickerController()
                imagePickerController.sourceType = .camera
                imagePickerController.delegate = self
                self.present(imagePickerController, animated: true, completion: nil)
            })
            alertController.addAction(cameraAction)
        }

        // フォトライブラリが利用可能かどうかチェック
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            // フォトライブラリを起動するための選択肢を定義
            let photoLibraryAction = UIAlertAction(title: "フォトライブラリ", style: .default, handler: { (_: UIAlertAction) in

                // フォトライブラリを起動
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

        // ipadで落ちてしまう対策
        alertController.popoverPresentationController?.sourceView = view

        // 選択肢を画面に表示
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
