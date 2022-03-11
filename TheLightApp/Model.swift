//
//  Model.swift
//  TheLightApp
//
//  Created by Sarika on 10.03.22.
//

import Foundation
import UIKit

struct EnergyClass: Identifiable {
    let id = UUID()
    let color : UIColor
    let title : String
    
}

struct Categories: Identifiable {
    let id = UUID()
    let name : String
}

struct TrendingProducts : Identifiable {
    let id = UUID()
    let name : String
    let price : String
}

struct Products : Identifiable {
    let id = UUID()
    let name : String
    let price : String
}

struct ProductDetail : Identifiable {
    let id = UUID()
    let name : String
    let description : String
    let energyClassTitle : String
    let price : String
    let energyClass : [EnergyClass]
    let peopleInfo : String
}

let productDetailData = ProductDetail(name: "Antique Crystal lamp", description: "This Antique hanging lamp Tarbes with a shiny copper finish and crystals inside. It illuminates three lights and ensures sufficient brightness in the room and creates a wonderfully rustic look.", energyClassTitle: "Energy Efficiency Class:", price: "$259.00", energyClass: energyData, peopleInfo: "232 People bought this")

let categoriesData = [Categories(name: "Ceiling"),
                      Categories(name: "Wall"),
                      Categories(name: "Table"),
                      Categories(name: "Garden"),
                      Categories(name: "Chandelier"),
                      Categories(name: "Office")]

let trendingProductData = [TrendingProducts(name: "Copper Wire lamp", price: "$250"),
                           TrendingProducts(name: "Antique Crystal lamp", price: "$259"),
                           TrendingProducts(name: "Pendant lamp", price: "$178"),
                           TrendingProducts(name: "Golden Glass Shine lamp", price: "$1560.90")]


let productData = [Products(name: "White Bowl lamp", price: "$120.80"),
                   Products(name: "White Flat lamp", price: "$180.25"),
                   Products(name: "Gold Tessel lamp", price: "$255.60")]


let energyData = [EnergyClass(color: .green, title: "A++"),
                 EnergyClass(color: .purple, title: "A+"),
                 EnergyClass(color: .yellow, title: "A"),
                 EnergyClass(color: .cyan, title: "B"),
                 EnergyClass(color: .magenta, title: "C"),
                 EnergyClass(color: .orange, title: "D"),
                 EnergyClass(color: .red, title: "E")]

