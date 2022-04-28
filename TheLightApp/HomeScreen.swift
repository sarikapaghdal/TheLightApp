//
//  HomeScreen.swift
//  TheLightApp
//
//  Created by Sarika on 08.03.22.
//

import SwiftUI

struct HomeScreen: View {
    @State private var search: String = ""
    @State private var selectedIndex: Int = 0
    @State private var fav : Bool = false
   
    var body: some View {
        NavigationView {
            ZStack {
                
               // Color(#colorLiteral(red: 0.937254902, green: 0.937254902, blue: 0.937254902, alpha: 1))
                 //   .ignoresSafeArea()
                
                ScrollView (showsIndicators: false){
                    VStack(alignment: .leading) {
                        
                        Spacer()
                    
                        ScrollView (.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(0 ..< categoriesData.count) { i in
                                    Button(action: {selectedIndex = i}) {
                                        CategoryView(isActive: selectedIndex == i, text: categoriesData[i].name)
                                    }
                                }
                            }
                            .padding(.top)
                            .padding(.leading)
                        }
                        //padding(.bottom)
                        Text("122 Items")
                            .font(.custom("Montserrat-Regular", size: 20))
                            .foregroundColor(.gray)
                            .padding(.horizontal)
                            .padding(.top)
                        
                        ZStack {
                            Color("Primary").ignoresSafeArea()
                            VStack (alignment: .leading){
                                    
                                    Text("Trending Now")
                                        .font(.custom("Montserrat-Medium", size: 25))
                                        .foregroundColor(.black).opacity(0.7)
                                        .padding(.horizontal)
                                        .padding(.top)
                                    
                                    ScrollView (.horizontal, showsIndicators: false) {
                                     
                                        HStack (spacing: 15) {
                                            
                                            ForEach(0 ..< 4) { i in
                                                NavigationLink(
                                                    destination: DetailScreen(),
                                                    label: {
                                                        TrndingProductCardView(image: Image("ceiling_\(i+1)"), size: 225, itemname: trendingProductData[i].name, price: trendingProductData[i].price)
                                                    })
                                                    .foregroundColor(.black)
                                            }
                                            .padding(.leading)
                                        }
                                    } // scrollview
                                    .padding(.bottom)
                                   
                                } //Vstack
                        }//Zstack
                        .cornerRadius(30, corners: .topLeft)
                        
                        ZStack {
                            Color("Secondary").ignoresSafeArea()
                            VStack (alignment: .leading) {
                                
                                Text("You may also like")
                                    .font(.custom("Montserrat-Medium", size: 25))
                                    .foregroundColor(.black).opacity(0.7)
                                    .padding(.horizontal)
                                    .padding(.top)
                                
                                ScrollView (.horizontal, showsIndicators: false) {
                                 
                                    HStack (spacing: 15) {
                                        
                                        ForEach(0 ..< 3) { i in
                                            NavigationLink(
                                                destination: DetailScreen(),
                                                label: {
                                                    ProductCardView(fav: $fav, image: Image("ceiling_\(i+5)"), size: 225, itemname: productData[i].name, price: productData[i].price)
                                                })
                                                .foregroundColor(.black)
                                        }
                                        .padding(.leading)
                                    }
                                } // scrollview
                                .padding(.bottom)
                                
                            } //VStack
                        } //Zstack
                        .cornerRadius(30, corners: .topLeft)
                    }
                }
                
                VStack {
                    Spacer()
                    BottomNavBarView()
                }
                
                .navigationBarItems(trailing: Button(action: {}, label: {
                    Image(systemName: "cart")
                        .foregroundColor(.orange).opacity(0.7)
                }))
                .navigationTitle("Lights")
                .navigationBarTitleDisplayMode(.inline)
                .font(.system(size: 28))
            }
        }
}
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}

struct RoundedCorner: Shape {

    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.light)
    }
}

struct CategoryView: View {
    let isActive: Bool
    let text: String
    var body: some View {
      
        Text(text)
                .frame(width: 100, height: 30)
                .font(.custom("PlayfairDisplay-Bold", size: 20))
                .foregroundColor(isActive ? .white : .black)
                .background(isActive ? .orange.opacity(0.7) : .orange.opacity(0.0))
                .clipShape(Capsule())
    }
}

struct TrndingProductCardView: View {
    let image: Image
    let size: CGFloat
    let itemname : String
    let price : String
    
    var body: some View {
        VStack (alignment: .leading){
            
            image
                .resizable()
                .frame(width: size, height: 200 * (size/210))
            Text(itemname).font(.title3)
                
            HStack (spacing: 0) {
        
               ForEach(0 ..< 5) { item in
                   Image("star")
                }
                Spacer()
                Text(price)
                    .font(.title3)
                    .fontWeight(.bold)
            }
            .background(.white)
            .frame(height: size/5)
        }
        .frame(width: size)
        .background(.white)
        .cornerRadius(20.0)
    }
}

struct ProductCardView: View {
    @Binding var fav : Bool
    let image: Image
    let size: CGFloat
    let itemname : String
    let price : String
    
    var body: some View {
        HStack {
            
            image
                .resizable()
                .frame(width: 130, height: 150)
                .cornerRadius(20)
                
            VStack (alignment : .leading, spacing: 20) {
        
                Text(itemname).font(.title3)
                
                Text(price)
                    .font(.title3)
                    .fontWeight(.bold)
                
                HStack {
                    HStack(spacing: 0) {
                        ForEach(0 ..< 5) { item in
                           Image("star")
                        }
                    }
                    Spacer()
                    
                    Button { fav.toggle()} label: {
                        if (fav) {
                             Image(systemName: "heart")
                                .foregroundColor(.orange)
                        } else {
                            Image(systemName: "heart")
                        }
                    }
                }
            }
            .background(.white)
            .frame(height: size/5)
        }
        .padding()
        .frame(width: size + 200)
        .background(.white)
        .cornerRadius(20.0, corners: [.topLeft, .bottomLeft])
    }
}

struct BottomNavBarView: View {
    var body: some View {
        HStack {
            BottomNavBarItem(image: Image(systemName: "house")) {}
            BottomNavBarItem(image: Image(systemName: "magnifyingglass")) {}
            BottomNavBarItem(image: Image(systemName: "heart")) {}
            BottomNavBarItem(image: Image(systemName: "person")) {}
        }
        .padding()
        .foregroundColor(.black)
        .background(Color.white)
    }
}

struct BottomNavBarItem: View {
    let image: Image
    let action: () -> Void
    var body: some View {
        Button(action: action) {
            image
                .frame(maxWidth: .infinity)
        }
    } 
}
