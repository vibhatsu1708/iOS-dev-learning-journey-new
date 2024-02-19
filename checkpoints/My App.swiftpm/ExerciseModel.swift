import SwiftUI


struct Exercise: Identifiable, Hashable {
    let id = UUID()
    var image: String
    var name: String
    var caption: String
    var sub_exercises: [SubExercise]
}

struct SubExercise: Identifiable, Hashable {
    let id = UUID()
    var image: String
    var name: String
    var about: String
    var how_to_do_it: String
    var did_you_know: String
}

class ExerciseModel: ObservableObject {
    @Published var exercises: [Exercise] = [
        Exercise(
            image: "figure.yoga", 
            name: "Full Body Yoga",
            caption: "5 Yogasanas",
            sub_exercises: [
                SubExercise(
                    image: "1.circle.fill", 
                    name: "Tadasana", 
                    about: "Tadasana is a standing Yogasana. The word has been derived from the Sanskrit word ‘Tada’ meaning Mountain.\nThe Tadasana Yogasana term symbolises standing strong like a tree or a mountain, it’s also called the mountain pose or palm tree posture.\nIt helps us to improve the body’s posture, alignment and balance, while helping with back pain by correcting the misalignment patterns.", 
                    how_to_do_it: "Stand upright, by keeping a distance of 2 inches, between your feet, inhale and lift your arms in front, levelling up to your shoulders’s height.\nLock the fingers of your hands together and then slowly rotate your wrist outwards, now inhale and lift your arms above your head.\nWhile lifting your arms, also lift your heels off the ground, balancing your entire body weight on your toes.\nNow, maintain this position for 30 seconds, and then slowly bring your heels down.\nSlowly exhale, release your fingers, and draw your arms down while returning to the initial position.", 
                    did_you_know: "The Tadasana Yogasana can prove to be beneficial to people who have sedentary desk jobs, by improving their core strength and their posture.\nIt helps to improve balance, better agility, tone core muscles, reduce hip and back pain, help regulate digestion and respiration, and boost blood circulation.\nIt is used as a resting or a transition pose. In the Ashtanga Yoga, a dynamic form of Hatha Yoga, this pose is referred to as Samasthiti and its regular practice helps the practitioners to cultivate stillness and serenity."),
                SubExercise(
                    image: "2.circle.fill", 
                    name: "Paschimottanasana", 
                    about: "Paschimottanasana is a sitting Yogasana. It is derived from the Sanskrit name which translates to ‘West Stretching Pose’.\nA Yogasana which is practiced traditionally initiated facing the rising sun.\nThe Paschimottanasana Yogasana stretches the dorsal part of the back, including the spine and muscles thus helps to open the spine and tone the back muscles.", 
                    how_to_do_it: "Sit erect, and stretch your legs out in the front of you, while inhaling, stretch your arms over your head.\nNow, exhale and bend your torso forwards from the waist, while slowly outstretching your arms simultaneously, and grasp your toes.\nMaintain the above formation and now bend further to close the gap between your chest and your thighs, and try to let your forehead rest on your legs.\nMaintain the above posture for 30 seconds while breathing calmly.\nNow, inhale and lift your torso and raise your arms over your head, relax your arms and bring them down to rest.", 
                    did_you_know: "According to the Yogic texts, the Paschimottanasana Yogasana helps to improve the flexibility and relieve tension built up in the muscles.\nThe Paschimottanasana Yogasana is very helpful for arthritis patients as it helps to relieve joint pain, stiffness and also inflammation in muscles.\nThe Paschimottanasana Yogasana is cited as one of the accomplished Yogasanas in the Shiva Samhita, a Sanskrit text, one of the three classic texts of Hatha Yoga."),
                SubExercise(
                    image: "3.circle.fill", 
                    name: "Vrikshasana", 
                    about: "Vrikshasana is a standing Yogasana. It is derived from the Sanskrit word, “Vrksa”, meaning tree.\nThe Vrikshasana Yogasana is named since the final body posture looks like the shape of a tree.\nIt helps us achieve peace of mind, It has a calming and relaxing effect and stretches the body head to toe.", 
                    how_to_do_it: "Stand straight with your feet at a distance of 2 inches apart from each other, and Concentrate on a point straight ahead.\nExhale and bend your right leg, placing the right foot on your inner left thigh. Your right heel should be touching the surface area between the tail bone and the joint, where the right and the left pelvic bones meet.\nInhale and raise the arms, joining the palms together to form the Namaskar Mudra.\nHold this posture for 30 seconds. Ensure that you maintain a normal breathing during this exercise.\nNow, breathe out and bring your arms down. Continue the exercise with your right leg down to the starting position, by repeating the steps for the other leg.", 
                    did_you_know: "The Vrikshasana Yogasana is one yoga posture underrated for people with diabetes. People with diabetes are prone to altered body orientation due to neuropathy. Regular practice of the Vrikshasana Yogasana is believed to build balance and coordination.\nRegular practice of the Vrikshasana Yogasana might help women with handling premenstrual symptoms such as muscle cramps in the abdomen and legs. It is believed that Vrikshasana Yogasana strengthens the leg muscles and tendons.\nThe knowledge of this asana is so ancient that a man in a posture similar to the tree pose can be seen etched on a seventh-century CE rock temple in Mamallapuram, a place in the south eastern state of Tamil Nadu."),
                SubExercise(
                    image: "4.circle.fill", 
                    name: "Virabhadrasana", 
                    about: "Virabhadrasana is also a standing Yogasana. The term is derived from the Sanskrit words: ‘Vira’ meaning Courageous and ‘Badra’ meaning auspicious or good.\nThe Virabhadrasana Yogasana is also known as the warrior pose.\nThis Yogasana provides strength to the shoulders, arms, thighs and muscles of the back.", 
                    how_to_do_it: "Keep all the weight of your body on one leg and keep straight.\nLean forwards and bring your arms forward while maintaining the above formation.\nLift your left leg parallel to the ground, while continuing to maintain your balance on your right leg.\nMake sure that your arms, shoulders, and your body and your left leg are in a straight alignment.\nNow, hold this formation for 30 seconds, slowly inhale and slowly exhale, and come back to the original position and repeat the same process with the other leg.", 
                    did_you_know: "Virabhadrasana is also a standing Yogasana. The term is derived from the Sanskrit words: ‘Vira’ meaning Courageous and ‘Badra’ meaning auspicious or good.\nThe regular practice of the Virabhadrasana Yogasana can help to heal or relieve the pain of a weak hamstring, by strengthening back, calves and the hamstrings.\nThe Virabhadrasana Yogasana is actually named after ‘Virabhadra’, a fierce warrior, an incarnation of Lord Shiva."),
                SubExercise(
                    image: "5.circle.fill", 
                    name: "Uttanasana", 
                    about: "Uttanasana is a standing Yogasana. It is a Sanskrit word derived from ‘Ut’ meaning Intense and ‘tan’ meaning Stretch.\nThe Uttanasana Yogasana is also known as the Camel pose.\nThe Uttanasana Yogasana, or the standing forward bend, a Yoga pose that stretches the entire body helping to strengthen the things and knees.", 
                    how_to_do_it: "Stand in a Tadasana Yogasana pose by placing your feet slightly apart, and use both of your feet to equally balance your weight.\nExtend your arms over your head while breathing in, and bend forward towards your feet while breathing out, try to keep your back as flat as possible.\nBreathe deeply while maintaining this position for 30 seconds with your legs and spine erected, and rest your hands beside your feet or on your legs.\nNow, as you breathe out, extend your chest towards your knees while lifting your tailbone and hips higher, while continuing with deep breaths allowing your head to relax and move towards your feet.\nWhile breathing in, allow your arms to stretch forward and up, and slowly move into the standing position, and as you breathe out, allow your arms to move to your sides.", 
                    did_you_know: "The Uttanasana Yogasana helps with people with Arthritis by reducing joint pain, improving joint flexibility and function, improving range of motion and providing relief.\nRegular practice of the Uttanasana Yogasana gradually increases the flexibility in the weak areas and helps in better posture by reducing the risk of injuries.\nThe Uttanasana Yogasana, appears in various yoga texts, with one documented instance being in the 19th century text Yoga Makaranda by Sri Krishnamacharya. However, the posture itself is likely much older."),
            ])   
    ]
}
