//
//  ChartModel.swift
//  SwiftBarChart
//
//  Created by Angelos Staboulis on 29/9/23.
//

import Foundation
struct ChartModel:Identifiable{
    let id: UUID
    var description:String
    var value:Double
    init(id: UUID, description: String, value: Double) {
        self.id = id
        self.description = description
        self.value = value
    }
}
