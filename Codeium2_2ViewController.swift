//
//  ViewController.swift
//  AIGenerateCode
//
//  Created by Okamoto Akihiro on 2024/08/23.
//

import UIKit

class Codeium2_2ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var deviceList: [String] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // 端末のモデル名、OSバージョン、名前、容量を取得してリスト化
        let device = UIDevice.current
        let modelName = device.model
        let osVersion = device.systemVersion
        let name = device.name
        // 端末の総容量
        var capacity = ""
        let fileManager = FileManager.default
        if let diskCapacity = try? fileManager.attributesOfFileSystem(forPath: NSHomeDirectory())[FileAttributeKey.systemSize] as? UInt64 {
            capacity = ByteCountFormatter.string(fromByteCount: Int64(diskCapacity), countStyle: .file)
        }

        deviceList.append(modelName)
        deviceList.append(osVersion)
        deviceList.append(name)
        deviceList.append(capacity)
        
        print(deviceList)
        
        // 取得した情報をtableview,カスタムセルで表示
        let tableView = UITableView(frame: self.view.frame)
        tableView.frame = self.view.frame
        self.view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return deviceList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "Cell")
        cell.textLabel?.text = deviceList[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("select")
    }
    
}
