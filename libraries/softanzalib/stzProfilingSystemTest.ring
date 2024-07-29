//load "stzlib.ring"
load "stzprofsys.ring"

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
/*--  #narration ContentSize() and MemorySize()
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
*/
pron()

# What is the size in bytes of the character "A"?
# You might think it's 1 byte, but:

? Size("A") # Same as SizeInBytes()
#--> 49

# It's 49 times larger than you might expect!

# In fact, the value returned by the function is actually
# the memory size of the character as allocated by Ring,
# not just the size of its content.

# Hence, we could write the same function as:

? MemSize("A") # Same as MemorySizeInBytes()
#--> 49

# and use another function to get the size of the content itself:

? ContentSize("A") # Same as ContentSizeInBytes()
#--> 1

# which is the same as the standard Ring function:

? len("A")
#--> 1

# In practice, you would prefer to use these abbreviated forms:

? CSize("A") # C for Content
#--> 1

? MSize("A") # M for Memory
#--> 49

# And if you want to get an explanation of these 49 bytes,
# you just add the XT() prefix:

? MSizeXT("A")
#--> [
#	[ "RING_64BIT_STRING_STRUCTURE_SIZE", 48 ],
#	[ "RING_STRING_CONTENT_SIZE", 1 ]
# ]

# Hence, Ring allocates 48 bytes, when running on a 64-bit platform,
# for the internal string structure. Adding the 1 byte of the "A"
# content size, we get the 49 bytes returned by MSize().

# You may wonder how many bytes are allocated by Ring on 32-bit platforms.

# Of course, you would know it if you run MSize() and MSizeXT() on that
# platform, but Softanza offers you a way to do it, even if you are, like me,
# on a 64-bit platform: you just add the 32() prefix:

? MSize32("A")
#--> 41

? MSize32XT("A")
#--> [
#	[ "RING_32BIT_STRING_STRUCTURE_SIZE", 40 ],
#	[ "RING_STRING_CONTENT_SIZE", 1 ]
# ]

#NOTE You can use the MSize64() and MSize64XT(), the other way around, if you are
# running the code on a 32-bit architecture.


proff()
# Executed in almost 0 second(s).



#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
/*-- #narration SizeInBytes() and SizeInChars()
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#

#NOTE Read the explanative narration generated by CaludeAI after this sample...

pron()

# First part
#~~~~~~~~~~~

? SizeInBytes("فلسطين") # Or just Size()
#--> 60

? SizeInChars("فلسطين")
#--> 6

? Chars("فلسطين")
#o--> [ "ف", "ل", "س", "ط", "ي", "ن" ]

# Second part
#~~~~~~~~~~~~

? SizeInBytes("فلسطين")
#--> 60

? ContentSize("فلسطين")
#--> 12

? SizeInBytesXT("فلسطين") # Or just SizeXT()
#--> [
#	[ 'Len("فلسطين")', 12 ],
#	[ "RING_64BIT_STRING_STRUCTURE_SIZE", 48 ]
# ]

proff()
# Executed in almost 0 second(s).

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
#--- #narration generated by Claude AI
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#

# Let me break this down based on the two main parts and the overall purpose:
# The title at the top mentions "SizeInBytes() and SizeInChars()". This suggests
# that the code is demonstrating the difference between measuring string size
# in bytes versus characters, particularly for non-ASCII text (in this case, Arabic).

# First Part:
#~~~~~~~~~~~~

# This section demonstrates the difference between byte size and character
# count for the Arabic word "فلسطين" (which means "Palestine").

#~> SizeInBytes("فلسطين") returns 60 bytes
#~> SizeInChars("فلسطين") returns 6 characters
#~> Chars("فلسطين") shows the individual characters: [ "ف", "ل", "س", "ط", "ي", "ن" ]

# This illustrates that while the word has 6 characters, it takes up 60 bytes
# in memory. This is because Arabic characters, being part of the Unicode
# character set, require more than one byte per character to represent.

# Second Part:
#~~~~~~~~~~~~~

# This section provides more detailed information about the string's size:

#~> SizeInBytes("فلسطين") again shows 60 bytes

#~> ContentSize("فلسطين") returns 12, which likely represents the content size
#   in bytes without any string metadata

#~> SizeInBytesXT("فلسطين") provides extended information:
#   --> Len("فلسطين") is 12 (matching the ContentSize)
#   --> RING_64BIT_STRING_STRUCTURE_SIZE is 48

# This part demonstrates that the total 60 bytes consist of 12 bytes for
# the actual content and 48 bytes for the string structure in a 64-bit system.

# Rationale:
#~~~~~~~~~~~

# The samples are chosen to highlight the complexities of string handling
# in a programming language, especially with non-ASCII characters. It shows:

#~> The difference between character count and byte size
#~> How Unicode characters (like Arabic) require more storage
#~> The additional memory overhead for string structures in the language

# This information is crucial for programmers working with
# internationalization, optimizing memory usage, or dealing with
# string manipulations in a multi-language context.

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
/*==== #narration SizeInBytes() and SizeInBytesXT()
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#

pron()

# How many bytes are there in this japanese char (synonym of "Both" in english)?

? len("両")
#--> 3

# The char occupies 3 bytes in memory, which is true. But actually, Ring
# allocates some additional bytes to manage it internally...

? SizeInBytes("両")
#--> 51

# Let's ask Softanza to explain how we get these 51 bytes...
# ~> We just need to add and XT() prefix to the same function

? SizeInBytesXT("両")
#--> [
#	[ 'len("両")', 3 ],
#	[ 'RING_64BIT_STRING_STRUCTURE_SIZE', 48 ]
# ]

# As you see, we've got the initail 3 bytes, plus 48 bytes more, used
# by the internal structure for managing strings in Ring.

# Note that this value would be different, if the code is running on
# a computer with a 32bit architecture.

# In sutch case you will get:

? SizeInBytes("両")
#--> 43

# And:

? SizeInBytesXT("両")
#--> [
#	[ 'len("両")', 3 ],
#	[ 'RING_64BIT_STRING_STRUCTURE_SIZE', 40 ]
# ]

proff()
# Executed in 0.02 second(s).

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
/*---- Getting the size in memory of Softanza objects
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#

#NOTE
# To test this sample, and be able to use the Q() small function,
# you need to load "stzlib.ring" in the top the file and not just
# "stzprosys.ring".

pron()

? Q(20).SizeInBytes()
#--> 56

? Q("両").SizeInBytes()
#--> 51

? Q([ 20, "両" ]).SizeInBytes()
#--> 107

? Q([ "Ring", 20, "رينغ" ]).SizeInBytes()
#--> 164

? Q(new TempObject).SizeInBytes() # 7 more bytes taken by internal stzObject attributes
#--> 192

proff()
# Executed in 0.04 second(s).

class TempObject
	Language = "Ring"
	Version = 20
	InArabic = "رينغ"

#~~~~~
/*----
#~~~~~

pron()

? SizeInBytes("Ring")
#--> 52

? SizeInBytes(20)
#--> 56

? SizeInBytes("رينغ")
#--> 56

? SizeInBytes([ "Ring", 20, "رينغ" ])
#--> 248

obj = new TempObject
? SizeInBytes(obj) 
#--> 248

proff()
# Executed in 0.02 second(s).

class TempObject
	Language = "Ring"
	Version = 20
	InArabic = "رينغ"

#~~~~~
/*----
#~~~~~

pron()

?  5340.58 / 1024 + NL

? SizeInBytes(12)
#--> 56

? SizeInBytes([12])
#--> 136

? SizeInBytes(1:100)
#--> 5680

? SizeInBytes(1:1_000_000)
#--> 56_000_080

	? SizeInMegaBytes(1:1_000_000)
	#--> 54_687.58

	? SizeInGigaBytes(1:1_000_000) + NL
	#--> 53.41

proff()
# Executed in 0.14 second(s).
