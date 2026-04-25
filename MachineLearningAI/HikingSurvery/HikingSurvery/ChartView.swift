//
//  ChartView.swift
//  HikingSurvery
//
//  Created by 채유성 on 4/25/26.
//

// Display aggregated sentiment scores view

import SwiftUI
import Charts


struct ChartView: View {
    var responses: [Response]
    
    init(responses: [Response]) {
        self.responses = responses.sorted { $0.score < $1.score } // 점수에 따라 정렬되도록 설정
    }
    
    var body: some View {
        Chart(responses) { response in
            // 도넛처럼 보이도록 innerRadius 설정
            SectorMark(angle: .value("Type", 1), innerRadius: .ratio(0.75), outerRadius: .ratio(0.8)) // Each SectorMark represents a portion of data within the chart.
            // .value assigns a relative weight to the value.
                .foregroundStyle(by: .value("sentiment", response.sentiment)) // sentiment에 따라 다르게 보이도록 하기
        }
        .chartForegroundStyleScale([ // 스타일 커스텀
            Sentiment.positive : Sentiment.positive.sentimentColor,
            Sentiment.negative : Sentiment.negative.sentimentColor,
            Sentiment.moderate : Sentiment.moderate.sentimentColor
                                   ])
        // chartProxy can provide real-time information on the layout of the chart graphic itself, rather than the full chart view including the legend.
        // chartProxy는 차트 “그래프 영역 자체”의 위치/크기 정보를 실시간으로 알려준다
        // 단 전체 View(padding 포함) 말고 그래프 그려지는 영역만 기준
        // 이 정보를 제대로 쓰려면 GeometryReader로 감싸서 읽어야 한다
        //  GeometryReader : 자기 자신의 크기와 좌표 기준으로 내부 뷰를 다루는 컨테이너
        .chartBackground { chartProxy in
            GeometryReader { geometry in
                if let anchor = chartProxy.plotFrame { // 데이터가 비어있을 경우 대비
                    let frame = geometry[anchor]
                    Image(systemName: "figure.hiking")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: frame.height * 0.4)
                        .foregroundStyle(Color(white: 0.59))
                        .position(x: frame.midX, y: frame.midY)
                }
            }
            
        }
        .chartLegend(position: .trailing, alignment: .center) // legend(범례)가 오른쪽으로 위치하도록 설정
        .frame(height: 200) // 차트 크기 설정
        .padding()
    }
}


#Preview {
    ContentView()
}
