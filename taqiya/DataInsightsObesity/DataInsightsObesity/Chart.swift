//
//  Chart.swift
//  DataInsightsObesity
//
//  Created by Harini Senthilkumar on 4/2/23.
//

//
//  ContentView.swift
//  Charts
//
//  Created by Harini Senthilkumar on 3/29/23.
//

import SwiftUI
import SwiftUICharts


struct ContentView: View {
    var body: some View {
        VStack {
            Text("Mississippi Patients with Obesity")
                .font(.system(size: 65, weight: .light, design: .serif))
                .bold()
                .multilineTextAlignment(.center)
            BarChartView(data: ChartData(values: [("Hypertension", 310836),("T2D", 156630),("Cancer", 21479),("Respiratory", 102480),("Stroke", 68193)]), title: "True Values", legend: "People",form: ChartForm.medium,valueSpecifier: "%.0f")
            BarChartView(data: ChartData(values: [("Hypertension", 407195),("T2D", 225547),("Cancer", 19331),("Respiratory", 109654),("Stroke", 59328)]), title: "Predicted Values", legend: "People",form: ChartForm.medium,valueSpecifier: "%.0f")
            PieChartView(data: [40,34,27], title: "Weight Percentages", legend: "Legendary")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

