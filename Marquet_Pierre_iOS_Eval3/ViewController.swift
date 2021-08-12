//
//  ViewController.swift
//  Marquet_Pierre_iOS_Eval3
//
//  Created by Student05 on 12/08/2021.
//

import UIKit
import Alamofire
import AlamofireImage

class ViewController: UIViewController {
   
    @IBOutlet var background: UIImageView!
    @IBOutlet var tableView: UITableView!
    
    var tab = [Results]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        background.backgroundColor = .purple
        
        setupData()

        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCell")
        
        
    }
    
    func setupData(){
        
        AF.request("https://api.coincap.io/v2/assets").response { DataResponse in
            
            switch DataResponse.result{
            case .success(let data):
                
                if let getData = data{
                    let decoder = JSONDecoder()
                    let results = try! decoder.decode(Crypto.self, from: getData)
                    self.tab = results.data
                    self.tableView.reloadData()
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tab.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let table = tab[indexPath.row]
        
        let TableViewCell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        
        TableViewCell.setupCell(table: table)
        TableViewCell.formattedPrice(table: table.priceUsd)
        return TableViewCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailCrypto = storyboard?.instantiateViewController(identifier: "DetailCrypto") as! DetailCrypto
        
        navigationController?.pushViewController(detailCrypto, animated: true)
    }
}

