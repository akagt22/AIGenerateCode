//
//  ViewController.swift
//  AIGenerateCode
//
//  Created by Okamoto Akihiro on 2024/08/23.
//

import UIKit

class Codeium2_3ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        // ボタン生成
        let button = UIButton()
        button.setTitle("ボタン", for: .normal)
        button.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        button.center = view.center
        button.backgroundColor = .blue
        button.addTarget(self, action: #selector(tap), for: .touchUpInside)
        view.addSubview(button)
        
    }
    
    // ボタンタップでapi通信
    @objc func tap() {
        print("ボタンタップ")
        // インジケータ表示
        let indicator = UIActivityIndicatorView()
        indicator.center = view.center
        view.addSubview(indicator)
        indicator.startAnimating()
        
        // API通信
        let url = URL(string: "https://api.openai.com/v1/models")
        let request = URLRequest(url: url!)
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                if let json = try? JSONSerialization.jsonObject(with: data, options: []) {
                    print(json)
                }
            }
            // インジケータを停止
            DispatchQueue.main.async {
                indicator.stopAnimating()
                // 画面遷移
                let storyboard = self.storyboard
                let nextVC = storyboard?.instantiateViewController(withIdentifier: "NextView")
                nextVC?.modalPresentationStyle = .fullScreen
                self.present(nextVC!, animated: true, completion: nil)
            }
        }
        task.resume()
    }
}
