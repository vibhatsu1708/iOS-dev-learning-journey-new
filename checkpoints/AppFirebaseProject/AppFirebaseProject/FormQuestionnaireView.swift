//
//  FormQuestionnaireView.swift
//  AppFirebaseProject
//
//  Created by Vedant Mistry on 08/02/24.
//

import SwiftUI
import Firebase

struct FormQuestionnaireView: View {
    @EnvironmentObject var userDetails: UserDetails
    @EnvironmentObject var dataManager: DataManager
    
    @State private var isDataLoaded: Bool = false
    
    @State private var name: String = ""
    @State private var age: String = ""
    
    let genders: [String] = ["Please Select", "Male", "Female"]
    let relationshipStatuses: [String] = ["Please Select", "Married", "Divorced", "Single"]
    let isSeekingForGenders: [String] = ["Please Select", "Male", "Female"]
    
    @State private var gender: String = "Not Selected"
    @State private var relationshipStatus: String = "Not Selected"
    @State private var isSeekingForGender: String = "Not Selected"
    
    @State private var relationshipAgeRange: Double = .zero
    
    @State private var importantQualitiesInMate: String = ""
    @State private var somethingAboutYou: String = ""
    @State private var somethingAboutLastRelationship: String = ""
    @State private var someChallengingPersonalTraits: String = ""
    
    @State private var formFilled: Bool = false
    
    var body: some View {
        if formFilled == false {
            ScrollView {
                VStack(alignment: .leading) {
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Your name")
                        TextField("", text: $name)
                            .padding(10)
                            .clipShape(RoundedRectangle(cornerRadius: 10.0))
                            .border(Color.secondary.opacity(0.5))
                    }
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Your age")
                        TextField("", text: $age)
                            .keyboardType(.decimalPad)
                            .padding(10)
                            .clipShape(RoundedRectangle(cornerRadius: 10.0))
                            .border(Color.secondary.opacity(0.5))
                    }
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Your gender")
                            .tag("")
                        HStack {
                            Picker("Your gender", selection: $gender) {
                                ForEach(genders, id: \.self) {
                                    Text($0)
                                }
                            }
                            Text((gender == "Please Select") ? "Not Selected" : gender)
                        }
                    }
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Your relationship status")
                            .tag("")
                        HStack {
                            Picker("Your relationship status", selection: $relationshipStatus) {
                                ForEach(relationshipStatuses, id: \.self) {
                                    Text($0)
                                }
                            }
                            Text((relationshipStatus == "Please Select") ? "Not Selected" : relationshipStatus)
                        }
                    }
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Is seeking for")
                            .tag("")
                        HStack {
                            Picker("Is seeking for", selection: $isSeekingForGender) {
                                ForEach(isSeekingForGenders, id: \.self) {
                                    Text($0)
                                }
                            }
                            Text((isSeekingForGender == "Please Select") ? "Not Selected" : isSeekingForGender)
                        }
                    }
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Is seeking age range of")
                        HStack {
                            Slider(value: $relationshipAgeRange, in: -20...20)
                            Text("Upto \(Int(relationshipAgeRange))")
                        }
                    }
                    VStack(alignment: .leading, spacing: 10) {
                        Text("What are some important qualities you seeking your mate?")
                        TextField("", text: $importantQualitiesInMate)
                            .padding(10)
                            .clipShape(RoundedRectangle(cornerRadius: 10.0))
                            .border(Color.secondary.opacity(0.5))
                    }
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Tell us something about you?")
                        TextField("", text: $somethingAboutYou)
                            .padding(10)
                            .clipShape(RoundedRectangle(cornerRadius: 10.0))
                            .border(Color.secondary.opacity(0.5))
                    }
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Tell us something about your last relationship?")
                        TextField("", text: $somethingAboutLastRelationship)
                            .padding(10)
                            .clipShape(RoundedRectangle(cornerRadius: 10.0))
                            .border(Color.secondary.opacity(0.5))
                    }
                    VStack(alignment: .leading, spacing: 10) {
                        Text("What are some of your challenging personality traits?")
                        TextField("", text: $someChallengingPersonalTraits)
                            .padding(10)
                            .clipShape(RoundedRectangle(cornerRadius: 10.0))
                            .border(Color.secondary.opacity(0.5))
                    }
                    
                    Button {
                        dataManager.addPerson(userName: name,
                                              userEmail: userDetails.userEmail!,
                                              userAge: Int(age) ?? 0,
                                              userGender: gender,
                                              userRelationshipStatus: relationshipStatus,
                                              userIsSeekingForGender: isSeekingForGender,
                                              userRelationshipAgeRange: Int(relationshipAgeRange),
                                              userImportantQualitiesInMate: importantQualitiesInMate,
                                              userSomethingAboutYou: somethingAboutYou,
                                              userSomethingAboutLastRelationship: somethingAboutLastRelationship,
                                              userSomeChallengingPersonalTraits: someChallengingPersonalTraits, 
                                              userFormFilled: formFilled,
                                              isUserVerified: false)
                    } label: {
                        Text("Submit for review")
                            .padding()
                            .frame(width: 200, height: 40)
                            .background(Color.blue)
                            .foregroundStyle(Color.white)
                            .bold()
                    }
                }
                .padding()
                .navigationTitle("Welcome")
                .navigationBarTitleDisplayMode(.automatic)
            }
            .onAppear {
                Task {
                    do {
                        if let firebaseFetchedPersonDetails = try await dataManager.getPerson(userEmail: userDetails.userEmail!) {
                            let name = firebaseFetchedPersonDetails["name"] as? String
                            let formFilled = firebaseFetchedPersonDetails["user_form_filled"] as! Int == 1 ? true : false
                            
                            userDetails.userName = name!
                            userDetails.userFormFilled = formFilled
                            
                            self.name = name!
                            self.formFilled = formFilled
                            
                            isDataLoaded = true
                        } else {
                            if try await dataManager.getPerson(userEmail: userDetails.userEmail!) == nil {
                                isDataLoaded = false
                            }
                        }
                    } catch {
                        print("Error: \(error)")
                    }
                }
            }
        } else {
            UnderReviewView()
        }
    }
}

#Preview {
    FormQuestionnaireView()
}
