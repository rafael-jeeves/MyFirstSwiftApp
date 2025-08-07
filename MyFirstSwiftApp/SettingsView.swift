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
    
    let mockedUser = User(firstName: "Rafael", lastName: "Evangelista", email: "rafael.evangelista@tryjeeves.com")
    
    var body: some View {
        NavigationView {
            // The List is now the main container for all content.
            // The outer VStack has been removed.
            List {
                // --- USER INFO HEADER ---
                // This VStack is now the first item inside the List, so it will scroll.
                VStack(spacing: 8) {
                    ZStack {
                        Circle()
                            .fill(Color.blue.opacity(0.8))
                            .frame(width: 140, height: 140)
                        
                        Text(mockedUser.initials)
                            .font(.system(size: 60, weight: .bold))
                            .foregroundColor(.white)
                    }
                    
                    Text(mockedUser.fullName)
                        .font(.title)
                        .fontWeight(.semibold)
                    
                    Text(mockedUser.email)
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                }
                // --- MODIFIERS FOR HEADER STYLING ---
                // This centers the VStack content horizontally within the list cell.
                .frame(maxWidth: .infinity, alignment: .center)
                // This removes the default padding that the list adds to its rows.
                .listRowInsets(EdgeInsets())
                // This makes the background of the header's "cell" transparent.
                .listRowBackground(Color.clear)
                // Add some vertical padding to give it space.
                .padding(.vertical, 20)
                
                Section(header: Text("Account")) {
                                // Each row is now wrapped in a NavigationLink
                                NavigationLink(destination: EditProfileView()) {
                                    SettingsRowView(iconName: "person.fill", title: "Edit Profile", iconColor: .blue)
                                }
                                
                                // This one links to the view you provided
                                NavigationLink(destination: ChangePasswordView()) {
                                    SettingsRowView(iconName: "lock.fill", title: "Change Password", iconColor: .gray)
                                }
                            }
                            
                            // --- APP SECTION ---
                            Section(header: Text("App")) {
                                NavigationLink(destination: NotificationsView()) {
                                    SettingsRowView(iconName: "bell.fill", title: "Notifications", iconColor: .red)
                                }
                                
                                NavigationLink(destination: PrivacyView()) {
                                    SettingsRowView(iconName: "hand.raised.fill", title: "Privacy", iconColor: .green)
                                }
                                
                                NavigationLink(destination: HelpView()) {
                                    SettingsRowView(iconName: "questionmark.circle.fill", title: "Help", iconColor: .orange)
                                }
                            }
            }
            .listStyle(InsetGroupedListStyle())
            .navigationTitle("Settings")
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
            
            // A Spacer is still useful to make the whole row tappable
            Spacer()

            // The manual chevron Image has been removed from here.
        }
        .padding(.vertical, 4)
    }
}


#Preview {
    SettingsView()
}
