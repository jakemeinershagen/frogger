# frogger
A bad frogger clone.

Started 12/23/2024

https://20_games_challenge.gitlab.io/games/frogger/

ToDo:
- get despawner working
- random patters for car spawning

MVP:

- Make and animate the game obstacles. All obstacles and platforms will cross the screen horizontally.
	- Obstacles will alternate direction for each lane.
	- The road has cars. Each lane has a unique pattern of cars, and speeds vary between lanes.
	- The river has alternating lanes of logs and turtles. Some turtles can dive underwater periodically. 
		Some logs are actually crocodiles, which can eat the player if the player lands in their open mouth.
- The player should die if:
	- they leave the screen
	- they are hit by a car
	- they fall in the water (frogs can drown, apparently)
	- they are eaten by a wild animal
- If the player reaches a lillypad on the top of the screen, the lillypad will be “full.”
	When all five lillypads are full, the level is complete.
- Add a UI with a life counter and a score counter.
- Create an animation or use a particle effect to make the frog’s death extra juicy!


Future Stuff:

- 
