//
//  MomentsView.swift
//  CH1_GratefulMoments
//
//  Created by 채유성 on 4/18/26.
//

import SwiftUI
import SwiftData

struct MomentsView: View {
    
    @State private var showCreateMoment = false
    @Query(sort: \Moment.timestamp)
    private var moments: [Moment]
    
    static let offsetAmount: CGFloat = 70.0
    
    var body: some View {
        NavigationStack {
            ScrollView {
                
                // VStack과 공통점/차이점
                // 공통점 : 외관상 똑같이 작동함
                // 차이점 : 모든 View를 한꺼번에 만드는 대신 필요할 때(화면에 보일 때) View를 생성
                // => Lazy stacks are much more efficient when you have more data and views to display. (표시할 데이터가 많은 경우에는 LazyVStack을 쓰는게 메모리 측면에서 효율적임)
                LazyVStack(spacing: 8, pinnedViews: .sectionHeaders) {
                    Section {
                        pathItems
                            .frame(maxWidth: .infinity)
                    } header: {
                        streakHeader
                    }
                }
                
            }.overlay {
                if moments.isEmpty { // moment가 비어있을 경우
                    ContentUnavailableView { // 데이터가 없을 때 보여주는 뷰를 활용해
                        Label("No moments yet!", systemImage: "exclamationmark.circle.fill") // 알려주기
                    } description: {
                        Text("Post a note or photo to start filling this space with gratitude.")
                    }
                }
            }
            
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button {
                        showCreateMoment = true // 버튼 누르면 Moment 나오도록
                    } label: {
                        Image(systemName: "plus")
                    }
                    .sheet(isPresented: $showCreateMoment) {
                        MomentEntryView()
                    }
                }
            }
            .defaultScrollAnchor(.bottom, for: .initialOffset) // 시작 화면을 아래로 고정 (initialOffset : 사용자가 앱을 처음 열었을 때 어디를 보여줄 것인가?)
            .defaultScrollAnchor(.bottom, for: .sizeChanges) // 콘텐츠 크기 변화시 화면 위치를 아래로 고정
            .defaultScrollAnchor(.top, for:.alignment)
            .navigationTitle("Grateful Moments")
        }
    }
    
    private var pathItems: some View {
        ForEach(moments.enumerated(), id: \.0) { index, moment in
            NavigationLink { // moment의 title을 눌렀을 때 DetailView로 이동하도록 함
                MomentDetailView(moment: moment)
            } label: {
                if moment == moments.last {
                    MomentHexagonView(moment: moment, layout: .large)
                } else {
                    MomentHexagonView(moment: moment)
                        .offset(x: sin(Double(index) * .pi / 2) * Self.offsetAmount) // 지그재그 패턴으로 놓기
                }
            }
            .scrollTransition { content, phase in // Fade out completely when scrolling away and reduce the size of the hexagon down to 80%
                content
                    .opacity(phase.isIdentity ? 1 : 0) // Identity Phase와 Transition Phase를 나눔 (각각 제자리에 가만히 있는 상태 / 움직이거나 변하고 있는 상태)
                    .scaleEffect(phase.isIdentity ? 1 : 0.8) // 가만히 있으면 크기 그대로 / 움직이면 크기 80%로 줄이기
                
            }
        }
    }
    
    @ViewBuilder private var streakHeader: some View {
        let streak = StreakCalculator().calculateStreak(for: moments)
        if streak > 0 {
            HStack {
                Text(verbatim: "\(streak)")
                Text(Image(systemName: "flame.fill"))
                    .foregroundStyle(.ember)
                Spacer()
            }
            .font(.subheadline)
            .padding()
        }
    }
}

#Preview {
    MomentsView()
        .sampleDataContainer()
}

#Preview("No moments") {
    MomentsView()
        .modelContainer(for: [Moment.self])
        .environment(DataContainer())
}
