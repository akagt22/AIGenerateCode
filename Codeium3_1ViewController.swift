//
//  ViewController.swift
//  AIGenerateCode
//
//  Created by Okamoto Akihiro on 2024/08/23.
//

import UIKit

class Codeium3_1ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // ボタンタップでカメラアプリを起動し、カメラアプリで撮影後、ネイティブアプリで撮影した画像を表示

        // ボタン生成
        let button = UIButton()
        button.setTitle("ボタン", for: .normal)
        button.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        button.center = view.center
        button.backgroundColor = .blue
        button.addTarget(self, action: #selector(tap), for: .touchUpInside)
        view.addSubview(button)
    }
    
    // ボタンタップでカメラアプリを起動し、カメラアプリで撮影後、ネイティブアプリで撮影した画像を表示
    @objc func tap() {
        print("ボタンタップ")
        
        // カメラアプリ起動
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .camera
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        present(imagePicker, animated: true, completion: nil)
    }
    
    // カメラアプリで撮影した画像をネイティブアプリで表示
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[.editedImage] as? UIImage
        let imageView = UIImageView(image: image)
        imageView.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
        imageView.center = view.center
        view.addSubview(imageView)
        dismiss(animated: true, completion: nil)
    }

}
