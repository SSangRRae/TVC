//
//  Case3TableViewController.swift
//  TVC
//
//  Created by SangRae Kim on 1/5/24.
//

import UIKit

class Case3TableViewController: UITableViewController {

    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var buyTextField: UITextField!
    @IBOutlet var addButton: UIButton!
    
    var todoList = ["그립톡 구매", "사이다 구매", "아이패드 중고 매물 확인"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = "쇼핑"
        titleLabel.font = .boldSystemFont(ofSize: 20)
        titleLabel.textAlignment = .center
        
        buyTextField.placeholder = "무엇을 구매하실 건가요?"
        buyTextField.borderStyle = .roundedRect
        buyTextField.backgroundColor = .systemGray6
        
        addButton.setTitle("추가", for: .normal)
        addButton.tintColor = .black
        addButton.backgroundColor = .systemGray5
        addButton.titleLabel?.font = .systemFont(ofSize: 16)
        addButton.layer.cornerRadius = 10
    }
    
    @IBAction func addButtonClicked(_ sender: UIButton) {
        guard let text = buyTextField.text else {
            return
        }
        
        todoList.append(text)
        
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            todoList.remove(at: indexPath.row)
        }
        
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Case3TableViewCell", for: indexPath) as! Case3TableViewCell
        
        cell.backgroundColor = .systemGray6
        
        cell.checkImageView.image = UIImage(systemName: "checkmark.square.fill")
        cell.checkImageView.tintColor = .black
        
        cell.todoLabel.text = todoList[indexPath.row]
        cell.todoLabel.textColor = .black
        cell.todoLabel.font = .systemFont(ofSize: 16)
        
        cell.starImageView.image = UIImage(systemName: "star.fill")
        cell.starImageView.tintColor = .black
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
}
