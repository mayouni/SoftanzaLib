
/*
TODO: Yield and Harvest.
We just have to ๐ to their expert advice


The main difference between harvest and yield is
that in general conversation, harvest refers to
the act of gathering crops during a particular
season when they are fully grown or ready to be
consumed whereas yield refers to the amount of
produced goods that have been gained at any
given point in time.


http://www.differencebetween.net
*/

load "stzlib.ring"

? StzListQ([ "A", "B", "C" ]).ToStzListOfChars().Content()
/*

? StzListQ([ "a", "b" ]).IsMadeOfSome([ "a", "b", "c" ])

/*-------------------------
? StzStringQ("๐จโ๐ฉโ๐งโ๐ฆ").NumberOfChars()
? StzStringQ("๐จโ๐ฉโ๐งโ๐ฆ").IsSurrogate()

/*
sRoseDragon = "๐น๐";
for char in sRoseDragon {
	? char
}
// โ ๐น
// โ ๏ฟฝ

? "--"
? Q(sRoseDragon).Unicodes()
