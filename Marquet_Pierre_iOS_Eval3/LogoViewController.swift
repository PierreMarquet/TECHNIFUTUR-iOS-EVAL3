//
//  LogoViewController.swift
//  Marquet_Pierre_iOS_Eval3
//
//  Created by Student05 on 12/08/2021.
//

import UIKit
import Alamofire
import AlamofireImage

class LogoViewController: UIViewController {
   
    
    @IBOutlet var background: UIImageView!
    @IBOutlet var tableView: UITableView!
    
    
    var tab = [LogoResults]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        background.backgroundColor = .purple
        
        setupData()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UINib(nibName: "LogoTableViewCell", bundle: nil), forCellReuseIdentifier: "LogoTableViewCell")
        

    }
    
    func setupData(){
        
        AF.request("https://api.coinstats.app/public/v1/coins?skip=0&limit=50&currency=EUR").response { DataResponse in
            
            switch DataResponse.result{
            case .success(let data):
                
                if let getData = data{
                    let decoder = JSONDecoder()
                    let results = try! decoder.decode(Logo.self, from: getData)
                    self.tab = results.coins
                    self.tableView.reloadData()
                }
            case .failure(let error):
                print(error)
            }
        }
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension LogoViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tab.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let table = tab[indexPath.row]
        
        let LogoTableViewCell = tableView.dequeueReusableCell(withIdentifier: "LogoTableViewCell", for: indexPath) as! LogoTableViewCell
        
        LogoTableViewCell.setupCell(table: table)
        return LogoTableViewCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
}
