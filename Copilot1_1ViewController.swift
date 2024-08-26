//
//  ViewController.swift
//  AIGenVerify
//
//  Created by Okamoto Akihiro on 2024/08/22.
//

import UIKit

class Copilot1_1ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // Buttonの生成、Buttonタップ時にダイアログを表示する処理
         let uiButton = UIButton()
         uiButton.frame = CGRect(x: 0, y: 0, width: 200, height: 50)
         uiButton.backgroundColor = UIColor.blue
         uiButton.layer.masksToBounds = true
         uiButton.setTitle("ボタン", for: .normal)
         uiButton.layer.cornerRadius = 20.0
         uiButton.layer.position = CGPoint(x: self.view.frame.width/2, y: self.view.frame.height/2)
         uiButton.addTarget(self, action: #selector(buttonEvent(_:)), for: .touchUpInside)
         self.view.addSubview(uiButton)
     }
     
     // Buttonタップ時にダイアログを表示する処理
     @objc func buttonEvent(_ sender: UIButton) {
         let alert = UIAlertController(title: "タイトル", message: "メッセージ", preferredStyle: .alert)
         alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
         self.present(alert, animated: true, completion: nil)
     }

}
