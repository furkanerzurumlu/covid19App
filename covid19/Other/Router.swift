//
//  Router.swift
//  covid19
//
//  Created by Furkan Erzurumlu on 6.12.2022.
//

import Foundation
import UIKit

final class Router{
    
    static var shared: Router = Router()
    
    func showDetail(navigationController: UINavigationController?, data: DataProvider){
        let detailVC = Detail.instantiate(storyboard: .detail)
        let detailVM = StatusVM()
        detailVC.data = data
        navigationController?.pushViewController(detailVC, animated: true)
    }
}
