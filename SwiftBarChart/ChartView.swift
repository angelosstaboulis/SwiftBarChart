//
//  ChartView.swift
//  SwiftBarChart
//
//  Created by Angelos Staboulis on 27/9/23.
//

import SwiftUI
import Charts

struct ChartView: View {
    @State var data:[ChartData]=[]
    var body: some View {
        NavigationStack{
            Chart {
                ForEach(data){item in
                    BarMark(x:.value("Months", item.description), y: .value(item.description, item.value))
                }
            }.navigationTitle("ChartView")
                .navigationBarTitleDisplayMode(.inline)
               
        }
    }
}
