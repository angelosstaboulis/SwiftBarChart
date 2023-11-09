//
//  ChartData.swift
//  SwiftBarChart
//
//  Created by Angelos Staboulis on 9/11/23.
//

import Foundation
struct ChartData:Identifiable{
    let id: UUID
    var description:String
    var value:Double
    init(id: UUID, description: String, value: Double) {
        self.id = id
        self.description = description
        self.value = value
    }
}
