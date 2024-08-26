//
//  ViewController.swift
//  AIGenVerify
//
//  Created by Okamoto Akihiro on 2024/08/22.
//

import UIKit

class Copilot2_1ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var modelName = ""
    var osVersion = ""
    var name = ""
    var capacity = ""
    var deviceInfo: [String] {
        return ["Model: \(modelName)", "OS Version: \(osVersion)", "Name: \(name)", "Capacity: \(capacity)"]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // 端末のモデル名、OSバージョン、名前、容量を取得してリスト化
        let device = UIDevice.current
        modelName = device.model
        osVersion = device.systemVersion
        name = device.name
        
        // 端末のストレージ取得
        let fileManager = FileManager.default
        var capacity: String = ""
        do {
            let attributes = try fileManager.attributesOfFileSystem(forPath: NSHomeDirectory() as String)
            let totalSize = attributes[FileAttributeKey.systemSize] as! Int
            let freeSize = attributes[FileAttributeKey.systemFreeSize] as! Int
            capacity = "Total: \(totalSize) Free: \(freeSize)"
        } catch {
            print("Error: \(error)")
        }
        self.capacity = capacity
        
        
        print(deviceInfo)

        // 取得した情報をtableview,カスタムセルで表示
        let tableView = UITableView()
        tableView.frame = self.view.frame
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CustomCell.self, forCellReuseIdentifier: "Cell")
        self.view.addSubview(tableView)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // string型リストのdeviceInfoの中身を表示
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustomCell
        cell.label.text = deviceInfo[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
    
}

class CustomCell: UITableViewCell {
    let label = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        label.frame = CGRect(x: 10, y: 10, width: 200, height: 30)
        label.textColor = UIColor.black
        label.font = UIFont.systemFont(ofSize: 15)
        self.contentView.addSubview(label)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
