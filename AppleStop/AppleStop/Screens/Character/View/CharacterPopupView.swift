//
//  CharacterPopupView.swift
//  AppleStop
//
//  Created by SHIN YOON AH on 2022/04/11.
//

import SwiftUI

struct CharacterPopupView: View {
    
    // MARK: - properties
    
    @Binding var character: Character
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                Color.popupGrey.opacity(0.3)
                
                Rectangle()
                    .foregroundColor(.white)
                    .frame(height: geo.size.height / 2, alignment: .center)
                    .cornerRadius(12)
                    .shadow(color: .gray.opacity(0.5), radius: 1, x: 0, y: 2)
                    .padding(.horizontal, 25)
                    .overlay {
                        CharacterDetailView(characterImage: $character.image,
                                            characterName: $character.name,
                                            characterInfo: $character.info)
                            .padding(.leading, 50)
                            .padding(.trailing, 45)
                    }
            }
            .background(BackgroundBlurView())
            .ignoresSafeArea()
        }
    }
}

struct CharacterPopupView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterPopupView(character: .constant(Character(image: Image(systemName: "circle.fill"), name: "동그라미 땡", info: "동그라미 땡은 귀엽습니다.!")))
    }
}
