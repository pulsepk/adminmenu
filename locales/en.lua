local Translations = {
    error = {
        ["blips_deactivated"] = "Blips deactivated",
        ["names_deactivated"] = "Names deactivated",
        ["changed_perm_failed"] = "Choose a group!",
        ["missing_reason"] = "You must give a reason!",
        ["invalid_reason_length_ban"] = "You must give a Reason and set a Length for the ban!",
        ["no_store_vehicle_garage"] = "You cant store this vehicle in your garage..",
        ["no_vehicle"] = "You are not in a vehicle..",
        ["no_weapon"] = "You dont have a weapon in your hands..",
        ["no_free_seats"] = "The vehicle has no free seats!",
        ["failed_vehicle_owner"] = "This vehicle is already yours..",
        ["not_online"] = "This player is not online",
        ["no_receive_report"] = "You are not receiving reports",
        ["failed_set_speed"] = "You did not set a speed.. (`fast` for super-run, `normal` for normal)",
        ["failed_set_model"] = "You did not set a model..",
        ["failed_entity_copy"] = "No freeaim entity info to copy to clipboard!",
        ["not_admin"] = "You are Not an Admin",
    },
    success = {
        ["blips_activated"] = "Blips activated",
        ["names_activated"] = "Names activated",
        ["coords_copied"] = "Coordinates copied to clipboard!",
        ["heading_copied"] = "Heading copied to clipboard!",
        ["changed_perm"] = "Authority group changed",
        ["entered_vehicle"] = "Entered vehicle",
        ["success_vehicle_owner"] = "The vehicle is now yours!",
        ["receive_reports"] = "You are receiving reports",
        ["entity_copy"] = "Freeaim entity info copied to clipboard!",
        ["sucess.entered_vehicle"] = "success Entered vehicle",
        ["spawn_weapon"] = "You have spawned a Weapon ",
        ["noclip_enabled"] = "No-clip enabled",
        ["noclip_disabled"] = "No-clip disabled",
    },
    info = {
        ["ped_coords"] = "Ped Coordinates:",
        ["vehicle_dev_data"] = "Vehicle Developer Data:",
        ["ent_id"] = "Entity ID:",
        ["net_id"] = "Net ID:",
        ["net_id_not_registered"] = "Not registered",
        ["model"] = "Model",
        ["hash"] = "Hash",
        ["eng_health"] = "Engine Health:",
        ["body_health"] = "Body Health:",
        ["goto"] = "Go to",
        ["remove"] = "Remove",
        ["confirm"] = "Confirm",
        ["reason_title"] = "Reason",
        ["length"] = "Length",
        ["options"] = "Options",
        ["position"] = "Position",
        ["your_position"] = "to your position",
        ["open"] = "Open",
        ["inventories"] = "inventories",
        ["reason"] = "you need to give a reason",
        ["give"] = "give",
        ["id"] = "ID:",
        ["player_name"] = "Player Name",
        ["obj"] = "Obj",
        ["ammoforthe"] = "+%{value} Ammo for the %{weapon}",
        ["kicked_server"] = "You have been kicked from the server",
        ["check_discord"] = "🔸 Check our Discord for more information: ",
        ["banned"] = "You have been banned:",
        ["ban_perm"] = "\n\nYour ban is permanent.\n🔸 Check our Discord for more information: ",
        ["ban_expires"] = "\n\nBan expires: ",
        ["rank_level"] = "Your Permission Level Is Now ",
        ["admin_report"] = "Admin Report - ",
        ["staffchat"] = "STAFFCHAT - ",
        ["warning_chat_message"] = "^8WARNING ^7 You have been warned by",
        ["warning_staff_message"] = "^8WARNING ^7 You have warned ",
        ["no_reason_specified"] = "No reason specified",
        ["server_restart"] = "Server restart, check our Discord for more information: ",
        ["entity_view_distance"] = "Entity view distance set to: %{distance} meters",
        ["entity_view_info"] = "Entity Information",
        ["entity_view_title"] = "Entity Freeaim Mode",
        ["entity_freeaim_delete"] = "Delete Entity",
        ["entity_freeaim_freeze"] = "Freeze Entity",
        ["entity_frozen"] = "Frozen",
        ["entity_unfrozen"] = "Unfrozen",
        ["model_hash"] = "Model hash:",
        ["obj_name"] = "Object name:",
        ["ent_owner"] = "Entity owner:",
        ["cur_health"] = "Current Health:",
        ["max_health"] = "Max Health:",
        ["armour"] = "Armour:",
        ["rel_group"] = "Relation Group:",
        ["rel_to_player"] = "Relation to Player:",
        ["rel_group_custom"] = "Custom Relationship",
        ["veh_acceleration"] = "Acceleration:",
        ["veh_cur_gear"] = "Current Gear:",
        ["veh_speed_kph"] = "Kph:",
        ["veh_speed_mph"] = "Mph:",
        ["veh_rpm"] = "Rpm:",
        ["dist_to_obj"] = "Dist:",
        ["obj_heading"] = "Heading:",
        ["obj_coords"] = "Coords:",
        ["obj_rot"] = "Rotation:",
        ["obj_velocity"] = "Velocity:",
        ["obj_unknown"] = "Unknown",
        ["you_have"] = "You have ",
        ["freeaim_entity"] = " the freeaim entity",
        ["entity_del"]  = "Entity deleted",
        ["entity_del_error"] = "Error deleting entity",
    },
    menu = {
        ["admin_menu"] = "Admin Menu",
        ["admin_options"] = "Admin Options",
        ["online_players"] = "Online Players",
        ["manage_server"] = "Manage Server",
        ["weather_conditions"] = "Available Weather Options",
        ["dealer_list"] = "Dealer List",
        ["ban"] = "Ban",
        ["kick"] = "Kick",
        ["permissions"] = "Permissions",
        ["developer_options"] = "Developer Options",
        ["vehicle_options"] = "Vehicle Options",
        ["vehicle_categories"] = "Vehicle Categories",
        ["vehicle_models"] = "Vehicle Models",
        ["player_management"] = "Player Management",
        ["server_management"] = "Server Management",
        ["vehicles"] = "Vehicles",
        ["noclip"] = "NoClip",
        ["revive"] = "Revive",
        ["invisible"] = "Invisible",
        ["god"] = "Godmode",
        ["names"] = "Names",
        ["blips"] = "Blips",
        ["weather_options"] = "Weather Options",
        ["server_time"] = "Server Time",
        ["time"] = "Time",
        ["copy_vector3"] = "Copy vector3",
        ["copy_vector4"] = "Copy vector4",
        ["display_coords"] = "Display Coords",
        ["copy_heading"] = "Copy Heading",
        ["vehicle_dev_mode"] = "Vehicle Dev Mode",
        ["spawn_vehicle"] = "Spawn Vehicle",
        ["fix_vehicle"] = "Fix Vehicle",
        ["buy"] = "Buy",
        ["remove_vehicle"] = "Remove Vehicle",
        ["edit_dealer"] = "Edit Dealer ",
        ["dealer_name"] = "Dealer Name",
        ["category_name"] = "Category Name",
        ["kill"] = "Kill",
        ["freeze"] = "Freeze",
        ["spectate"] = "Spectate",
        ["bring"] = "Bring",
        ["sit_in_vehicle"] = "Sit in vehicle",
        ["open_inv"] = "Open Inventory",
        ["give_clothing_menu"] = "Give Clothing Menu",
        ["hud_dev_mode"] = "Dev Mode (qb-hud)",
        ["entity_view_options"] = "Entity View Mode",
        ["entity_view_distance"] = "Set View Distance",
        ["entity_view_freeaim"] = "Freeaim Mode",
        ["entity_view_peds"] = "Display Peds",
        ["entity_view_vehicles"] = "Display Vehicles",
        ["entity_view_objects"] = "Display Objects",
        ["entity_view_freeaim_copy"] = "Copy Freeaim Entity Info",
        ["spawn_weapons"] = "Spawn Weapons",
        ["max_mods"] = "Max car mods",
    },
    desc = {
        ["admin_options_desc"] = "Misc. Admin Options",
        ["player_management_desc"] = "View List Of Players",
        ["server_management_desc"] = "Misc. Server Options",
        ["vehicles_desc"] = "Vehicle Options",
        ["dealer_desc"] = "List of Existing Dealers",
        ["noclip_desc"] = "Enable/Disable NoClip",
        ["revive_desc"] = "Revive Yourself",
        ["invisible_desc"] = "Enable/Disable Invisibility",
        ["god_desc"] = "Enable/Disable God Mode",
        ["names_desc"] = "Enable/Disable Names overhead",
        ["blips_desc"] = "Enable/Disable Blips for players in maps",
        ["weather_desc"] = "Change The Weather",
        ["developer_desc"] = "Misc. Dev Options",
        ["vector3_desc"] = "Copy vector3 To Clipboard",
        ["vector4_desc"] = "Copy vector4 To Clipboard",
        ["display_coords_desc"] = "Show Coords On Screen",
        ["copy_heading_desc"] = "Copy Heading to Clipboard",
        ["vehicle_dev_mode_desc"] = "Display Vehicle Information",
        ["delete_laser_desc"] = "Enable/Disable Laser",
        ["spawn_vehicle_desc"] = "Spawn a vehicle",
        ["fix_vehicle_desc"] = "Fix the vehicle you are in",
        ["buy_desc"] = "Buy the vehicle for free",
        ["remove_vehicle_desc"] = "Remove closest vehicle",
        ["dealergoto_desc"] = "Goto dealer",
        ["dealerremove_desc"] = "Remove dealer",
        ["kick_reason"] = "Kick reason",
        ["confirm_kick"] = "Confirm the kick",
        ["ban_reason"] = "Ban reason",
        ["confirm_ban"] = "Confirm the ban",
        ["sit_in_veh_desc"] = "Sit in",
        ["sit_in_veh_desc2"] = "'s vehicle",
        ["clothing_menu_desc"] = "Give the Cloth menu to",
        ["hud_dev_mode_desc"] = "Enable/Disable Developer Mode",
        ["entity_view_desc"] = "View information about entities",
        ["entity_view_freeaim_desc"] = "Enable/Disable entity info via freeaim",
        ["entity_view_peds_desc"] = "Enable/Disable ped info in the world",
        ["entity_view_vehicles_desc"] = "Enable/Disable vehicle info in the world",
        ["entity_view_objects_desc"] = "Enable/Disable object info in the world",
        ["entity_view_freeaim_copy_desc"] = "Copies the Free Aim entity info to clipboard",
        ["spawn_weapons_desc"] = "Spawn Any Weapon.",
        ["max_mod_desc"] = "Max mod your current vehicle",
    },
    time = {
        ["ban_length"] = "Ban Length",
        ["1hour"] = "1 hour",
        ["6hour"] = "6 hours",
        ["12hour"] = "12 hours",
        ["1day"] = "1 Day",
        ["3day"] = "3 Days",
        ["1week"] = "1 Week",
        ["1month"] = "1 Month",
        ["3month"] = "3 Months",
        ["6month"] = "6 Months",
        ["1year"] = "1 Year",
        ["permenent"] = "Permanent",
        ["self"] = "Self",
        ["changed"] = "Time changed to %{time} hs 00 min",
    },
    weather = {
        ["extra_sunny"] = "Extra Sunny",
        ["extra_sunny_desc"] = "I'm Melting!",
        ["clear"] = "Clear",
        ["clear_desc"] = "The Perfect Day!",
        ["neutral"] = "Neutral",
        ["neutral_desc"] = "Just A Regular Day!",
        ["smog"] = "Smog",
        ["smog_desc"] = "Smoke Machine!",
        ["foggy"] = "Foggy",
        ["foggy_desc"] = "Smoke Machine x2!",
        ["overcast"] = "Overcast",
        ["overcast_desc"] = "Not Too Sunny!",
        ["clouds"] = "Clouds",
        ["clouds_desc"] = "Where's The Sun?",
        ["clearing"] = "Clearing",
        ["clearing_desc"] = "Clouds Start To Clear!",
        ["rain"] = "Rain",
        ["rain_desc"] = "Make It Rain!",
        ["thunder"] = "Thunder",
        ["thunder_desc"] = "Run and Hide!",
        ["snow"] = "Snow",
        ["snow_desc"] = "Is It Cold Out Here?",
        ["blizzard"] = "Blizzard",
        ["blizzed_desc"] = "Snow Machine?",
        ["light_snow"] = "Light Snow",
        ["light_snow_desc"] = "Starting To Feel Like Christmas!",
        ["heavy_snow"] = "Heavy Snow (XMAS)",
        ["heavy_snow_desc"] = "Snowball Fight!",
        ["halloween"] = "Halloween",
        ["halloween_desc"] = "What Was That Noise?!",
        ["weather_changed"] = "Weather Changed To: %{value}",
    },
    commands = {
        ["blips_for_player"] = "Show blips for players (Admin Only)",
        ["player_name_overhead"] = "Show player name overhead (Admin Only)",
        ["coords_dev_command"] = "Enable coord display for development stuff (Admin Only)",
        ["toogle_noclip"] = "Toggle noclip (Admin Only)",
        ["save_vehicle_garage"] = "Save Vehicle To Your Garage (Admin Only)",
        ["make_announcement"] = "Make An Announcement (Admin Only)",
        ["open_admin"] = "Open Admin Menu (Admin Only)",
        ["staffchat_message"] = "Send A Message To All Staff (Admin Only)",
        ["nui_focus"] = "Give A Player NUI Focus (Admin Only)",
        ["warn_a_player"] = "Warn A Player (Admin Only)",
        ["check_player_warning"] = "Check Player Warnings (Admin Only)",
        ["delete_player_warning"] = "Delete Players Warnings (Admin Only)",
        ["reply_to_report"] = "Reply To A Report (Admin Only)",
        ["change_ped_model"] = "Change Ped Model (Admin Only)",
        ["set_player_foot_speed"] = "Set Player Foot Speed (Admin Only)",
        ["report_toggle"] = "Toggle Incoming Reports (Admin Only)",
        ["kick_all"] = "Kick all players",
        ["ammo_amount_set"] = "Set Your Ammo Amount (Admin Only)",
    }
}

Lang = Lang or Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
