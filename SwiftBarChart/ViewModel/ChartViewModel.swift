//
//  ChartViewModel.swift
//  SwiftBarChart
//
//  Created by Angelos Staboulis on 29/9/23.
//

import Foundation
import SwiftUI
class ChartViewModel:ObservableObject{
    @Published var data:[ChartModel] = [
        ChartModel(id: UUID(), description: "August", value: 30.0),
        ChartModel(id: UUID(), description: "September", value: 130.0),
        ChartModel(id: UUID(), description: "October", value: 230.0),
        ChartModel(id: UUID(), description: "November", value: 330.0),
    ]
    func makeNewArray(){
        data.append(ChartModel(id: UUID(), description: "August", value: Double(Int.random(in: 0...1000))))
        data.append(ChartModel(id: UUID(), description: "September", value: Double(Int.random(in: 0...1000))))
        data.append(ChartModel(id: UUID(), description: "October", value: Double(Int.random(in: 0...1000))))
        data.append(ChartModel(id: UUID(), description: "November", value: Double(Int.random(in: 0...1000))))
    }
    func sortArray(){
        data.sort { oldValue, newValue in
            return oldValue.value < newValue.value
        }
    }
    func removeAllArray(){
        data.removeAll()
    }
}
