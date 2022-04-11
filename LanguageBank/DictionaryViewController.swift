//
//  DictionaryViewController.swift
//  LanguageBank
//
//  Created by Олег Плаксин on 03.12.2021.
//

import UIKit
import SQLite

class DictionaryViewController: UIViewController {
  
    @IBOutlet weak var tableView: UITableView!
    
    func addWord(wordIn: String, translationIn: String) {
        do{
            let path = NSSearchPathForDirectoriesInDomains(
                .documentDirectory, .userDomainMask, true
            ).first!
            let db = try Connection("\(path)/LaBaDB.db")
            let dictionaries = Table("dictionary")
            let word = Expression<String>("word")
            let translation = Expression<String>("translation")
            try db.run(dictionaries.insert(or: .replace, word <- wordIn, translation <- translationIn))
        }
        catch{
            print(error)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}
