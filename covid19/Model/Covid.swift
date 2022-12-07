//
//  Covid.swift
//  covid19
//
//  Created by Furkan Erzurumlu on 6.12.2022.
//

import Foundation

// MARK: - Covid
struct Covid: Codable {
    let dataProvider: [DataProvider]
}

// MARK: - DataProvider
struct DataProvider: Codable {
    let dateStamp: String
    let cntConfirmed, cntDeath, cntRecovered: Int

    enum CodingKeys: String, CodingKey {
        case dateStamp = "date_stamp"
        case cntConfirmed = "cnt_confirmed"
        case cntDeath = "cnt_death"
        case cntRecovered = "cnt_recovered"
    }
}
