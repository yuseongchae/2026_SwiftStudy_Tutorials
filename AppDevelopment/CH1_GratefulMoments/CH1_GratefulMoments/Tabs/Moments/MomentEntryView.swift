//
//  MomentEntryView.swift
//  CH1_GratefulMoments
//
//  Created by 채유성 on 4/17/26.
//

import SwiftUI
import PhotosUI
import SwiftData

struct MomentEntryView: View {
    @State private var title = ""
    @State private var note = ""
    @State private var imageData: Data?
    @State private var newImage: PhotosPickerItem?
    @State private var isShowingCancelConfirmation = false
    
    @Environment(\.dismiss) private var dismiss
    @Environment(DataContainer.self) private var dataContainer
    
    var body: some View {
        NavigationStack
        {
            ScrollView { // 키보드가 나타났을 때도 접근 가능하도록 스크롤뷰로 감싸기
                contentStack // to encapsulate the view's layout in an easy-to-understand component
            }
            .scrollDismissesKeyboard(.interactively) // 스크롤시 키보드가 자동으로 내려감
            .navigationTitle("Grateful for")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel", systemImage: "xmark") {
                        // 데이터가 있을 때만 경고창 띄우기
                        if title.isEmpty, note.isEmpty, imageData == nil {
                            dismiss()
                        } else {
                            isShowingCancelConfirmation = true
                        }
                    }
                    .confirmationDialog("Discard Moment", isPresented: $isShowingCancelConfirmation) {
                        Button("Discard Moment", role: .destructive) {
                            dismiss()
                        }
                    }
                }
                
                ToolbarItem(placement: .confirmationAction) {
                    Button("Add", systemImage: "checkmark") {
                        let newMoment = Moment(
                            title: title,
                            note: note,
                            imageData: imageData,
                            timestamp: .now
                        )
                        dataContainer.context.insert(newMoment)
                        do {
                            try dataContainer.badgeManager.unlockBadges(newMoment: newMoment) // unlock badges when the person using the app creates a moment
                            try dataContainer.context.save() // 데이터 저장
                            dismiss()
                        } catch {
                            // Don't dismiss
                        }
                    }.disabled(title.isEmpty) // title이 empty면 disable
                }
            }
        }
    }
    
    private var photoPicker: some View {
        PhotosPicker(selection: $newImage) { // PhotosPicker로 감싸서 동작하게 만들기 (버튼처럼 작동)
            Group {
                
                if let imageData, let uiImage = UIImage(data: imageData) {
                    Image(uiImage: uiImage)
                        .resizable()
                        .scaledToFit() // 사진 비율 유지 (to maintain the aspect ratio of the selected photo)
                    
                } else {
                    Image(systemName: "photo.badge.plus.fill")
                        .font(.largeTitle)
                        .frame(height: 250)
                        .frame(maxWidth: .infinity)
                        .background(Color(white: 0.4, opacity: 0.32))
                }
            }.clipShape(RoundedRectangle(cornerRadius: 16))
        }
        .onChange(of: newImage) {
            guard let newImage else { return }
            Task {
                imageData = try await newImage.loadTransferable(type: Data.self) // loadTransferable을 통해 사진을 Data format으로 변경
            }
        }
    }
    
    var contentStack: some View {
        VStack(alignment: .leading) {
            TextField(text: $title) {
                Text("Title (Required)")
            }
            .font(.title.bold())
            .padding(.top, 48)
            Divider()
            
            TextField("Log your small wins", text: $note, axis: .vertical)
                .multilineTextAlignment(.leading)
                .lineLimit(5...Int.max) // 최소 5줄 이상 입력할 수 있게 설정
            
            photoPicker
        }
        .padding()
    }
}


#Preview {
    MomentEntryView()
        .sampleDataContainer()
}
