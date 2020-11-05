//
//  CarouselView.swift
//  CardsViewSample
//
//  Created by Ilya on 04.11.20.
//

import SwiftUI

struct CarouselView: View {
    @Binding var index: Int
    var images: [String] = []
    var imagesView:[String:GIFView] {
        var dic: [String:GIFView] = [:]
        for item in images {
            dic[item] = GIFView(gifName: item)
        }
        return dic
    }
    
    var body: some View {
        let count =  images.count > 0 ? images.count - 1 : 0
        return VStack{
            PagingView(index: $index.animation(), maxIndex: count) {
                ForEach(self.images, id: \.self) { imageName in
                    self.imagesView[imageName]
                }
            }
                
            .clipShape(RoundedRectangle(cornerRadius: 5))
        }.padding(.bottom, 10)
    }
}

struct CarouselView_Previews: PreviewProvider {
    static var previews: some View {
        CarouselView(index: .constant(0), images: ["sample-2","ViewsInAContainer","IndependedView"])
    }
}
