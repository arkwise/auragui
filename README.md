# Ozone & Aura Desktop for DOS
this project is a continuation of aura gui and ozone gui's code base being merged together (as many of the aura apps were not public code).
basically we are going to make this into a stand alone GUI/SHELL for freeDOS and other dos's that has net applications and is to encourge a community reach and education of the dos operating systems.

shells and graphical user interfaces are an important thing in modern computing and this project aims to bring a linux like shell/gui to the freedos system.

the original works were done by lukas lipka, point mad, floria xaiver, chase finn (finn tech) and chelson aitcheson (doscore).

Aura always was opensource https://sourceforge.net/projects/auraguifreedos/ but this code was messy, buggy and not maintained very well. this new project is much cleaner code and everything is working.

# GOALS

# 1 TCP
TCP library (wattcp) has been added to the "aura m5" kernel which requires a ne2000 driver or any packet driver to run the aura kernel and connect to the internet.
the apps htmlget, myip and PING are NOT public license but i (chelson) have shared them anyway in order for people to make their own apps in the future.

# 2 Judas Library HD ac97 audio (azalia)
the plan is to add this to the aura kernel in the next coming weeks. i have been testing this on real hardware with some pretty good success from this project https://github.com/volkertb/JUDAS but i have also made a large amount of updates for more hardware devices.

# 3 netplay, doslife online games service
earlier in 2020 we built a tic tac toe game that can be played via server and over LAN. the basic logic was figured out and we will add this game to aura gui. one of the goals i would like to see is people create online games and chat services etc like the good old msn zone days.

while i am working on the Dead Sea's game i am using some of the online game features we are writing for use on the doslife service which will give coders an API to allow them to create simple dos games that can connect to the doscore server no matter how basic or primitive the games are.

having an API, SDK and a platform for people to create and share DOS based games and entertainment could make dos a popular retro platform with a purpose!

# 4 Aura SDK
while the code will always be hosted here i am planing on releasing a zip, bootable cd/USB SDK that has a pre built DJGPP development environment with all the required libraries ready to rock and roll to encourage people to develop games using the kit and the Doslife API.

# 5 Seal 2 GUI
we will also compiled the seal 2 gui and going to dub it as 2.1.3 or something with, judas, doslife and tcp also included but this will be later.

# conclusion
while i love freedos and old and new computers aura will aim to be a modern linux like shell/gui for use on modern systems more so than older systems. trust me when i say it should work fine on most old systems, my test system is a pentium 1 mmx with 32mb ram and it runs fine. so this as the base line we should cover most modern computers.

# want to help but you cant code?
if you love these kinds of projects and. want to see some cool development happen for freedos and gui/shell developments then fund us!
https://www.patreon.com/chelsonofdoscore

all the funds you contribute will help bring this to reality. i love dos and you do thats why you are here but sometimes we dont have the spare time or the know how to code everything. if we can get this to a point where we have a great api and SDK many people will be able to code thier own games
