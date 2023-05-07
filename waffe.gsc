#include scripts\core_common\struct;
#include scripts\core_common\callbacks_shared;
#include scripts\core_common\clientfield_shared;
#include scripts\core_common\math_shared;
#include scripts\core_common\system_shared;
#include scripts\core_common\scoreevents_shared;
#include scripts\core_common\util_shared;
#include scripts\core_common\hud_util_shared;
#include scripts\core_common\hud_message_shared;
#include scripts\core_common\hud_shared;
#include scripts\core_common\array_shared;
#include scripts\core_common\flag_shared;
#include scripts\core_common\scene_shared.gsc;
#include scripts\zm_common\zm_weapons;

#namespace clientids_shared;

//required
autoexec __init__sytem__()
{
	system::register("clientids_shared", &__init__, undefined, undefined);
}

//required
__init__()
{


    callback::on_start_gametype(&init);
    callback::on_spawned(&onPlayerSpawned);

    if(tolower(getdvarstring(#"hash_3b7b241b78207c96")) == "zm_orange")
    {
        thread wunderwaffe_in_box();
    }
}

wunderwaffe_in_box()
{
    zm_weapons::include_zombie_weapon(#"hash_13a204ba6887b18f", 1);
    zm_weapons::include_zombie_weapon(#"hash_491ff8e9d1af03a8", 0);
    zm_weapons::add_zombie_weapon(#"hash_13a204ba6887b18f", #"hash_491ff8e9d1af03a8", 0, 0, undefined, undefined, 0, "", "special", 1, undefined, 1);
}

onPlayerSpawned()
{
    // notice how endon now takes variadic parameters
    self endon(#"disconnect", #"spawned_player");
    level endon(#"end_game", #"game_ended");
    //self thread InfiniteAmmo();
    //self thread currentZone();

    //self thread exo_suit();
    
    
    while(1)
    {
        if(self meleeButtonPressed() && self attackButtonPressed())
        {
            while(self meleeButtonPressed()) waitframe(1);
            self thread give_me_weapons();
        }
        waitframe(1);
    }
}

give_me_weapons()
{
    self zm_weapons::weapon_give(getweapon(#"hash_13a204ba6887b18f"));
}