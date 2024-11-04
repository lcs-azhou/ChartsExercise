//
//  ExerciseTwoView.swift
//  ChartsExercise
//
//  Created by Ansheng Zhou on 2024-11-04.
//

import SwiftUI
import Charts

struct ExerciseTwoView: View {
    let houseData = [
        ("Matthews", 12.3, Color.red), ("Ross", 5.2, Color.orange),
        ("Moodie", 6.2, Color.yellow), ("Parent", 6.2, Color.green),
        ("Ondaatje", 7.6, Color.mint), ("Uplands", 8.1, Color.teal),
        ("Memorial", 9.5, Color.blue), ("Colebrook", 9.0, Color.indigo),
        ("Grove", 10.4, Color.purple), ("Rashleigh", 9.5, Color.pink),
        ("Cooper", 8.1, Color.cyan), ("Ryder", 8.1, Color.brown)
    ]
    
    var body: some View {
        VStack {
            Text("Percentage of students at LCS, by house")
                .font(.title)
                .padding()
            
            Chart {
                ForEach(houseData, id: \.0) { house, percentage, color in
                    SectorMark(
                        value: .value("Percentage", percentage),
                        label: .value("House", house)
                    )
                    .foregroundStyle(color)
                    .annotation(position: .overlay) {
                        Text("\(String(format: "%.1f", percentage))%")
                            .font(.caption)
                            .foregroundColor(.white)
                    }
                }
            }
            .frame(height: 300)
            .padding()
            
            LegendView2()
        }
    }
}

struct LegendView2: View {
    let columns = [GridItem(.adaptive(minimum: 120))]
    
    var body: some View {
        LazyVGrid(columns: columns, alignment: .leading, spacing: 10) {
            LegendItem2(color: .red, text: "Matthews")
            LegendItem2(color: .orange, text: "Ross")
            LegendItem2(color: .yellow, text: "Moodie")
            LegendItem2(color: .green, text: "Parent")
            LegendItem2(color: .mint, text: "Ondaatje")
            LegendItem2(color: .teal, text: "Uplands")
            LegendItem2(color: .blue, text: "Memorial")
            LegendItem2(color: .indigo, text: "Colebrook")
            LegendItem2(color: .purple, text: "Grove")
            LegendItem2(color: .pink, text: "Rashleigh")
            LegendItem2(color: .cyan, text: "Cooper")
            LegendItem2(color: .brown, text: "Ryder")
        }
        .padding()
    }
}

struct LegendItem2: View {
    let color: Color
    let text: String
    
    var body: some View {
        HStack {
            Circle()
                .fill(color)
                .frame(width: 10, height: 10)
            Text(text)
                .font(.caption)
        }
    }
}


#Preview {
    ExerciseTwoView()
}
