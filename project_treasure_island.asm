.model small
.stack 100h

.data
WelcomeMsg db 'Welcome to the Treasure Island Game!$', 0
GoalMsg db 'Your Goal is to find out the hidden treasure$', 0
ThreePathMsg db 'You got three paths ahead of you.$', 0
ChoicePrompt db 'Do you want to:$', 0

LeftMsg db '1. Take the left path.$', 0
MiddleMsg db '2. Take the middle path.$', 0
RightMsg db '3. Take the right path.(Enter 1, 2, or 3):$', 0

EncounterAnimal db 'You walk down the left path and encounter a wild animal.$', 0
RunMsg db '1. Run away$', 0
FightMsg db '2. Fight the animal$', 0
TameMsg db '3. Try to tame the animal(Enter 1, 2, or 3): $', 0

FindCave db 'You take the middle path and find a mysterious cave.$', 0
CaveMsg db '1. Enter the cave.$', 0
WalkMsg db '2. Walk past the cave.$', 0
CampMsg db '3. Set up camp outside the cave.(Enter 1, 2, or 3):$', 0

FindRiver db 'You take the right path and come across a river.$', 0
SwimMsg db '1. Swim across the river.$', 0
RaftMsg db '2. Build a raft.$', 0
DownstreamMsg db '3. Follow the river downstream. (Enter 1, 2, or 3): $', 0

LoseMsg db 'You have lost the game.$', 0
WinMsg db 'You have won the game.$'
newline db 13, 10, '$'

leftcase1 db 'You tried to run away but the animal catch you and killed you$'
leftcase2 db 'You had a fight against the animal but you lose to it.$'
leftcase3 db 'The animal becomes your loyal companion and helps you find a hidden treasure in the forest.$', 0

midcase1 db 'You enter the cave and discover that it''s the home of a dragon . The dragon kills you!$', 0
midcase2 db 'You decide to walk past the cave. You find a beautiful clearing with a hidden waterfall . You decide to rest here and enjoy the serene environment. You have found a peaceful spot and treasure!$', 0
midcase3 db 'You set up camp outside the cave. During the night, you hear strange noises coming from inside you find a wolf it kills you: $', 0

rightcase1 db 'You successfully cross the river and find a hidden treasure chest on the other side.$', 0
rightcase2 db 'Your raft brokes and you died$'
rightcase3 db 'You follow the river downstream and find a village.The villagers welcome you and you decide to stay.You have found a new home and treasure!$', 0



.code
main:
    ; Initialize data segment
    mov ax, @data
    mov ds, ax

    ; Welcome message
    lea dx, WelcomeMsg
    call DisplayString
    lea dx, newline
    call DisplayString

    ; Goal message
    lea dx, GoalMsg
    call DisplayString
    lea dx, newline
    call DisplayString

    ; Path message
    lea dx, ThreePathMsg
    call DisplayString
    lea dx, newline
    call DisplayString

    ; Choice prompt
    lea dx, ChoicePrompt
    call DisplayString
    lea dx, newline
    call DisplayString

    ; Display options for paths
    lea dx, LeftMsg
    call DisplayString
    lea dx, newline
    call DisplayString
    lea dx, MiddleMsg
    call DisplayString
    lea dx, newline
    call DisplayString
    lea dx, RightMsg
    call DisplayString
    lea dx, newline
    call DisplayString

    ; Read user choice
    call ReadChoice
    cmp al, '1'
    je PathLeft
    cmp al, '2'
    je PathMiddle
    cmp al, '3'
    je PathRight
    jmp EndGame

PathLeft:
    lea dx, newline
    call DisplayString
    lea dx, EncounterAnimal
    call DisplayString
    lea dx, newline
    call DisplayString

    ; Choice prompt for animal encounter
    lea dx, ChoicePrompt
    call DisplayString
    lea dx, newline
    call DisplayString

    lea dx, RunMsg
    call DisplayString
    lea dx, newline
    call DisplayString
    
    lea dx, FightMsg
    call DisplayString
    lea dx, newline
    call DisplayString
    
    lea dx, TameMsg
    call DisplayString
    lea dx, newline
    call DisplayString

    ; Read user choice
    call ReadChoice
    cmp al, '1'
    je RunAway
    cmp al, '2'
    je FightAnimal
    jmp TameAnimal

RunAway:
    lea dx, newline
    call DisplayString
    lea dx, leftcase1
    call DisplayString
    lea dx, newline
    call DisplayString
    lea dx, LoseMsg
    call DisplayString
    lea dx, newline
    call DisplayString
    jmp EndGame

FightAnimal:
    lea dx, newline
    call DisplayString
    lea dx, leftcase2
    call DisplayString
    lea dx, newline
    call DisplayString
    lea dx, LoseMsg
    call DisplayString
    lea dx, newline
    call DisplayString
    jmp EndGame

TameAnimal:
    lea dx, newline
    call DisplayString
    lea dx, leftcase3
    call DisplayString
    lea dx, newline
    call DisplayString
    lea dx, WinMsg
    call DisplayString
    lea dx, newline
    call DisplayString
    jmp EndGame

PathMiddle:
    lea dx, FindCave
    call DisplayString
    lea dx, newline
    call DisplayString

    ; Display options for cave encounter
    lea dx, ChoicePrompt
    call DisplayString
    lea dx, newline
    call DisplayString

    lea dx, CaveMsg
    call DisplayString
    lea dx, newline
    call DisplayString
    lea dx, WalkMsg
    call DisplayString
    lea dx, newline
    call DisplayString
    lea dx, CampMsg
    call DisplayString
    lea dx, newline
    call DisplayString

    call ReadChoice
    cmp al, '1'
    je EnterCave
    cmp al, '2'
    je WalkPastCave
    jmp SetCamp

EnterCave:
    lea dx, newline
    call DisplayString
    lea dx, midcase1
    call DisplayString
    lea dx, newline
    call DisplayString
    lea dx, LoseMsg
    call DisplayString
    lea dx, newline
    call DisplayString
    jmp EndGame

WalkPastCave:
    lea dx, newline
    call DisplayString
    lea dx, midcase2
    call DisplayString
    lea dx, newline
    call DisplayString
    lea dx, WinMsg
    call DisplayString
    lea dx, newline
    call DisplayString
    jmp EndGame

SetCamp:
    lea dx, newline
    call DisplayString
    lea dx, midcase3
    call DisplayString
    lea dx, newline
    call DisplayString
    lea dx, LoseMsg
    call DisplayString
    lea dx, newline
    call DisplayString
    jmp EndGame


PathRight:
    lea dx, FindRiver
    call DisplayString
    lea dx, newline
    call DisplayString

    ; Display options for river encounter
    lea dx, ChoicePrompt
    call DisplayString
    lea dx, newline
    call DisplayString

    lea dx, SwimMsg
    call DisplayString
    lea dx, newline
    call DisplayString
    lea dx, RaftMsg
    call DisplayString
    lea dx, newline
    call DisplayString
    lea dx, DownstreamMsg
    call DisplayString
    lea dx, newline
    call DisplayString

    call ReadChoice
    cmp al, '1'
    je SwimRiver
    cmp al, '2'
    je BuildRaft
    jmp FollowRiver

SwimRiver:
    lea dx, newline
    call DisplayString
    lea dx, rightcase1
    call DisplayString
    lea dx, newline
    call DisplayString
    lea dx, WinMsg
    call DisplayString
    lea dx, newline
    call DisplayString
    jmp EndGame

BuildRaft:
    lea dx, newline
    call DisplayString
    lea dx, rightcase2
    call DisplayString
    lea dx, newline
    call DisplayString
    lea dx, LoseMsg
    call DisplayString
    lea dx, newline
    call DisplayString
    jmp EndGame

FollowRiver:
    lea dx, newline
    call DisplayString
    lea dx, rightcase3
    call DisplayString
    lea dx, newline
    call DisplayString
    lea dx, WinMsg
    call DisplayString
    lea dx, newline
    call DisplayString
    jmp EndGame

EndGame:
    mov ah, 4Ch
    int 21h

DisplayString:
    mov ah, 09h
    int 21h
    ret

ReadChoice:
    mov ah, 01h
    int 21h
    ret

end main
