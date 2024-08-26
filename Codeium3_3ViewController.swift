//
//  ViewController.swift
//  AIGenerateCode
//
//  Created by Okamoto Akihiro on 2024/08/23.
//

import UIKit

class Codeium3_3ViewController: UIViewController {
    
    // タイマー
    var timer: Timer?
    
    // タイマーの経過時間
    var elapsedTime: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // ストップウォッチ機能の実装
        
        // 経過時間を表示するラベルを生成
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
        label.center = CGPoint(x: 160, y: 240)
        label.textAlignment = .center
        label.text = "00:00:00"
        view.addSubview(label)
        
        // スタート・ストップ・リセットのボタン作成
        let startButton = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
        startButton.center = CGPoint(x: 160, y: 300)
        startButton.setTitle("Start", for: .normal)
        startButton.addTarget(self, action: #selector(start), for: .touchUpInside)
        view.addSubview(startButton)
        
        let stopButton = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
        stopButton.center = CGPoint(x: 160, y: 360)
        stopButton.setTitle("Stop", for: .normal)
        stopButton.addTarget(self, action: #selector(stop), for: .touchUpInside)
        view.addSubview(stopButton)
        
        let resetButton = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
        resetButton.center = CGPoint(x: 160, y: 420)
        resetButton.setTitle("Reset", for: .normal)
        resetButton.addTarget(self, action: #selector(reset), for: .touchUpInside)
        view.addSubview(resetButton)
    }

    @objc func start() {
        // ストップウォッチを起動
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    @objc func stop() {
        // ストップウォッチを停止
        timer?.invalidate()
        timer = nil
    }
    
    @objc func reset() {
        // ストップウォッチをリセット
        timer?.invalidate()
        timer = nil
        elapsedTime = 0
        let label = view.subviews[0] as! UILabel
        label.text = "00:00:00"
    }
    
    @objc func updateTimer() {
        // 経過時間の更新
        elapsedTime += 1
        let hour = elapsedTime / 3600
        let minute = (elapsedTime % 3600) / 60
        let second = elapsedTime % 60
        let timeText = String(format: "%02d:%02d:%02d", hour, minute, second)
        // ラベルに経過時間を表示
        let label = view.subviews[0] as! UILabel
        label.text = timeText
    }
    
    
}
