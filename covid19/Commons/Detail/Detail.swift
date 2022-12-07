//
//  Detail.swift
//  covid19
//
//  Created by Furkan Erzurumlu on 6.12.2022.
//

import UIKit
import Charts

class Detail: UIViewController {
    
    var viewModel: StatusVM = StatusVM()
    var data : DataProvider?
    let pieChartView = PieChartView()
    
    
    @IBOutlet weak var dateStamp: UILabel!
    @IBOutlet weak var confirmedText: UILabel!
    @IBOutlet weak var recoveredText: UILabel!
    @IBOutlet weak var deathText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setPieChart()
        setData()
        setLayout()
        
        print(data?.cntConfirmed ?? 0)
        print(data?.cntDeath ?? 0 )
        
    }
    fileprivate func setLayout(){
        navigationController?.navigationBar.tintColor = .black
    }
    fileprivate func setData(){
        
        dateStamp.text = data?.dateStamp
        confirmedText.text = "Vaka Sayısı: \(data?.cntConfirmed ?? 0)"
        recoveredText.text = "İyileşen Kişi Sayısı: \(data?.cntRecovered ?? 0)"
        deathText.text = "Ölen Kişi Sayısı \(data?.cntDeath ?? 0)"
        
        dateStamp.textAlignment = .center
        
    }
    fileprivate func setPieChart(){
        

        pieChartView.frame = CGRect(
            x: 25, y: -120, width: (view.frame.size.width) - 50, height: view.frame.size.height
        )
        
        let cnt_death = data?.cntDeath ?? 0
        let cnt_recovered = data?.cntRecovered ?? 0
        let cnt_confirmed = data?.cntConfirmed ?? 0
        
        if ((cnt_recovered == 0) && (cnt_death == 0)) {
            
            
            pieChartView.segments = [
                LabelledSegment(color: #colorLiteral(red: 0.392156863, green: 0.945098039, blue: 0.717647059, alpha: 1.0), name: "Vaka Sayısı",      value: CGFloat(cnt_confirmed))
            ]

            pieChartView.segmentLabelFont = .boldSystemFont(ofSize: 18)
            view.addSubview(pieChartView)
            
        }else{
            pieChartView.segments = [
                LabelledSegment(color: #colorLiteral(red: 1.0, green: 0.121568627, blue: 0.28627451, alpha: 1.0), name: "Ölüm",        value: CGFloat(cnt_death)),
                LabelledSegment(color: #colorLiteral(red: 0.392156863, green: 0.945098039, blue: 0.717647059, alpha: 1.0), name: "İyileşen",      value: CGFloat(cnt_recovered))
              
            ]


            pieChartView.segmentLabelFont = .boldSystemFont(ofSize: 18)
            view.addSubview(pieChartView)
        }
        
       
    }
}

