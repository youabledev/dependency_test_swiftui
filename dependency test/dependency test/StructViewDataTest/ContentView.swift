//
//  ContentView.swift
//  dependency test
//
//  Created by FramiOS on 2023/09/26.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = ContentViewModel()
    
    var body: some View {
        let _ = print("content 업데이트 됨")
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
            
            if viewModel.alertViewData.isShow {
                AlertView(viewData: $viewModel.alertViewData)
            }
        } //: ZStack
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
