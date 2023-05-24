//
//  NoItemView.swift
//  todoapp
//
//  Created by Saif on 24/05/2023.
//

import SwiftUI

struct NoItemView: View {
    
    @State var animate:Bool = false
    let secondaryColor = Color("SecondaryAccentColor")
    
    var body: some View {
        ScrollView{
            VStack{
                Text("No items to show")
                    .font(.title)
                    .fontWeight(.semibold)
                Text("If you are a productive person you should quickly add some notes! ⚡️")
                    .padding(.bottom, 20)
                NavigationLink(
                    destination: AddView(),
                    label: {
                        Text("Add Note 🤩")
                            .foregroundColor(.white)
                            .font(.headline)
                            .frame(height: 55)
                            .frame(maxWidth: .infinity)
                            .background(animate ? secondaryColor : Color.accentColor)
                            .cornerRadius(10)
                        
                    })
                .padding(.horizontal, animate ? 30 : 55)
                .shadow(
                    color: animate ? secondaryColor.opacity(0.7) : Color.accentColor.opacity(0.7),
                    radius: animate ? 30 : 10,
                    x: 0.0,
                    y: animate ? 50.0 : 30.0
                )
                .scaleEffect(animate ? 1.1 : 1.0)
                .offset(y: animate ? -7 : 0)
            }
            .multilineTextAlignment(.center)
            .frame(maxWidth: 400)
            .padding(40)
            .onAppear(perform: addAnimation)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    func addAnimation() {
        guard !animate else { return }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            withAnimation (
                Animation
                    .easeInOut(duration: 2.0)
                    .repeatForever()
            ) {
                animate.toggle()
            }
        }
    }
}

struct NoItemView_Previews: PreviewProvider {
    static var previews: some View {
        
        NavigationView {
            NoItemView()
                .navigationTitle("Title")
        }
        
    }
}
