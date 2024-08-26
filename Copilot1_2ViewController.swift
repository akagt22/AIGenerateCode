//
//  ViewController.swift
//  AIGenVerify
//
//  Created by Okamoto Akihiro on 2024/08/20.
//

import UIKit

class Copilot1_2ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        // ランダムで1~10の整数値を返却し返却値が10以上だったらエラーToastを表示する処理
        //（例外処理(do-catchで実装するように指示)）
        let random = Int.random(in: 1...10)
        do {
            if random >= 10 {
                throw NSError(domain: "エラー", code: 0, userInfo: nil)
            }
        } catch {
            self.showToast(message: "エラーが発生しました", font: .systemFont(ofSize: 12.0))
        }
    }
    
    // エラーToastを表示する処理
    func showToast(message : String, font: UIFont) {
        let toastLabel = UILabel()
        toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        toastLabel.textColor = UIColor.white
        toastLabel.font = font
        toastLabel.textAlignment = .center
        toastLabel.text = message
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 10
        toastLabel.clipsToBounds  =  true
        self.view.addSubview(toastLabel)
        toastLabel.translatesAutoresizingMaskIntoConstraints = false
        toastLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        toastLabel.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -100).isActive = true
        toastLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        toastLabel.widthAnchor.constraint(equalToConstant: 300).isActive = true
        UIView.animate(withDuration: 2.0, delay: 0.1, options: .curveEaseOut, animations: {
            toastLabel.alpha = 0.0
        }, completion: {(isCompleted) in
            toastLabel.removeFromSuperview()
        })
    }
}


