//
//  MomentHexagonView.swift
//  CH1_GratefulMoments
//
//  Created by 채유성 on 4/18/26.
//

import SwiftUI

// MomentHexagonView will display moment data inside a Hexagon, applying the custom layout and adding app-specific content.
struct MomentHexagonView: View {
    var moment: Moment
    @State var layout: HexagonLayout = .standard
    @Environment(\.locale) private var locale
    
    var body: some View {
        Hexagon(layout: layout, moment: moment) {
            hexagonContent()
        }
    }
    
    private func hexagonContent() -> some View {
        ZStack(alignment: .bottom) {
            if showImage {
                Color.clear
                contentStack()
                    .frame(maxWidth: .infinity)
                    .padding(.top, 8)
                    .background(.ultraThinMaterial) // Meterial privides an easy way to add a blurred background to a view that automatically responds to scheme changes on the device.
            } else {
                Color.ember
                contentStack()
                    .frame(height: layout.size * 0.80)
            }
            
            Text(moment.timestamp.formatted(
                .dateTime.locale(locale)
                .month(.abbreviated).day()
            ))
            .font(.footnote)
            .padding(.bottom, layout.size * 0.08)
            .frame(maxWidth: layout.size / 3)
            .frame(maxHeight: layout.timestampHeight)
        }.foregroundStyle(.white)
    }
    
    private func contentStack() -> some View {
        VStack(alignment: .leading) {
            Text(moment.title)
                .font(layout.titleFont)
            if !moment.note.isEmpty, !showImage { // Display the note only when the moment has a note and no image
                Text(moment.note)
                    .font(layout.bodyFont)
            }
        }
        // Ensure all content fits within the hexagon's widest area by constraining the view's maximum width and height to that area
        .frame(maxWidth: layout.size * 0.80)
        .frame(maxHeight: layout.size * (showImage ? 0.15 : 0.50))
        .padding(.bottom, layout.size * layout.textBottomPadding)
        .fixedSize(horizontal: false, vertical: true)
    }
    
    private var showImage: Bool {
        moment.image != nil
    }
}

#Preview {
    ScrollView {
        MomentHexagonView(moment: Moment.imageSample)
        MomentHexagonView(moment: Moment.imageSample, layout: .large)
        MomentHexagonView(moment: Moment.sample)
        MomentHexagonView(moment: Moment.sample, layout: .large)
    }
}

#Preview("English language, region Great Britian") {
    MomentHexagonView(moment: Moment.imageSample)
        .environment(\.locale, Locale(identifier: "en_GB"))
}


#Preview("Spanish language") {
    MomentHexagonView(moment: Moment.imageSample)
        .environment(\.locale, Locale(identifier: "es"))
}
