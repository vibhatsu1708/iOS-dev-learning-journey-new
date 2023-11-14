import Foundation

let reservationsInPerson: Set<String> = ["12345678", "23456781", "34567891", "45678912"]
let reservationsOverPhone: Set<String> = ["56789123", "67891234", "78912345", "89123456"]
let reservationsOverInternet: Set<String> = ["01234567", "12345670", "23456701", "34567012"]

let inPersonAndOverPhone: Set<String> = reservationsInPerson.union(reservationsOverPhone)

let allPhoneNumbers: Set<String> = inPersonAndOverPhone.union(reservationsOverInternet)

print(allPhoneNumbers)
