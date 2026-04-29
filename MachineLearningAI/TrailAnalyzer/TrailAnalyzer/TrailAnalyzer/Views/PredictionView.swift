//
//  PredictionView.swift
//  TrailAnalyzer
//
//  Created by 채유성 on 4/29/26.
//

import SwiftUI


struct PredictionView: View {
    @State var predictedRisk: Risk


    var body: some View {
        VStack {
            RiskCard(risk: predictedRisk)
            Spacer()
        }
        .navigationTitle("Results")
        .navigationBarTitleDisplayMode(.large)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                NavigationLink {
                    riskSummaryView
                } label: {
                    Image(systemName: "info.circle")
                }
            }
        }
        .trailTheme()
    }


    var riskSummaryView: some View {
        ScrollView {
            ForEach(Risk.allCases) {
                RiskCard(risk: $0)
            }
        }
        .trailTheme()
    }
}


#Preview {
    NavigationStack {
        PredictionView(predictedRisk: .moderate)
    }
}
