//
//  SContentView.swift
//  dependency test
//
//  Created by FramiOS on 2023/09/26.
//

import SwiftUI

struct SContentView: View {
    @ObservedObject var viewModel = SContentViewModel()
    
    var body: some View {
        #if DEBUG
        let _ = print("content 업데이트 됨")
        #endif
        ZStack {
            HStack(spacing: 20) {
                Button("성공") {
                    viewModel.successToNetwork()
                }
                .buttonStyle(.borderedProminent)
                
                Button("실패") {
                    viewModel.failToNetowork()
                }
                .buttonStyle(.bordered)
                
            } //: HStack
            .padding()
            
            if viewModel.isAlertShow {
                SAlertView(title: $viewModel.alertTitle, subTitle: $viewModel.alertSubTitle, isShow: $viewModel.isAlertShow)
            }
        } //: ZStack
    }
}

struct SContentView_Previews: PreviewProvider {
    static var previews: some View {
        SContentView()
    }
}
