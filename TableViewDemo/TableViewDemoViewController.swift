//
//  TableViewDemoViewController.swift
//  TableViewDemo
//
//  Created by Oleg Egorov on 10.07.17.
//  Copyright © 2017 Oleg Egorov. All rights reserved.
//

import UIKit

class TableViewDemoViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    // это наша модель
    // возьмем строку и разобьем на подстроки, разделенные пробелом.
    var strings = "The designated initializer. If you subclass UIViewController, you must call the super implementation of this method, even if you aren't using a NIB.  (As a convenience, the default init method will do this for you, and specify nil for both of this methods arguments.)".components(separatedBy: " ")
    
    
    // в этом методе как правило происходит подготовка к работе нашего ViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // станет делегатом тэблвью, реализовав протокол UITableView DataSource
        tableView.dataSource = self

        // Do any additional setup after loading the view.
    }
}


extension TableViewDemoViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return strings.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // 1. запросим прототип таблицы
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellID", for: indexPath)
        
        // 2. найдем модель для конкретного индекса
        //   indexPath - возвращает номер строки этого индекса
        // для нулевой по счету ячейки получим нулевую по счету строку
        // для первой - первую и т.д.
        let text = strings[indexPath.row]
        
        // 3. настроим его в соответствии с нашей моделью
        cell.textLabel?.text = text
        cell.detailTextLabel?.text = "[\(indexPath.row)]"
        
        cell.textLabel?.backgroundColor = UIColor.clear
        cell.detailTextLabel?.backgroundColor = UIColor.clear
        
        return cell
    }
}














