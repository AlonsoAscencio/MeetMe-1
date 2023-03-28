//
//  CardView.swift
//  MeetMe
//
//  Created by MAC on 28/03/23.
//

import SwiftUI

var image: Image

struct CardView: View {
    var body: some View {
        ZStack {
            Image()
                .resizable()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(10)
                .padding()
                .frame(width: UIScreen.main.bounds.width - 20, height: UIScreen.main.bounds.height * 0.7)
                .background(Color.white)
                .animation(.spring())
                .scaledToFit()
                .gesture(
                    DragGesture()
                        .onChanged { value in
                            if value.translation.width > 0 {
                                self.image = Image("Like")
                            } else {
                                self.image = Image("Dislike")
                            }
                        }
                        .onEnded { value in
                            withAnimation {
                                if value.translation.width > 0 {
                                    self.image = Image("Like")
                                    self.offset = CGSize(width: 500, height: 0)
                                } else {
                                    self.image = Image("Dislike")
                                    self.offset = CGSize(width: -500, height: 0)
                                }
                            }
                        }
                )
 
        }
        .cornerRadius(24)
        .shadow(radius: 5)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView()
    }
}
