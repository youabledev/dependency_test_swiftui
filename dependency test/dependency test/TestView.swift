//
//  TestView.swift
//  dependency test
//
//  Created by zumin you on 2023/10/03.
//

import SwiftUI



struct ParentView: View {
    @State private var isActive: Bool = false
    
    var body: some View {
        VStack {
            VStack {
                Text("상위 뷰입니다.")
                Button {
                    isActive.toggle()
                } label: {
                    Text("상위 뷰 업데이트")
                }
                .buttonStyle(.borderedProminent)
            } //: VStack
            .padding(10)
            .background(isActive ? .yellow : .gray)
            if isActive {
                ChildView()
            } else {
                ChildView()
            }
        } //: VStack
        .padding(.top, 20)
    }
}

#Preview {
    ParentView()
}

struct ChildView: View {
    @StateObject var viewModel = UserViewModel()
    
    var body: some View {
        VStack {
            List {
                ForEach(viewModel.userNames) { user in
                    Text(user.name)
                }
            }
            
            Button {
                viewModel.addUser()
            } label: {
                Text("하위 뷰 업데이트")
            }
            .buttonStyle(.borderedProminent)
        }
    }
}

struct User: Identifiable {
    let id: UUID = UUID()
    let name: String
}

class UserViewModel: ObservableObject {
    @Published var userNames = [User]()
    
    func addUser() {
        userNames.append(User(name: "user\(userNames.count)"))
    }
}
