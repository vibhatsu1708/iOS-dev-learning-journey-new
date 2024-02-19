import SwiftUI

struct MainView: View {
    @State var aboutOmmmazing: Bool = true
    
    @State private var exerciseModel = ExerciseModel()
    
    @State private var selectedExercise: Exercise? = nil
    @State private var selectedSubExercise: SubExercise? = nil
    
    @State private var NSVColumnVisibility: NavigationSplitViewVisibility = .automatic
    
    var body: some View {
        ZStack {
            NavigationSplitView(columnVisibility: $NSVColumnVisibility) {
                List(exerciseModel.exercises, selection: $selectedExercise) { exercise in
                    NavigationLink(value: exercise) { 
                        HStack {
                            Image(systemName: exercise.image)
                                .font(.title2)
                                .fontWeight(.semibold)
                            VStack(alignment: .leading) {
                                Text(exercise.name)
                                    .font(.title2)
                                    .fontWeight(.semibold)
                                Text(exercise.caption)
                                    .font(.subheadline)
                                    .italic()
                            }
                        }
                        .padding(10)
                    }
                }
                .tint(Color(hex: "5448C8"))
                .navigationTitle("Ommmazing")
                .navigationBarTitleDisplayMode(.large)
                
                Spacer()
                
                Button {
                    if !aboutOmmmazing {
                        aboutOmmmazing.toggle()
                    }
                } label: {
                    HStack {
                        Image(systemName: "swift")
                            .foregroundStyle(Color(hex: "FC5130"))
                        Text("About Ommmazing")
                        
                        Spacer()
                        
                        Image(systemName: "info.circle.fill")
                    }
                }
                .padding()
                .background(aboutOmmmazing ? Color.secondary.opacity(0.2) : Color.secondary.opacity(0.1))
                .clipShape(RoundedRectangle(cornerRadius: 10.0))
                .padding()
                
            } content: {
                if let exercise = selectedExercise {
                    List(exercise.sub_exercises, selection: $selectedSubExercise) { subExercise in
                        NavigationLink(value: subExercise) {
                            HStack {
                                Image(systemName: subExercise.image)
                                    .font(.title2)
                                Text(subExercise.name)
                                    .font(.title2)
                                
                                Spacer()
                                
                                Image(systemName: "arkit")
                            }
                        }
                    }
                    .tint(Color(hex: "2F52E0"))
                    .navigationTitle(exercise.name)
                    .navigationBarTitleDisplayMode(.inline)
                } else {
                    Text("Please select your exercise to get started.")
                }
            } detail: {
                if let subExercise = selectedSubExercise {
                    ScrollView {
                        VStack(alignment: .leading, spacing: 30) {
                            VStack(alignment: .leading, spacing: 10) {
                                HStack {
                                    Image(systemName: "brain.filled.head.profile")
                                        .font(.title)
                                        .foregroundStyle(Color(hex: "FF686B"))
                                    Text("About")
                                        .font(.title)
                                        .fontWeight(.semibold)
                                    
                                    Spacer()
                                    
                                    Button {
                                        
                                    } label: {
                                        HStack {
                                            Image(systemName: "arkit")
                                            Text("See in AR")
                                        }
                                    }
                                    .padding(.horizontal, 20)
                                    .padding(.vertical, 10)
                                    .background(LinearGradient(colors: [Color(hex: "c81d77"), Color(hex: "6710c2")], startPoint: .topLeading, endPoint: .bottomTrailing))
                                    .foregroundStyle(Color.white)
                                    .font(.title3)
                                    .fontWeight(.semibold)
                                    .clipShape(RoundedRectangle(cornerRadius: 10.0))
                                }
                                Text(subExercise.about)
                                    .font(.system(size: 22))
                            }
                            .padding()
                            .background(Color.secondary.opacity(0.1))
                            .clipShape(RoundedRectangle(cornerRadius: 10.0))
                            
                            VStack(alignment: .leading, spacing: 10) {
                                HStack {
                                    Image(systemName: "figure.mind.and.body")
                                        .font(.title)
                                        .foregroundStyle(Color(hex: "00B9AE"))
                                    Text("How to do it?")
                                        .font(.title)
                                        .fontWeight(.semibold)
                                    
                                    Spacer()
                                }
                                Text(subExercise.how_to_do_it)
                                    .font(.system(size: 22))
                            }
                            .padding()
                            .background(Color.secondary.opacity(0.1))
                            .clipShape(RoundedRectangle(cornerRadius: 10.0))
                            
                            VStack(alignment: .leading, spacing: 10) {
                                HStack {
                                    Image(systemName: "lightbulb.max.fill")
                                        .font(.title)
                                        .foregroundStyle(Color(hex: "EB5E28"))
                                    Text("Did you know?")
                                        .font(.title)
                                        .fontWeight(.semibold)
                                    
                                    Spacer()
                                }
                                Text(subExercise.did_you_know)
                                    .font(.system(size: 22))
                            }
                            .padding()
                            .background(Color.secondary.opacity(0.1))
                            .clipShape(RoundedRectangle(cornerRadius: 10.0))
                        }
                    }
                    .padding()
                    .navigationTitle(subExercise.name)
                } else {
                    Text("Please select your subexercise to get started.")
                }
            }
            .navigationSplitViewStyle(.prominentDetail)
            
            VStack {
                if aboutOmmmazing {
                    Rectangle()
                        .frame(maxWidth: 800, maxHeight: 600)
                        .foregroundStyle(Color(hex: "EDF2EF"))
                        .clipShape(RoundedRectangle(cornerRadius: 20.0))
                        .overlay {
                            RoundedRectangle(cornerRadius: 20.0)
                                .strokeBorder(Color.secondary, lineWidth: 2)
                            ZStack {
                                VStack {
                                    HStack {
                                        Spacer()
                                        Button {
                                            aboutOmmmazing.toggle()
                                        } label: {
                                            Image(systemName: "xmark.circle.fill")
                                                .font(.title)
                                        }
                                        .foregroundStyle(Color.black)
                                    }
                                    Spacer()
                                }
                            }
                            .padding()
                        }
                }
            }
            .padding()
        }
        
        // To display the theme in light
//        .preferredColorScheme(.light)
    }
}

#Preview {
    MainView()
}
