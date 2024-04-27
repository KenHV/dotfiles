local profiles = {"fast", "default", "high-quality"}
local profile_index = 1

function cycle_profile()
    mp.commandv("apply-profile", profiles[profile_index])
    mp.osd_message("Profile: " .. profiles[profile_index])
    profile_index = profile_index % #profiles + 1
end

mp.add_key_binding("1", "cycle_profile", cycle_profile)