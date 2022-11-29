/// @desc Core Player Logic

//Get Player Inputs
key_left = keyboard_check(vk_left);
key_right = keyboard_check(vk_right);
key_jump = keyboard_check_pressed(vk_space);

//Calculate movement
var _move = key_right - key_left;

hsp = _move * walksp;

vsp = vsp + grv;

if (place_meeting(x,y+1,obj_InvisibleWall)) && (key_jump)
{
	vsp = -jumpsp
}

//Horizontal collision
if (place_meeting(x+hsp,y,obj_InvisibleWall))
{
	while (!place_meeting(x+sign(hsp),y,obj_InvisibleWall))
	{
		x = x + sign(hsp);
	}
	hsp = 0;
}
x = x + hsp;

//Vertical collision
if (place_meeting(x,y+vsp,obj_InvisibleWall))
{
	while (!place_meeting(x,y+sign(vsp),obj_InvisibleWall))
	{
		y = y + sign(vsp);
	}
	vsp = 0;
}
y = y + vsp;

//Animation

if (!place_meeting(x,y+1,obj_InvisibleWall))
{
	sprite_index = spr_CyportatoJump;
	image_speed = 0;
	if (vsp > 0) image_index = 4; else image_index = 2;
}