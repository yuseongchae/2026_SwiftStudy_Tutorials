//
//  MomentDetailView.swift
//  CH1_GratefulMoments
//
//  Created by 채유성 on 4/18/26.
//

import SwiftUI
import SwiftData

struct MomentDetailView: View {
    var moment: Moment
    @State private var showConfirmation = false // 진짜 삭제할건지 확인 용도
    
    @Environment(\.dismiss) private var dismiss // dismiss == 해고시키다 => 화면 닫기 위한 환경변수
    @Environment(DataContainer.self) private var dataContainer
    
    var body: some View {
        ScrollView {
            contentStack
        }
        .navigationTitle(moment.title)
        .toolbar {
            ToolbarItem(placement: .destructiveAction) {
                Button {
                    showConfirmation = true
                } label: {
                    Image(systemName: "trash")
                }
                .confirmationDialog("Delete Moment", isPresented:  $showConfirmation) { // 삭제할건지 물어보는 Dialog
                    Button("Delete Moment", role: .destructive) { // 진짜 삭제하면
                        dataContainer.context.delete(moment) // moment 삭제 후
                        try? dataContainer.context.save() // 저장
                        dismiss() // 화면 닫기
                    }
                } message: {
                    Text("The moment will be permanently deleted. Earned badges won't be removed.")
                }
            }
        }
    }
    
    private var contentStack: some View {
        VStack(alignment: .leading) {
            Text(moment.timestamp, style: .date)
                .font(.subheadline)
            Text("Timestamp")
            Text("Notes")
            if !moment.note.isEmpty { // 노트가 있을때만 보이게 하기
                Text(moment.note)
                    .textSelection(.enabled) // 텍스트 꾹 눌러서 복사 가능하게 하기
            }
            if let image = moment.image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .clipShape(RoundedRectangle(cornerRadius: 16))
            }
            
            Text("Image")
        }.frame(maxWidth: .infinity, alignment: .leading)
            .padding()
    }
}

#Preview {
    NavigationStack {
        MomentDetailView(moment: .imageSample)
            .sampleDataContainer()
    }
}
