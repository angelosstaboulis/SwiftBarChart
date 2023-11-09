//
//  ContentView.swift
//  SwiftBarChart
//
//  Created by Angelos Staboulis on 27/9/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ChartViewModel()
    @State var getNumberValue:Double
    var body: some View {
        NavigationStack{
            List(viewModel.data){number in
                Text(String(describing:number.value))
                    .onTapGesture {
                        self.getNumberValue = number.value
                    }
                    .listRowBackground(self.getNumberValue == number.value ? Color.red : Color.clear)
            }.toolbar {
                ToolbarItem(placement: .bottomBar, content: {
                    NavigationLink(
                        destination:
                            ChartView(data: viewModel.data),
                        label: {
                            Text("Chart").foregroundStyle(.blue)
                        }
                    )
                    .buttonStyle(PlainButtonStyle())
                    
                })
            }.navigationTitle("SwiftBarChart")
            .navigationBarTitleDisplayMode(.inline)
            
        }
    }

}

#Preview {
    ContentView(getNumberValue: 0.0)
}
