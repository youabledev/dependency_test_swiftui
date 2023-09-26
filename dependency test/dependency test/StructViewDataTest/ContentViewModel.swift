//
//  ContentViewModel.swift
//  dependency test
//
//  Created by FramiOS on 2023/09/26.
//

import Foundation

class ContentViewModel: ObservableObject {
    @Published var alertViewData: AlertViewData
    
    init() {
        self.alertViewData = AlertViewData()
    }
    
    func successToNetwork() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.alertViewData.title = "알림"
            self.alertViewData.subTitle = "성공했습니다"
            self.alertViewData.isShow = true
        }
    }
    
    func failToNetowork() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.alertViewData.title = "실패"
            self.alertViewData.subTitle = "실패했습니다. 다음 기회에"
            self.alertViewData.isShow = true
        }
    }
    
}
