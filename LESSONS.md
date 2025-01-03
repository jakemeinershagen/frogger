
< on vector2 will not check the second element if the first element passes. I used length instead.

Area2D's collision detection was being super wacky. I still don't know what the problem was.
Hopefully it will work better on the next project. For this one I just needed to despawn objects
after they left the screen. Luckily there is a node for notifying when an object has left the 
screen, so I just used that.
