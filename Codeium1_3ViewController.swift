//
//  ViewController.swift
//  AIGenerateCode
//
//  Created by Okamoto Akihiro on 2024/08/23.
//

import UIKit

class Codeium1_3ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
   override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        // Storyboardを使用した画面遷移処理
        let storyboard = self.storyboard
        let nextVC = storyboard?.instantiateViewController(withIdentifier: "NextView")
        self.present(nextVC!, animated: true, completion: nil)
    }

}
