//
//  ViewController.swift
//  CombInstagram
//
//  Created by AlexanderYakovenko on 7/19/17.
//  Copyright © 2017 AlexanderYakovenko. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var shownCity = [String]()
    let allCities = ["New York","London","Oslo","Warsaw","Berlin","Praga"]
    
    let disposableBag = DisposeBag()
    
    
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var tableView: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        searchBar.rx.text.orEmpty.subscribe(onNext: {[unowned self] query in
            self.shownCity = self.allCities.filter { $0.hasPrefix(query) }
            self.tableView.reloadData()
        
        }).addDisposableTo(disposableBag)
        
        
        
       
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shownCity.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = shownCity[indexPath.row]
        return cell
    }

    
}

