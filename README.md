# acme-assembly-vscode-template

With this basic setup you will be able to write and compile 6502 assembly code on Mac, Linux or Windows. It is by no means perfect, but it should get most beginners started and is easy to setup and configure. I'm hoping to help more people with their first attempts at writing 8 bit assembly code. Also consider this repo as an invitation to improve and share my setup. Any feedback is very welcome, share your ideas in the issues section or contribute to the repo with your pull requests. Thanks!



# The setup

You will need the following:

* Visual Studio Code
* Acme Cross Assembler extension for VSCode
* Vice Emulator
* This template

## Visual Studio Code
First, get VSCode. It's a free editor by Microsoft. Now before you scream "nooooooo!!!!!!1", it is actually extremely good (I switched from a licenced version of Sublime Text happily), multi platform (Mac, Win, Linux) and most importantly __free__!
Get it here: https://code.visualstudio.com/

Now let's add an extension for syntax highlighting. Click on the extension icon, enter '__acme__' in the search bar and click on the '__Acme Cross Aseembler__' extension. There's an install button on the right side where the extension is previewed.
Unfortunately, the extension does not have any compiler functionality, so we will have to deal with that in another way.

Your VSCode setup is basically complete now, but I would recommend spending some time getting comfortable with it. The documentation is great, well done Microsoft.

Some recommendations to configure VSCode:
* get the "Material Icon Theme"
* I'm using the "Monokai" Color Theme (Code -> Preferences -> Color Theme)

## VICE Emulator

If you have VICE already installed, which is very likely the case, there's nothing else to do for you here.
If you haven't installed VICE yet, get it: http://vice-emu.sourceforge.net/index.html#download

## Download this repository

Save it anywhere you like.
So the magic of this template lies in two things. First, all binaries needed for compiling (the ACME assembler, the Pucrunch & Exomizer packers) are included in the '__bin__' folder. Code purists might wave their fist in agony now (as it is usually not advised to check in binaries in git), but I found this to be the most comfortable way for newbies to not get lost in configuration.

Second, there's a folder called '__.vscode__' with a file called '__tasks.json__'. This is where the files are send to the compiler. Depending on your operating system, the folder might be invisible, but VSCode is your friend. Drag and drop the repository folder into VSCode and it will display the folder structure on the left side, including the hidden '__.vscode__' folder.


