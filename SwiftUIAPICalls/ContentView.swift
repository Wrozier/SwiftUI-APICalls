//
//  ContentView.swift
//  SwiftUIAPICalls
//
//  Created by William Rozier on 8/27/23.
//

import SwiftUI





struct ContentView: View {
    @StateObject   var  viewModel = ViewModel()
    
    var body: some View {
        NavigationView{
            List{
                ForEach(viewModel.courses, id: \.self){ course in
                    HStack {
                        Image("")
                            .frame(width:130, height: 70)
                            .background(Color.gray)
                        
                        Text(course.name)
                            .bold()
                        
                    }
                    .padding(3)
                    
                }
                
            }
            .navigationTitle("Courses")
            .onAppear{
                viewModel.fetch()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
