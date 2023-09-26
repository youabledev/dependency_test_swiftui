//
//  SContentViewModel.swift
//  dependency test
//
//  Created by FramiOS on 2023/09/26.
//

import Foundation

class SContentViewModel: ObservableObject {
    @Published var alertTitle: String = ""
    @Published var alertSubTitle: String = ""
    @Published var isAlertShow: Bool = false
    
    func successToNetwork() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.alertTitle = "알림"
            self.alertSubTitle = "성공했습니다"
            self.isAlertShow = true
        }
    }
    
    func failToNetowork() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.alertTitle = "실패"
            self.alertSubTitle = "실패했습니다. 다음 기회에"
            self.isAlertShow = true
        }
    }
}
