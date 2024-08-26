//
//  ViewController.swift
//  AIGenVerify
//
//  Created by Okamoto Akihiro on 2024/08/22.
//

import UIKit
import Vision

class Copilot3_2ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        // 任意の画像から文字列を識別しString値としてデータを受け取る処理
        //（使用するライブラリは指定せずAI側でライブラリの選定も行う）
        let image = UIImage(named: "sample.jpg")
        let ciImage = CIImage(image: image!)
        let request = VNRecognizeTextRequest { (request, error) in
            guard let observations = request.results as? [VNRecognizedTextObservation] else { return }
            for observation in observations {
                let recognizedText = observation.topCandidates(1).first?.string
                print(recognizedText ?? "")
            }
        }
        
        let handler = VNImageRequestHandler(ciImage: ciImage!, options: [:])
        do {
            try handler.perform([request])
        } catch {
            print(error)
        }
    }
}
