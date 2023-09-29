//
//  ContentView.swift
//  SwiftBarChart
//
//  Created by Angelos Staboulis on 27/9/23.
//

import SwiftUI
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
struct ContentView: View {
    @State var data:[ChartData] = [
        ChartData(id: UUID(), description: "August", value: 30.0),
        ChartData(id: UUID(), description: "September", value: 130.0),
        ChartData(id: UUID(), description: "October", value: 230.0),
        ChartData(id: UUID(), description: "November", value: 330.0),
    ]
    @State var counter:Double
    var body: some View {
        NavigationStack{
            List(data){number in
                Text(String(describing:number.value))
                    .onTapGesture {
                        self.counter = number.value
                    }
                    .listRowBackground(self.counter == number.value ? Color.red : Color.clear)
            }.toolbar {
                ToolbarItem(placement: .bottomBar, content: {
                    Button {
                        makeNewArray()
                    } label: {
                        Text("New Array")
                    }
                    
                })
                ToolbarItem(placement: .bottomBar, content: {
                    Button {
                        data.removeAll()
                    } label: {
                        Text("Remove Array")
                    }
                    
                })
                ToolbarItem(placement: .bottomBar, content: {
                    Button {
                        data.sort { oldValue, newValue in
                            return oldValue.value < newValue.value
                        }
                    } label: {
                        Text("Sort Array")
                    }
                    
                })
                ToolbarItem(placement: .bottomBar, content: {
                    NavigationLink(
                        destination: 
                        ChartView(data:data),
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
    func makeNewArray(){
        data.append(ChartData(id: UUID(), description: "August", value: Double(Int.random(in: 0...1000))))
        data.append(ChartData(id: UUID(), description: "September", value: Double(Int.random(in: 0...1000))))
        data.append(ChartData(id: UUID(), description: "October", value: Double(Int.random(in: 0...1000))))
        data.append(ChartData(id: UUID(), description: "November", value: Double(Int.random(in: 0...1000))))
    }
}

#Preview {
    ContentView(counter: 0.0)
}
