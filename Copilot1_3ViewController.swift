//
//  ViewController.swift
//  AIGenVerify
//
//  Created by Okamoto Akihiro on 2024/08/22.
//

import UIKit

class Copilot1_3ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // Storyboardを使用した画面遷移処理
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
    
    // Storyboardを使用した画面遷移処理
    @objc func buttonEvent(_ sender: UIButton) {
        let storyboard: UIStoryboard = self.storyboard!
        let nextView = storyboard.instantiateViewController(withIdentifier: "NextView")
        self.present(nextView, animated: true, completion: nil)
    }
}
