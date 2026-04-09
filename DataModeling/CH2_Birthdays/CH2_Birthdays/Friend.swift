//
//  Friend.swift
//  CH2_Birthdays
//
//  Created by 채유성 on 4/9/26.
//

import Foundation
import SwiftData

@Model // Model은 initializer를 필요로 한다
class Friend {
    var name: String
    var birthday: Date
    
    // initializer는 모든 property에 값을 assign하여 instance를 생성한다.
    // structure는 각 property와 일치하는 artument를 가진 initializer를 생성한다
    // 그러나 class에는 자동 생성된 initializer가 없으므로 만들어야 한다
    init(name: String, birthday: Date) {
        self.name = name
        self.birthday = birthday
    }
    
    // 오늘 생일인지 아닌지
    var isBirthdayToday: Bool {
        Calendar.current.isDateInToday(birthday) // Calendar.current로 앱을 실행하는 장치에서 캘린더 기본 설정에 접근
    }
}
