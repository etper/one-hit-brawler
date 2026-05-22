extends Node

## MVP — One-Hit Physics Brawler
#
#Goal:
#Get to “this feels insanely powerful” in the shortest possible time.
#
#---
#
## Core Fantasy
#
#Player:
#
#* moves fast
#* kills in one hit
#* launches enemies into walls
#* never stops moving
#
#If that feeling works, the game works.
#
#---
#
## Absolute Minimum Features
#
### 1. Small Arena
#
#Just:
#
#* flat ground
#* a few walls
#* maybe pillars
#
#Do not build levels yet.
#
#---
#
### 2. Movement
#
#Need only:
#
#* WASD
#* jump
#* dash
#
#Dash is the important part.
#
#Make it:
#
#* very fast
#* low cooldown
#* momentum-heavy
#
#The movement carries the whole game.
#
#---
#
### 3. One Attack
#
#Only one:
#
#* punch
  #OR
#* bat
  #OR
#* shotgun blast
#
#Best sdt option:
#→ directional punch shockwave
#
#Reason:
#
#* no weapon models
#* no reload system
#* no ammo
#* no animations required initially
#
#Implementation:
#
#* sphere overlap in front of player
#* apply huge force
#* enemy dies instantly
#
#---
#
### 4. Enemies
#
#Use capsules.
#
#Enemy behavior:
#
#* walk toward player
#* attack if close
#
#That's it.
#
#No pathfinding initially if possible.
#
#---
#
### 5. Ragdoll / Launch
#
#MOST IMPORTANT PART.
#
#When enemy dies:
#
#* disable AI
#* apply absurd force
#* ragdoll OR fake ragdoll
#
#Even fake ragdoll is enough initially:
#
#* detached rigidbody capsule
#* flies into wall
#
#You need:
#
#* impact
#* speed
#* chaos
#
#---
#
### 6. Combo Counter
#
#Very cheap dopamine system.
#
#Example:
#
#* “x12”
#* “RAMPAGE”
#* screen shake increases
#
#No scoring system beyond this.
#
#---
#
## Fake Polish That Gives Huge Value
#
#These matter WAY more than graphics.
#
### Add:
#
#* hitstop (0.05 sec freeze on impact)
#* screen shake
#* bass-heavy hit sound
#* enemy blood puff
#* motion blur during dash
#* trail renderer
#
#These create the invincible feeling.
#
#---
#
## Ignore Completely For MVP
#
#Do NOT build:
#
#* story
#* inventory
#* progression
#* skill tree
#* multiple weapons
#* advanced enemy AI
#* multiplayer
#* open world
#* menus beyond “play”
#* saving system
#
#All waste time before core fun exists.
#
#---
#
## 30-Minute Fun Test
#
#Your MVP succeeds if:
#
#* tester laughs after first hit
#* tester starts moving aggressively automatically
#* tester tries to chain kills
#* tester says “holy shit” after enemy launch
#
#If not:
#improve:
#
#* force
#* speed
#* feedback
#
#NOT content.
#
#---
#
## Best Tech Choice For SDT
#
#Probably:
#
#* Unity
  #OR
#* Godot
#
#Unity easier for:
#
#* physics chaos
#* asset availability
#* fast iteration
#
#---
#
## Development Order
#
#1. Movement
#2. Dash
#3. Enemy capsule
#4. Punch force
#5. Death launch
#6. Hit effects
#7. Combo counter
#8. More enemies
#
#Do not reorder this.
#
#---
#
## Extremely Important
#
#The game should feel:
#
#* unfair
#* explosive
#* fast
#* abusive toward enemies
#
#If enemies feel threatening early on, you probably reduced the fantasy too much.
