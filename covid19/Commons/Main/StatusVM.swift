//
//  StatusVM.swift
//  covid19
//
//  Created by Furkan Erzurumlu on 6.12.2022.
//

import Foundation

protocol StatusVMProtocol: AnyObject {
    
}

protocol StatusVMDelegate: StatusVMProtocol {
    
    var delegate: StatusVMDelegateOutputs? {get set}
    var data: [DataProvider] {get set}
    func getUpComingData()
}

protocol StatusVMDelegateOutputs: AnyObject {
    func reloadTableView()
}

class StatusVM: StatusVMDelegate {
    
    var data: [DataProvider] = []
    var delegate: StatusVMDelegateOutputs?
    var network: covidNetworking = covidNetworking()
    
    func getUpComingData() {
        network.getUpComingCovid{ [weak self] (response) in
            if let response = response {
                self?.data = response.dataProvider
                self?.delegate?.reloadTableView()
            }
            
        }
    }
    
    
}
