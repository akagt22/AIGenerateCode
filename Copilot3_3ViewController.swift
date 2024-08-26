//
//  ViewController.swift
//  AIGenVerify
//
//  Created by Okamoto Akihiro on 2024/08/22.
//

import UIKit

class Copilot3_3ViewController: UIViewController {
    
    var count = 0
    var timer = Timer()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        // ストップウォッチ機能の実装
        let label = UILabel()
        label.frame = CGRect(x: 0, y: 0, width: 200, height: 50)
        label.backgroundColor = UIColor.black
        label.textColor = UIColor.white
        label.textAlignment = .center
        label.text = "00:00:00"
        label.layer.cornerRadius = 10
        label.clipsToBounds = true
        label.layer.position = CGPoint(x: self.view.frame.width/2, y: self.view.frame.height/2)
        self.view.addSubview(label)
        
        setupButton()
        
    }
    
    // スタートボタン・ストップボタン・リセットボタンの配置
    func setupButton() {
        let startButton = UIButton()
        startButton.frame = CGRect(x: 0, y: 0, width: 100, height: 50)
        startButton.backgroundColor = UIColor.blue
        startButton.layer.masksToBounds = true
        startButton.setTitle("Start", for: .normal)
        startButton.layer.cornerRadius = 20.0
        startButton.layer.position = CGPoint(x: self.view.frame.width/2, y: self.view.frame.height/2 + 100)
        startButton.addTarget(self, action: #selector(startButtonEvent(_:)), for: .touchUpInside)
        self.view.addSubview(startButton)
        
        let stopButton = UIButton()
        stopButton.frame = CGRect(x: 0, y: 0, width: 100, height: 50)
        stopButton.backgroundColor = UIColor.red
        stopButton.layer.masksToBounds = true
        stopButton.setTitle("Stop", for: .normal)
        stopButton.layer.cornerRadius = 20.0
        stopButton.layer.position = CGPoint(x: self.view.frame.width/2, y: self.view.frame.height/2 + 150)
        stopButton.addTarget(self, action: #selector(stopButtonEvent(_:)), for: .touchUpInside)
        self.view.addSubview(stopButton)
        
        let resetButton = UIButton()
        resetButton.frame = CGRect(x: 0, y: 0, width: 100, height: 50)
        resetButton.backgroundColor = UIColor.green
        resetButton.layer.masksToBounds = true
        resetButton.setTitle("Reset", for: .normal)
        resetButton.layer.cornerRadius = 20.0
        resetButton.layer.position = CGPoint(x: self.view.frame.width/2, y: self.view.frame.height/2 + 200)
        resetButton.addTarget(self, action: #selector(resetButtonEvent(_:)), for: .touchUpInside)
        self.view.addSubview(resetButton)
    }
    
    // スタートボタンタップ時の処理
    @objc func startButtonEvent(_ sender: UIButton) {
        // タイマーを起動
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
    }
    
    // ストップボタンタップ時の処理
    @objc func stopButtonEvent(_ sender: UIButton) {
        // タイマーを停止
        timer.invalidate()
    }
    
    // リセットボタンタップ時の処理
    @objc func resetButtonEvent(_ sender: UIButton) {
        // タイマーを停止
        timer.invalidate()
        // タイマーを初期化
        count = 0
        // ラベルを初期化
        let label = self.view.subviews.first as! UILabel
        label.text = "00:00:00"
    }
    
    // タイマーの更新
    @objc func updateTime() {
        count += 1
        let label = self.view.subviews.first as! UILabel
        let sec = count % 60
        let min = (count / 60) % 60
        let hour = count / 3600
        label.text = String(format: "%02d:%02d:%02d", hour, min, sec)
    }
    
}
