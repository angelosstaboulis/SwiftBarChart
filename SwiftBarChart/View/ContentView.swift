//
//  ContentView.swift
//  SwiftBarChart
//
//  Created by Angelos Staboulis on 27/9/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ChartViewModel()
    @State var counter:Double
    @State var dataArray:[ChartModel] = []
    var body: some View {
        NavigationStack{
            List(viewModel.data){number in
                Text(String(describing:number.value))
                    .onTapGesture {
                        self.counter = number.value
                    }
                    .listRowBackground(self.counter == number.value ? Color.red : Color.clear)
            }.onAppear(perform: {
                dataArray.append(contentsOf: viewModel.data)
            })
            .toolbar {
                ToolbarItem(placement: .bottomBar, content: {
                    NavigationLink(
                        destination:
                            ChartView(data: dataArray),
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
    ContentView(counter: 0.0)
}
