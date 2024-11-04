//
//  ContentView.swift
//  ChartsExercise
//
//  Created by Ansheng Zhou on 2024-11-04.
//

import SwiftUI
import Charts

struct ContentView: View {
    let studentData = [
        ("SBI3U", 68.2, Color.blue), ("ENG3U", 67.0, Color.green),
        ("TEJ3M", 90.1, Color.orange), ("ICS3U", 69.3, Color.purple),
        ("CHW3M", 73.6, Color.red), ("MCR3U", 65.7, Color.cyan),
        ("BAF3M", 78.5, Color.yellow)
    ]
    
    var body: some View {
        VStack {
            Text("Report for: Tom Hanks")
                .font(.title)
                .padding(25)
            
            Chart {
                ForEach(studentData, id: \.0) { subject, grade, color in
                    BarMark(
                        x: .value("Subject", subject),
                        y: .value("Grade", grade)
                    )
                    .foregroundStyle(color)
                    .annotation(position: .overlay) {  // 标签显示在柱形中间
                        Text(String(format: "%.1f", grade))
                            .font(.caption)
                            .foregroundColor(.white)
                    }
                }
            }
            .chartYAxis {
                AxisMarks(position: .leading)
            }
            .chartXAxis {
                AxisMarks(position: .bottom)
            }
            .frame(height: 300)
            .padding()
            
            LegendView()
                .padding()
        }
    }
}

struct LegendView: View {
    var body: some View {
        HStack {
            LazyHStack {
                LazyVStack(alignment:.leading){
                    LegendItem(color: .red, text: "World History")
                    LegendItem(color: .cyan, text: "Functions")
                    LegendItem(color: .yellow, text: "Financial Accounting")
                }
            }
                LazyVStack(alignment:.leading) {
                    LegendItem(color: .blue, text: "Biology")
                    LegendItem(color: .green, text: "English")
                    LegendItem(color: .orange, text: "Computer Engineering Tech")
                    LegendItem(color: .purple, text: "Intro to Computer Science")
                }
            .padding()
        }
    }
}

struct LegendItem: View {
    let color: Color
    let text: String
    
    var body: some View {
        HStack {
            Circle()
                .fill(color)
                .frame(width: 10, height: 10)
            Text(text)
                .font(.caption)
        }.frame(width:300)
    }
}

#Preview {
    ContentView()
}
