//
//  StatusTableViewCell.swift
//  covid19
//
//  Created by Furkan Erzurumlu on 5.12.2022.
//

import UIKit

class StatusTableViewCell: UITableViewCell {

    @IBOutlet weak var firstLayer: UIView!
    @IBOutlet weak var dateStump: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setCell()
    }
    func setCell(){
        firstLayer.layer.cornerRadius = 10
        dateStump.textAlignment = .center
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
extension StatusTableViewCell{
    static var identifier: String{
        return String(describing: Self.self)
    }
    static var nibName: UINib{
        return UINib(nibName: identifier, bundle: nil)
    }
}
