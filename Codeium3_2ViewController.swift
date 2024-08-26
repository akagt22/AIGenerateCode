//
//  ViewController.swift
//  AIGenerateCode
//
//  Created by Okamoto Akihiro on 2024/08/23.
//

import UIKit
import Vision

class Codeium3_2ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // 任意の画像から文字列を識別しString値としてデータを受け取る処理
        //（使用するライブラリは指定せずAI側でライブラリの選定も行う）
        // 画像の読み込み
        let image = UIImage(named: "sample.jpg")

        // 画像の読み込み
        guard let cgImage = image?.cgImage else {
            print("画像の読み込みに失敗しました")
            return
        }

        // 画像の解析
        let request = VNRecognizeTextRequest { request, error in
            if let error = error {
                print("画像解析に失敗しました: \(error.localizedDescription)")
                return
            }

            guard let observations = request.results as? [VNRecognizedTextObservation] else {
                print("画像解析に失敗しました")
                return
            }

            for observation in observations {
                print(observation.topCandidates(1).first?.string)
            }
        }

        request.recognitionLevel = .accurate
        request.recognitionLanguages = ["ja-JP"]

        // 画像の解析
        let handler = VNImageRequestHandler(cgImage: cgImage, options: [:])
        do {
            try handler.perform([request])
        } catch {
            print("画像解析に失敗しました: \(error.localizedDescription)")
        }
    }
    
}
