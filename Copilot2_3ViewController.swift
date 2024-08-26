//
//  ViewController.swift
//  AIGenVerify
//
//  Created by Okamoto Akihiro on 2024/08/22.
//

import UIKit

class Copilot2_3ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // ボタンタップでAPI通信を行い、画面遷移をする処理。API通信中はインジケーターを表示
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

    // ボタンタップでAPI通信を行い、画面遷移をする処理。API通信中はインジケーターを表示
    @objc func buttonEvent(_ sender: UIButton) {
        // インジケーター表示
        let indicator = UIActivityIndicatorView()
        indicator.center = self.view.center
        indicator.style = .large
        indicator.color = .gray
        self.view.addSubview(indicator)
        indicator.startAnimating()
        
        // API通信処理
        DispatchQueue.global().async {
            // API通信処理
            URLSession.shared.dataTask(with: URL(string: "https://www.google.com")!) { (data, response, error) in
                // API通信完了後の処理
                DispatchQueue.main.async {
                    // インジケーター非表示
                    indicator.stopAnimating()
                    indicator.removeFromSuperview()
                    
                    // 画面遷移処理
                    let storyboard: UIStoryboard = self.storyboard!
                    let nextView = storyboard.instantiateViewController(withIdentifier: "NextView")
                    self.present(nextView, animated: true, completion: nil)
                }
                
                if let error = error {
                    print("Error: \(error)")
                }
            }.resume()
        }
    }
}
