# acme-assembly-vscode-template

With this basic setup you will be able to write and compile 6502 assembly code on Mac, Linux or Windows. It is by no means perfect, but it should get most beginners started and is easy to setup and configure. I'm hoping to help more people with their first attempts at writing 8 bit assembly code. Also consider this repo as an invitation to improve and share my setup. Any feedback is very welcome, share your ideas in the issues section or contribute to the repo with your pull requests. Thanks!

![vscode](https://user-images.githubusercontent.com/434355/50896182-9692ae80-1408-11e9-81a0-bead20a5c8b2.jpg)


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

![acme-install](https://user-images.githubusercontent.com/434355/50896183-9692ae80-1408-11e9-8a2c-cbad1e925515.jpg)

![acme-preview](https://user-images.githubusercontent.com/434355/50896180-9692ae80-1408-11e9-9b50-484d9b088591.jpg)


Your VSCode setup is basically complete now, but I would recommend spending some time getting comfortable with it. The documentation is great, well done Microsoft.

Some recommendations to configure VSCode:
* get the "Material Icon Theme"
* I'm using the "Monokai" Color Theme (Code -> Preferences -> Color Theme)

## VICE Emulator

If you have VICE already installed, which is very likely the case, there's nothing else to do for you here.
Otherwise, get it here: http://vice-emu.sourceforge.net/index.html#download

## Download & configure this repository

Save it anywhere you like.
So the magic of this template lies in two things. First, all binaries needed for compiling (the ACME assembler, the Pucrunch & Exomizer packers) are included in the '__bin__' folder. Code purists might wave their fist in agony now (as it is usually not advised to check in binaries in git), but I found this to be the most comfortable way for newbies to not get lost in configuration.

Second, there's a folder called '__.vscode__' with a file called '__tasks.json__'. This is where the files are send to the compiler. Depending on your operating system, the folder might be invisible, but VSCode is your friend. Drag and drop the repository folder into VSCode and it will display the folder structure on the left side, including the hidden '__.vscode__' folder.

![folders](https://user-images.githubusercontent.com/434355/50896181-9692ae80-1408-11e9-88a7-6c5227c8807d.jpg)

## Configure tasks.json

Click on the '__tasks.json__' file. It will look like this:

````
{
    // See https://go.microsoft.com/fwlink/?LinkId=733558
    // for the documentation about the tasks.json format
    "version": "2.0.0",
    "tasks": [
        {
            "label": "build C64 VICE",
            "type": "shell",
            "command": "bin/acme -f cbm -l build/lables -o build/main.prg code/main.asm && /Applications/Vice/x64.app/Contents/MacOS/x64 -moncommands build/lables build/main.prg 2> /dev/null",
            "group": {
                "kind": "build",
                "isDefault": true
            },
            "presentation": {
                "clear": true
            },
            "problemMatcher": []
        },
        {
            "label": "build C64 Pucrunch VICE",
            "type": "shell",
            "command": "bin/acme -f cbm -l build/lables -o build/main.prg code/main.asm && bin/pucrunch build/main.prg build/main.prg && /Applications/Vice/x64.app/Contents/MacOS/x64 -moncommands build/lables build/main.prg 2> /dev/null",
            "presentation": {
                "clear": true
            },
            "problemMatcher": []
        },
        {
            "label": "build C16 VICE",
            "type": "shell",
            "command": "bin/acme -f cbm -l build/lables -o build/main.prg code/main.asm && bin/pucrunch build/main.prg build/main.prg && /Applications/Vice/xplus4.app/Contents/MacOS/xplus4 -moncommands build/lables build/main.prg 2> /dev/null",
            "presentation": {
                "clear": true
            },
            "problemMatcher": []
        }
    ]
}
````

Don't worry if it looks complicated at first. We'll get through it together, it's easier than you think. VSCode uses a concept called '__tasks__' for handling build setups. These tasks are stored in __JSON__ format in this __tasks.json__ file. I've created three build tasks here:

* compile and display in Vice 64 Emulator (Commodore 64)
* compile, crunch with Pucrunch and display in Vice 64 Emulator (Commodore 64)
* compile and display in Vice Plus/4 Emulator (Commodore C16, C116 & Plus/4)

Let's check out the second one in detail:

````
{
    "label": "build C64 Pucrunch VICE",
    "type": "shell",
    "command": "bin/acme -f cbm -l build/lables -o build/main.prg code/main.asm && bin/pucrunch build/main.prg build/main.prg && /Applications/Vice/x64.app/Contents/MacOS/x64 -moncommands build/lables build/main.prg 2> /dev/null",
    "presentation": {
        "clear": true
    },
    "problemMatcher": []
}
`````

````
"label": "build C64 Pucrunch VICE"
````

This is the label (task name) that will show up in VSCode so that you know which task to choose. You can rename this to whatever you want. Name it "Compile that shit, sucker!". Have some fun while coding.



````
"type": "shell"
````

This means that the following command will be executed using the shell (terminal command). Don't change this.


````
"command": "bin/acme -f cbm -l build/lables -o build/main.prg code/main.asm && bin/pucrunch build/main.prg build/main.prg && /Applications/Vice/x64.app/Contents/MacOS/x64 -moncommands build/lables build/main.prg 2> /dev/null"
````



Whoa, a lot happening here. Well, this is where all the magic happens really. This is a chain of commands (separated by '__&&__') VSCode executes for you every time you start a new build. Let's look at it in more detail:



````
bin/acme -f cbm -l build/lables -o build/main.prg code/main.asm
````

This section starts the __acme compiler__ that resides in the __bin__ folder of the repository. If you have __acme__ already installed on your system, feel free to use the path to that installation. You can delete the binary in the bin folder then.

The command reads like this: 

run the __acme compiler__, set the __file format__ to __cbm__ (-f cbm), create a __lables file__ in the build folder (-l build/lables), output the compiled program as __main.prg__ in the build folder (-o build/main.prg) and take __main.asm__ as the input (code/main.asm).

There's a lot that you can adjust to your liking here. I recommend to check out the __acme__ quick reference for further information: https://sourceforge.net/p/acme-crossass/code-0/6/tree/trunk/docs/QuickRef.txt
