//
//  Case2TableViewController.swift
//  TVC
//
//  Created by SangRae Kim on 1/5/24.
//

import UIKit

class Case2TableViewController: UITableViewController {
    
    @IBOutlet var titleLabel: UILabel!
    let titles = [
        ["공지사항", "실험실", "버전 정보"],
        ["개인/보안", "알림", "채팅", "멀티프로필"],
        ["고객센터/도움말"]]
    let headers = ["전체 설정", "개인 설정", "기타"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = "설정"
        titleLabel.font = .boldSystemFont(ofSize: 20)
        titleLabel.textAlignment = .center
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return titles.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titles[section].count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Case2TableViewCell")
        
        cell?.textLabel?.text = titles[indexPath.section][indexPath.row]
        cell?.textLabel?.font = .systemFont(ofSize: 16)
        
        return cell!
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return headers[section]
    }
}
