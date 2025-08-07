//
//  ContentView.swift
//  MyFirstSwiftApp
//
//  Created by Rafael Guerra Evangelista on 07/08/25.
//

import SwiftUI


struct CardInfo {
    let cardholderName: String
    let lastFourDigits: String
    let balance: Double
}

struct Transaction: Identifiable {
    let id = UUID()
    let merchant: String
    let amount: Double
    let date : String
    let iconName : String
    let color : Color
}

struct ContentView: View {
    let mockedCard = CardInfo(
        cardholderName: "Rafael Evangelista",
        lastFourDigits: "1234",
        balance: 2754.84
    )
    
    let mockedTransactions: [Transaction] = [
        Transaction(merchant: "Apple Store", amount: 999.00, date: "Aug 7", iconName: "apple.logo", color: .black),
        Transaction(merchant: "Gas Station", amount: 45.50, date: "Aug 6", iconName: "fuelpump.fill", color: .orange),
        Transaction(merchant: "Grocery Store", amount: 78.21, date: "Aug 5", iconName: "cart.fill", color: .green),
        Transaction(merchant: "Coffee Shop", amount: 5.75, date: "Aug 5", iconName: "cup.and.saucer.fill", color: .brown),
        Transaction(merchant: "Bookstore", amount: 25.00, date: "Aug 4", iconName: "book.fill", color: .blue)
            
    ]
    
    var body: some View {
        NavigationView{
            ScrollView{
                VStack(spacing:20){
                    BalanceCardView(cardInfo: mockedCard).padding(.horizontal)
                    
                    VStack(alignment: .leading){
                        ForEach(mockedTransactions, id: \.id){ transaction in
                            TransactionRowView(transaction: transaction)
                        }
                    }
                    .padding()
                    .background(Color(UIColor.systemGray6))
                    .cornerRadius(20)
                    .padding(.horizontal)
                    
                }
                .padding(.top)
            }.navigationTitle("Home")
        }
        
    }
}

struct BalanceCardView: View {
    let cardInfo: CardInfo

    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            HStack {
                Text("Current Balance")
                    .font(.subheadline)
                    .foregroundColor(.white.opacity(0.8))
                Spacer()
                // A decorative icon
                Image(systemName: "wave.3.right.circle.fill")
                    .font(.title2)
            }

            // We use String(format:) to ensure the balance always shows two decimal places.
            Text(String(format: "$%.2f", cardInfo.balance))
                .font(.system(size: 36, weight: .bold))

            Spacer() // Pushes the bottom content down.

            HStack {
                Text(cardInfo.cardholderName)
                    .font(.callout)
                    .fontWeight(.medium)
                Spacer()
                Text("**** \(cardInfo.lastFourDigits)")
                    .font(.callout)
                    .fontWeight(.medium)
            }
        }
        .padding(25)
        .frame(height: 200)
        .foregroundColor(.white)
        .background(
            LinearGradient(gradient: Gradient(colors: [.black, .blue]), startPoint: .topLeading, endPoint: .bottomTrailing)
        )
        .cornerRadius(20)
        .shadow(color: .gray.opacity(0.5), radius: 10, y: 5)
    }
}

struct TransactionRowView: View {
    let transaction: Transaction

    var body: some View {
        HStack(spacing: 15) {
            Image(systemName: transaction.iconName)
                .font(.title3)
                .foregroundColor(.white)
                .frame(width: 45, height: 45)
                .background(transaction.color)
                .cornerRadius(10)

            VStack(alignment: .leading) {
                Text(transaction.merchant)
                    .fontWeight(.semibold)
                Text(transaction.date)
                    .font(.caption)
                    .foregroundColor(.secondary)
            }

            Spacer()

            // The expense amount
            Text(String(format: "-$%.2f", transaction.amount))
                .fontWeight(.bold)
        }
        .padding(.vertical, 8)
    }
        
}

#Preview {
    ContentView()
}
