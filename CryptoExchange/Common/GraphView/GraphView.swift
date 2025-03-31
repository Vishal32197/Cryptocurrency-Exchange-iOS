//
//  GraphView.swift
//  CryptoExchange
//
//

import UIKit
import Stevia
import RxSwift
import Charts

class GraphView: LineChartView {
    
    private var chartView: CombinedChartView = {
        let view = CombinedChartView()
        view.xAxis.drawGridLinesEnabled = false
        view.leftAxis.drawAxisLineEnabled = false
        view.rightAxis.enabled = false
        view.xAxis.labelPosition = .bottom
        view.xAxis.granularityEnabled = true
        view.xAxis.granularity = 1
        view.tintColor = .blue
        view.legend.enabled = true
        view.backgroundColor = .white
        return view
    }()
    
    init() {
        super.init(frame: .zero)
        self.setupViewLayout()
        self.bindView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViewLayout() {
        self.subviews {
            chartView
        }
        
        chartView.fillContainer()
    }
    
    private func bindView() {
        chatgrpt()
    }
    
    private func chatgrpt() {
        // Sample data for demonstration
        let barDataEntries: [BarChartDataEntry] = [
            BarChartDataEntry(x: 0, y: 10),
            BarChartDataEntry(x: 1, y: 20),
            BarChartDataEntry(x: 2, y: 15),
            BarChartDataEntry(x: 3, y: 25),
            BarChartDataEntry(x: 4, y: 18),
            BarChartDataEntry(x: 5, y: 30)
        ]
        
        let priceData: [PriceData] = [PriceData(priceUsd: "6379.3997635993342453", time: 1530403200000), PriceData(priceUsd: "6601.0724971279524219", time: 1617201365), PriceData(priceUsd: "6629.1362927171773870", time: 1617201365), PriceData(priceUsd: "6655.9108972488685303", time: 1617201365)]
        let barDataSet = BarChartDataSet(entries: barDataEntries, label: "Bar Data")
        barDataSet.colors = [UIColor.red]
        let data = CombinedChartData()
        data.barData = BarChartData(dataSet: barDataSet)
        chartView.data = data
        let startDays = priceData.compactMap { $0.time }
        var days: [String] = []
        for startDay in startDays {
            days.append(startDay.toDayString())
        }
        chartView.xAxis.valueFormatter = IndexAxisValueFormatter(values: days)
        chartView.xAxis.labelPosition = .bottom
        chartView.xAxis.granularity = 1
        chartView.leftAxis.axisMinimum = 0
        chartView.rightAxis.axisMinimum = 0
        chartView.animate(xAxisDuration: 1.0)
    }
}

struct PriceData: Codable {
    let priceUsd: String
    let time: TimeInterval
}

extension TimeInterval {
    func toDayString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd" // Customize the date format as per your requirement
        let date = Date(timeIntervalSince1970: self)
        return dateFormatter.string(from: date)
    }
}
