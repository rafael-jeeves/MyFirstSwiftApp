//
//  SettingsView.swift
//  MyFirstSwiftApp
//
//  Created by Rafael Guerra Evangelista on 07/08/25.
//

import SwiftUI

struct User {
    let firstName: String
    let lastName: String
    let email: String
    
    var fullName: String {
        "\(firstName) \(lastName)"
    }
    
    var initials: String{
        let firstInitial = firstName.first?.uppercased() ?? ""
        let lastInitial = lastName.first?.uppercased() ?? ""
        return "\(firstInitial)\(lastInitial)"
    }
}

struct SettingsView: View {
    
    let user = User(firstName: "Rafael", lastName: "Evangelista", email: "rafael.evangelista@tryjeeves.com")
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20){
                VStack(spacing:8){
                    ZStack{
                        Circle()
                            .fill(Color.blue.opacity(0.8))
                            .frame(width: 140, height: 140)
                        
                        Text(user.initials)
                            .font(.system(size: 60, weight: .bold))
                            .foregroundColor(.white)
                    }
                    
                    
                    Text(user.fullName)
                        .font(.title)
                        .fontWeight(.semibold)
                    
                    Text(user.email)
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                }
                .padding(.top)
                
                List{
                    Section(header:Text("Account")){
                        SettingsRowView(iconName: "person.fill", title: "Edit Profile", iconColor: .blue)
                        SettingsRowView(iconName: "lock.fill", title: "Change Password", iconColor: .gray)
                    }
                    Section(header:Text("App")){
                        SettingsRowView(iconName: "bell.fill", title: "Notifications", iconColor: .red)
                        SettingsRowView(iconName: "hand.raised.fill", title: "Edit Profile", iconColor: .green)
                        SettingsRowView(iconName: "questionmark.circle.fill", title: "Help", iconColor: .orange)
                    }
                }.listStyle(InsetGroupedListStyle())
            }.navigationTitle("Settings")
        }
    }
}

struct SettingsRowView: View {
    let iconName: String
    let title: String
    let iconColor: Color

    var body: some View {
        HStack(spacing: 15) {
            Image(systemName: iconName)
                .font(.headline)
                .foregroundColor(.white)
                .frame(width: 35, height: 35)
                .background(iconColor)
                .cornerRadius(8)

            Text(title)
                .font(.body)
            
            Spacer()

            Image(systemName: "chevron.right")
                .foregroundColor(.secondary)
        }
        .padding(.vertical, 4)
    }
}


#Preview {
    SettingsView()
}
