//
//  ViewController.swift
//  AIGenVerify
//
//  Created by Okamoto Akihiro on 2024/08/22.
//

import UIKit

class Copilot3_1ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate{

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // ボタンタップでカメラアプリを起動し、カメラアプリで撮影後、ネイティブアプリで撮影した画像を表示
        let button = UIButton()
        button.frame = CGRect(x: 0, y: 0, width: 200, height: 50)
        button.backgroundColor = UIColor.blue
        button.layer.masksToBounds = true
        button.setTitle("ボタン", for: .normal)
        button.layer.cornerRadius = 20.0
        button.layer.position = CGPoint(x: self.view.frame.width/2, y: self.view.frame.height/2)
        button.addTarget(self, action: #selector(buttonEvent(_:)), for: .touchUpInside)
        self.view.addSubview(button)
    }
    
    // ボタンタップでカメラアプリを起動し、カメラアプリで撮影後、ネイティブアプリで撮影した画像を表示
    @objc func buttonEvent(_ sender: UIButton) {
        // カメラ起動
        let picker = UIImagePickerController()
        picker.sourceType = .camera
        picker.delegate = self
        self.present(picker, animated: true, completion: nil)
    }
    
    // カメラアプリで撮影後、ネイティブアプリで撮影した画像を表示
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        // カメラアプリで撮影した画像を取得
        let image = info[.originalImage] as! UIImage
        
        // カメラアプリで撮影した画像を表示
        let imageView = UIImageView(image: image)
        imageView.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        imageView.center = self.view.center
        self.view.addSubview(imageView)
        
        // カメラアプリを閉じる
        picker.dismiss(animated: true, completion: nil)
    }
    
}
