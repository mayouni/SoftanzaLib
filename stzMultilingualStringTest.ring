load "stzlib.ring"
/*
? LongToShortLanguageAbbreviation("ara")
? NameToShortLangaugeAbbreviation("arabic")
? NameToshortLanguageAbbreviation
*/

o1 = new stzMultiString([ :english = "house", :fr = "maison", :arabic = "منزل" ])
//? o1.Content()
? o1.tr(:ara) # Gives "maison"
? o1.tr(:french)# Gives "منزل"

? o1.ar_fr()


