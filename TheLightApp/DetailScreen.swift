//
//  DetailScreen.swift
//  TheLightApp
//
//  Created by Sarika on 08.03.22.
//

import SwiftUI

struct DetailScreen: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        ZStack{
        
            ScrollView  {
        
                VStack {
                    VStack {
                        Image("ceiling_2")
                                .resizable()
                                .aspectRatio(1,contentMode: .fit)
                            .edgesIgnoringSafeArea(.top)
                    }
                    .cornerRadius(70, corners: .bottomRight)
                }
                DescriptionView()
            }
            .edgesIgnoringSafeArea(.top)
            
            HStack {
                
                Text("Add to Cart")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .padding()
                    .padding(.horizontal, 8)
                
            }
            //.padding()
            //.padding(.horizontal)
            .background(.orange)
            //.cornerRadius(60.0, corners: .topRight)
            .frame(maxHeight: .infinity, alignment: .bottom)
            .edgesIgnoringSafeArea(.bottom)
        }
        
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: Button(action: {presentationMode.wrappedValue.dismiss()}, label: {
            Image(systemName: "xmark")
                .frame(width: 32, height: 32)
                .foregroundColor(.white)
                .padding()
        }))
    }
}

struct DetailScreen_Previews: PreviewProvider {
    static var previews: some View {
        DetailScreen()
    }
}

struct DescriptionView: View {
    var body: some View {
        
        VStack (alignment: .leading, spacing: 10) {
            
            HStack {
                Text(productDetailData.name)
                    .font(.title)
                Spacer()
                Image(systemName: "heart.fill").foregroundColor(.orange)
                    .frame(width: 50 , height: 50)
                    .scaledToFill()
            }
            
                HStack (spacing: 4) {
                    ForEach(0 ..< 5) { item in
                        Image("star")
                    }
                }
            
            Text(productDetailData.description)
                .lineSpacing(8.0)
                .opacity(0.6)
            
            Text(productDetailData.energyClassTitle)
                .font(.system(size: 18))
                .fontWeight(.semibold)
                .padding(.top)
            
            HStack (spacing : 10){
            
                ForEach(0..<productDetailData.energyClass.count) { i in
                    Text(productDetailData.energyClass[i].title)
                        .fontWeight(.semibold)
                        .frame(width: 50 , height: 40)
                        .border(i == 0 ? .red : .white)
                        .foregroundColor(.white)
                        .background(Color(productDetailData.energyClass[i].color))
                }
            }
            
            Text(productDetailData.price)
                .font(.title)
                .fontWeight(.semibold)
            
            
            HStack {
                HStack (spacing : 0) {
                    ForEach (0..<5){ i in
                        
                        if (i == 4) {
                            Text("..")
                                
                                .font(.system(size: 30))
                                .frame(width: 35, height: 35, alignment: .center)
                                .foregroundColor(.white)
                                .background(.orange)
                                .clipShape(Capsule())
                            
                        } else {
                            Image("user_\(i+1)")
                                .resizable()
                                .scaledToFill()
                                .clipped()
                                .frame(width: 35 , height: 35)
                                .clipShape(Circle())
                        }
                    }
                }
                Text(productDetailData.peopleInfo)
                    .font(.title3)
                    .fontWeight(.regular)
                
            }

        }
        .cornerRadius(70, corners: .bottomRight)
    }
}

