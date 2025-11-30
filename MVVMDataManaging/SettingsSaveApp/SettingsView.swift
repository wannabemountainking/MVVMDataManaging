//
//  SettingsView.swift
//  MVVMDataManaging
//
//  Created by YoonieMac on 11/30/25.
//

import SwiftUI

struct SettingsView: View {
    
    @AppStorage("username") var username: String = ""
    @AppStorage("isDarkMode") var isDarkMode: Bool = false
    @AppStorage("isNotificationOn") var isNotificationOn: Bool = true
    @State private var tempName: String = ""
    @Environment(\.dismiss) var dismiss
    
    // 처음진입인지 수정시인지 구분 코드
    var isInitialSetup: Bool {
        username.isEmpty
    }
    
    var body: some View {
        VStack(spacing: 20) {
            Form {
                TextField("사용자 이름을 입력하세요", text: $tempName)
                    .padding(10)
                Toggle("다크모드", isOn: $isDarkMode)
                    .padding(10)
                Toggle("알림", isOn: $isNotificationOn)
                    .padding(10)
            }
            .font(.title3)
            .fontWeight(.semibold)
            
            Button {
                //action
                username = tempName
                if !isInitialSetup {
                    dismiss()
                }
            } label: {
                Text("완료")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
                    .padding(15)
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            }
            .padding(20)
            .disabled(tempName.isEmpty)
        }
        .onAppear {
            tempName = username
        }
        .navigationTitle("Settings")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarHidden(true)
    }
}

#Preview {
    SettingsView()
}
