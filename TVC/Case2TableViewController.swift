//
//  Case2TableViewController.swift
//  TVC
//
//  Created by SangRae Kim on 1/5/24.
//

import UIKit

enum Setting: Int, CaseIterable {
    case total
    case personal
    case others
    
    var cellData: [String] {
        switch self {
        case .total:
            return ["공지사항", "실험실", "버전 정보"]
        case .personal:
            return ["개인/보안", "알림", "채팅", "멀티프로필"]
        case .others:
            return ["전체 설정", "개인 설정", "기타"]
        }
    }
    
    var title: String {
        switch self {
        case .total:
            return "전체 설정"
        case .personal:
            return "개인 설정"
        case .others:
            return "기타"
        }
    }
}

class Case2TableViewController: UITableViewController {
    
    @IBOutlet var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = "설정"
        titleLabel.font = .boldSystemFont(ofSize: 20)
        titleLabel.textAlignment = .center
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return Setting.allCases.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return Setting.allCases[section].title
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Setting.allCases[section].cellData.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Case2TableViewCell")
        
        cell?.textLabel?.font = .systemFont(ofSize: 16)
        cell?.textLabel?.text = Setting.allCases[indexPath.section].cellData[indexPath.row]
        
        return cell!
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}
