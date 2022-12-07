//
//  covidNetworking.swift
//  covid19
//
//  Created by Furkan Erzurumlu on 6.12.2022.
//

import Foundation
import Alamofire

class covidNetworking{
    static let upComingCovid = "https://public.richdataservices.com/rds/api/query/covid19/jhu_country/select?cols=date_stamp,cnt_confirmed,cnt_death,cnt_recovered&where=(iso3166_1=TR)&format=amcharts&limit=5000"
    
    
    func getUpComingCovid(completion: @escaping(Covid?)->()){
        let request = AF.request("https://public.richdataservices.com/rds/api/query/covid19/jhu_country/select?cols=date_stamp,cnt_confirmed,cnt_death,cnt_recovered&where=(iso3166_1=TR)&format=amcharts&limit=5000")
        request.validate().responseDecodable(of: Covid.self) {[weak self] (response) in
            guard let covid = response.value else{
                completion(nil)
                print(response.error)
                return
            }
            completion(covid)
        }
    }
}
