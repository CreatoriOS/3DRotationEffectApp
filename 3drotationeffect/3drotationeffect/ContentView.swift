//
//  ContentView.swift
//  3drotationeffect
//
//  Created by Zhansaya Bortanova on 13/01/2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var count: Int = 20
    
    
    
    var body: some View {
        ZStack {
   
            Color.white.edgesIgnoringSafeArea(.all)
           
            
            ForEach(0..<count){index in
                AnimateCircle(index: index)
            }
            
            Text("ZHansaya Bortanova")
                .font(.system(size: 30, weight: .bold, design: .monospaced))
                .padding(.top, 600)
                .padding()
            
        }
        
            
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
// Create Sprring
struct AnimateCircle: View {

    
   
@State var index: Int
    @State private var animate: Bool = true
    @State private var yOffsetValue: CGFloat = -200
    var body: some View {
      
        Circle()
            .stroke(lineWidth: 2)
            .frame(width: animate ? 200 : 5, height: animate ? 200 : 5)
            .foregroundColor(.black)
        //Add rotation
            .rotation3DEffect(.degrees(75), axis: (x: 1, y: 0, z: 0))
            .offset(y: animate ? yOffsetValue : 0)
            .animation(Animation.easeInOut(duration: 2.0) .delay(0.1 * Double(index)))
            .onAppear(){
               animateCircle()
                Timer.scheduledTimer(withTimeInterval: 7, repeats: true) {_ in
                    animateCircle()
                }
                
            }
    }
    
    func animateCircle(){
        DispatchQueue.main.asyncAfter(deadline: .now()){
            animate.toggle()
            yOffsetValue = 0
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1){
            animate.toggle()
            yOffsetValue = 200
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 3){
            animate.toggle()
            yOffsetValue = 0
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1){
            animate.toggle()
            yOffsetValue = -200
        }
        }
    }
}
