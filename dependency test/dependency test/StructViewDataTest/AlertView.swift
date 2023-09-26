//
//  AlertView.swift
//  dependency test
//
//  Created by FramiOS on 2023/09/26.
//

import SwiftUI

struct AlertView: View {
    @Binding var viewData: AlertViewData
    
    var body: some View {
        #if DEBUG
        let _ = Self._printChanges()
        let _ = print("alert 업데이트 됨")
        #endif
        ZStack {
            Color.black.opacity(0.8)
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                Group {
                    Text(viewData.title)
                        .font(.title)
                    Text(viewData.subTitle)
                        .font(.body)
                    
                    Button {
                        viewData.isShow = false
                    } label: {
                        Text("확인")
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding(.horizontal, 40)
                            .padding(.vertical, 10)
                            .background(.black)
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(20)
            } //: HStack
            .background(.white)
            .padding(.horizontal, 20)
        } //: ZStack
    }
}

struct AlertView_Previews: PreviewProvider {
    static var previews: some View {
        AlertView(viewData: .constant(AlertViewData(title: "title", subTitle: "subtitle", isShow: true)))
    }
}
