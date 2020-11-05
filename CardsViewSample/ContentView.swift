//
//  ContentView.swift
//  CardsViewSample
//
//  Created by Ilya on 04.11.20.
//

import SwiftUI

struct Card {
    let title: String
    let description: String
    let imageName: String
    let isGIF: Bool
    
    static var example: [Card] {
        [
            Card(title: "Call control",
                 description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum",
                 imageName: "sample-2",
                 isGIF: true),
            
            Card(title: "Lead creation",
                 description: "Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua",
                 imageName: "ViewsInAContainer",
                 isGIF: true),
            
            Card(title: "Swipe to edit",
                 description: "Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum",
                 imageName: "https://miro.medium.com/max/1000/1*MqFcwBk0Vr8UsFDVV-1Zfg.gif",
                 isGIF: true)
        ]
    }
}


struct ContentView: View {
    @State var index: Int = 0
   // @State var gif: GIFView?
    
    let cards: [Card]
    let buttonSize: CGFloat = 70
    
    var body: some View {
        ZStack {
            VStack (alignment: .leading){
               // GIFView(gifName: "ViewsInAContainer")
                CarouselView(index: $index, images: cards.map{ $0.imageName})
                
                
                VStack (alignment: .leading){
                    Text(cards[index].title)
                        .font(.title3)
                        .bold()
                        .foregroundColor(.primary)
                        .padding(.vertical)
                        .transition(.opacity)
                    
                    Text(cards[index].description)
                        .font(.callout)
                        .foregroundColor(.gray)
                        .padding(.bottom, 70)
                        .transition(.opacity)
                }
                Spacer ()
            }
            .padding(20)
            .multilineTextAlignment(.leading)
            if index == cards.count-1 {
                VStack {
                    
                    Spacer()
                    HStack {
                        //Spacer()
                        Button(action: {
                            print("dismiss")
                        }, label: {
                            ZStack {
                                Circle()
                                    .fill(Color.green)
                                    .frame(width: buttonSize, height: buttonSize)
                                    .padding(.horizontal)
                                
                                Image(systemName: "checkmark")
                                    .font(.system(size: 30))
                                    .frame(width: buttonSize, height: buttonSize)
                                    .foregroundColor(.white)
                            }
                        })
                    }
                }
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(cards: Card.example)
    }
}

