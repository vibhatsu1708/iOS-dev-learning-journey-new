//
//  ControlGroupLearning.swift
//  SwiftUIBasicsBootcamp
//
//  Created by Vedant Mistry on 18/03/24.
//

import SwiftUI

struct ControlGroupLearning: View {
    var body: some View {
        
        // The menu renders the elements inside from bottom to top, so two will appear at the top, and one will appear at the bottom of the menu.
        Menu("My menu") {
            ControlGroup {
                Button("Oneeeee") {
                    
                }
                Button("Twooooo") {
                    
                }
                Button("Threeeee") {
                    
                }
            }
            
            Menu("Numbers") {
                Button("One") {
                    
                }
                Button("Three") {
                    
                }
                Button("Two") {
                    
                }
                
                Menu("How are you feeling?") {
                    Button("Good") {
                        
                    }
                    Button("Bad") {
                        
                    }
                    Button("Meh") {
                        
                    }
                }
            }
        }
    }
}

#Preview {
    ControlGroupLearning()
}
