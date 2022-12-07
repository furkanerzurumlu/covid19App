//
//  ViewController.swift
//  covid19
//
//  Created by Furkan Erzurumlu on 4.12.2022.
//

import UIKit

class Status: UIViewController {

    @IBOutlet weak var statusTableView: UITableView!
    
    var viewModel: StatusVM = StatusVM()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.title = "Covid-19 Verileri"
        viewModel.delegate = self
        viewModel.getUpComingData()
        
        statusTableView.register(StatusTableViewCell.nibName, forCellReuseIdentifier: StatusTableViewCell.identifier)
        
        
        statusTableView.separatorEffect = .none
//        print(viewModel.data.count)
        
        statusTableView.delegate = self
        statusTableView.dataSource = self
    }


}

extension Status: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = statusTableView.dequeueReusableCell(withIdentifier: StatusTableViewCell.identifier, for: indexPath) as! StatusTableViewCell
        cell.selectionStyle = .none
        cell.dateStump.text = viewModel.data[indexPath.row].dateStamp
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let data = viewModel.data[indexPath.row] ?? nil {
            Router.shared.showDetail(navigationController: self.navigationController, data: data)
        }
       
    }
    
}
extension Status: StatusVMDelegateOutputs {
    func reloadTableView() {
        self.statusTableView.reloadData()
    }
    
    
}
