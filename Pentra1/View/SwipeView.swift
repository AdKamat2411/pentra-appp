//
//  SwipeView.swift
//  TinderClone
//
//  Created by Aditya Kamat on 08/10/2023.
//

import SwiftUI
import Kingfisher

struct SwipeView: View {
    @StateObject var viewModel = SwipeViewModel()
    @State var isMatch = false
    
    var body: some View {
        let onLike: (_ card: Card) -> () = { card in
            Task {
                await viewModel.onLike(likeCard: card) {
                    isMatch.toggle()
                }
            }
        }
        let onDislike: (_ card: Card) -> () = { card in
            Task {
                await viewModel.onDislike(dislikeCard: card)
            }
        }
        
        
        NavigationStack {
            ZStack {
                // Set the background color here
                Color(red: 161/255, green: 69/255, blue: 56/255)
                    .edgesIgnoringSafeArea(.all)
                VStack{
                    if viewModel.potentialCards.isEmpty {
                        Spacer()
                        Text("No profile available")
                        Spacer()
                    } else {
                        ZStack{
                            
                            let card1 = viewModel.potentialCards[viewModel.currentIndex]
                            
                            NavigationLink(value: card1) {
                                CardView(card: card1,
                                         onLike: onLike,
                                         onDislike: onDislike,
                                         currentIndex: $viewModel.currentIndex,
                                         totalCards: viewModel.potentialCards.count)
                                .id(viewModel.currentIndex)
                            }
                            .navigationDestination(for: Card.self) { card in
                                BrandDescription(user: card1.user)
                            }
                        }
                    }
                }.background(Color(red: 161/255, green: 69/255, blue: 56/255))
                // Set the background color
                
                if $viewModel.isLoading.wrappedValue {
                    LoadingOverlayView()
                }
            }
            .alert("Match", isPresented: $isMatch) {
                Button("OK", role: .cancel) {
                    isMatch.toggle()
                }
            }
        }
    }
}



struct CardView: View {
    @State private var card: Card
    var onLike: (_ card: Card) -> ()
    var onDislike: (_ card: Card) -> ()
    let cardGradient = Gradient(colors: [Color.black.opacity(0), Color.black.opacity(0.1)])
    // ADD THESE
    @Binding var currentIndex: Int
    var totalCards: Int
    
    init(card: Card, onLike: @escaping (_ card: Card) -> (), onDislike: @escaping (_ card: Card) -> (), currentIndex: Binding<Int>, totalCards: Int) {
        self._card = State(initialValue: card)
        self.onLike = onLike
        self.onDislike = onDislike
        self._currentIndex = currentIndex
        self.totalCards = totalCards
    }
    
    
    
    var body: some View {
        VStack{
            //Card View
            
            ZStack(alignment: .topLeading){
                GeometryReader{ geo in
                    
                    if let imageUrl = card.user.profileImageUrl {
                        KFImage(URL(string: imageUrl))
                            .resizable()
                            .scaledToFill()
                            .frame(width: geo.size.width, height: geo.size.height)
                            .clipped()
                        
                        
                    } else {
                        Image(systemName: "person")
                            .resizable()
                            .scaledToFill()
                            .frame(width: geo.size.width, height: geo.size.height)
                            .clipped()
                            .foregroundColor(.white)
                    }
                    
                }
                
                LinearGradient(gradient: cardGradient, startPoint: .top, endPoint: .bottom)
                
                ZStack {
                    GeometryReader { geo in
                        VStack {
                            Spacer()
                            HStack {
                                Text(card.user.name)
                                    .font(
                                        Font.custom("Old Standard TT", size: 24)
                                            .weight(.bold)
                                    )
                                    .foregroundColor(Color(red: 0.15, green: 0.15, blue: 0.15))
                                    .frame(width: 275, height: 39, alignment: .topLeading)
                                
                                if let age = card.user.age {
                                    Text(String(age))
                                        .font(.largeTitle)
                                }
                            }
                            .padding()
                            .foregroundColor(.white)
                            .background(
                                Rectangle()
                                    .foregroundColor(.white)
                                    .frame(width: geo.size.width+120, height: 80)  // Set the width here
                                    .cornerRadius(10)
                            )
                        }
                    }
                }
                
                //like label
                HStack {
                    Image("left-arrow")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 150)
                        .opacity(Double(card.x / 10 - 1))
                    Spacer()
                    Image("right-arrow")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 150)
                        .opacity(Double(card.x / 10 * -1 - 1))
                }
            }
            .cornerRadius(16)
            .padding(10)
            .offset(x: card.x, y: card.y)
            .rotationEffect(.init(degrees: card.degree))
            .gesture(DragGesture()
                .onChanged({ value in
                    withAnimation(.default){
                        card.x = value.translation.width
                        card.y = value.translation.height
                        card.degree = 7 * (value.translation.width > 0 ? 1 : -1)
                    }
                })
                    .onEnded({ value in
                        withAnimation(.interpolatingSpring(mass: 1, stiffness: 50, damping: 5, initialVelocity: 0)) {
                            switch value.translation.width {
                            case 0...100:
                                card.x = 0
                                card.y = 0
                                card.degree = 0
                            case let x where x > 100:
                                if currentIndex > 0 {  // Not the first card
                                    card.x = 1000
                                    card.degree = 12
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                        currentIndex -= 1
                                    }
                                } else {  // Reset if it's the first card
                                    card.x = 0
                                    card.degree = 0
                                }
                            case (-100)...(-1):
                                card.x = 0
                                card.y = 0
                                card.degree = 0
                            case let x where x < -100:
                                if currentIndex < totalCards - 1 {  // Not the last card
                                    card.x = -1000
                                    card.degree = -12
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                        currentIndex += 1
                                    }
                                } else {  // Reset if it's the last card
                                    card.x = 0
                                    card.degree = 0
                                }
                            default:
                                card.x = 0
                                card.y = 0
                            }
                        }
                    })
                     
            )
            
            //Buttons View
            HStack{
                Spacer()
                Button{
                    withAnimation(.interpolatingSpring(mass: 1, stiffness: 50, damping: 5, initialVelocity: 0)) {
                        card.x = 1000
                        card.degree = 12
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                            onLike(card)
                        }
                    }
                } label: {
                    Text("APPLY")
                        .font(
                            Font.custom("Cabin", size: 16)
                                .weight(.bold)
                        )
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color(red: 0.28, green: 0.25, blue: 0.25))
                        .frame(width: 260, height: 53, alignment: .center)
                        .foregroundColor(.clear)
                        .frame(width: 260, height: 53)
                        .background(Color(red: 1, green: 0.83, blue: 0.83))
                    
                        .cornerRadius(30)
                }
                .padding(.bottom, 40)
                // Add padding to separate it from icons
                .background(Color(red: 161/255, green: 69/255, blue: 56/255))
                Spacer()
            }
            .background(Color(red: 161/255, green: 69/255, blue: 56/255))
            
        }
        
        
    }
    
}

#Preview {
    SwipeView()
        .environmentObject(SwipeViewModel())
}
