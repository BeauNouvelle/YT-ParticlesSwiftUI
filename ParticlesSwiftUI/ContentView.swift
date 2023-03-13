//
//  ContentView.swift
//  ParticlesSwiftUI
//
//  Created by Beau Nouvelle on 13/3/2023.
//

import SwiftUI
import SpriteKit

class ParticleScene: SKScene {

    override init(size: CGSize) {
        super.init(size: size)

        backgroundColor = .clear

        if let emitter1 = SKEmitterNode(fileNamed: "MyParticle") {
            emitter1.position.y = size.height
            emitter1.particleColorSequence = nil
            emitter1.particleColorBlendFactor = 1
            emitter1.particleColorBlueRange = 1
            emitter1.particleColorGreenRange = 1
            emitter1.particleColorRedRange = 1
            emitter1.position.x = size.width
            addChild(emitter1)
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

struct ContentView: View {

    @State var isPuchased = false

    var body: some View {
        ZStack {
            if isPuchased {
                GeometryReader { geo in
                    SpriteView(scene: ParticleScene(size: geo.size), options: [.allowsTransparency])
                }
            }

            VStack {

                Text("Unlock Premium")
                    .font(.largeTitle)

                Spacer()

                if isPuchased {
                    Text("🎉 Congratulations! 🎉")
                } else {
                    Text("Subscribe now to unlock all the features in the app!")
                }

                Spacer()

                Button {
                    withAnimation {
                        isPuchased.toggle()
                    }
                } label: {
                    Text("Purchase")
                        .frame(maxWidth: .infinity)
                        .foregroundColor(.primary)
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color.green))
                }
                .buttonStyle(ScaleButtonStyle())
            }
            .padding()


        }

    }
}

struct ScaleButtonStyle: ButtonStyle {

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(x: configuration.isPressed ? 0.98 : 1, y: configuration.isPressed ? 0.98 : 1)
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
