//
//  SAlertView.swift
//  dependency test
//
//  Created by FramiOS on 2023/09/26.
//

import SwiftUI

struct SAlertView: View {
    
    @Binding var title: String
    @Binding var subTitle: String
    @Binding var isShow: Bool
    
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
                    Text(title)
                        .font(.title)
                    Text(subTitle)
                        .font(.body)
                    
                    Button {
                        isShow = false
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

struct SAlertView_Previews: PreviewProvider {
    static var previews: some View {
        SAlertView(title: .constant("test"), subTitle: .constant("subtitle"), isShow: .constant(true))
    }
}
