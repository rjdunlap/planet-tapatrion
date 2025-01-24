--data.lua
local asteroid_util = require("__space-age__.prototypes.planet.asteroid-spawn-definitions")
local planet_catalogue_gleba = require("__space-age__.prototypes.planet.procession-catalogue-gleba")
local effects = require("__core__.lualib.surface-render-parameter-effects")

require("tapatrion")

--START MAP GEN
function MapGen_Tapatrion()
    local map_gen_setting = table.deepcopy(data.raw.planet.aquilo.map_gen_settings)
    map_gen_setting.property_expression_names =
    {
        ["decorative:red-desert-bush:probability"] = "gleba_red_desert_bush_probability",
        ["decorative:white-desert-bush:probability"] = "gleba_white_desert_bush_probability",
        ["decorative:red-pita:probability"] = "gleba_red_pita_probability",
        ["decorative:green-bush-mini:probability"] = "gleba_green_bush_probability",
        ["decorative:green-croton:probability"] = "gleba_green_cronton_probability",
        ["decorative:green-pita:probability"] = "gleba_green_pita_probability",
        ["decorative:green-pita-mini:probability"] = "gleba_green_pita_mini_probability",
        ["decorative:lichen-decal:probability"] = "gleba_orange_lichen_probability",
        ["decorative:shroom-decal:probability"] = "gleba_carpet_shroom_probability",
        ["decorative:cracked-mud-decal:probability"] = "gleba_cracked_mud_probability",
        ["decorative:light-mud-decal:probability"] = "gleba_light_mud_probability",
        ["decorative:dark-mud-decal:probability"] = "gleba_dark_mud_probability",
        ["decorative:green-carpet-grass:probability"] = "gleba_green_carpet_grass_probability",
        ["decorative:green-hairy-grass:probability"] = "gleba_green_hairy_grass_probability",
        elevation = "aquilo_elevation",
        temperature = "aquilo_temperature",
        moisture = "moisture_basic",
        aux = "aquilo_aux",
        cliffiness = "cliffiness_basic",
        cliff_elevation = "cliff_elevation_from_elevation",
        ["entity:crude-oil:probability"] = "aquilo_crude_oil_probability",
        ["entity:crude-oil:richness"] = "aquilo_crude_oil_richness"
    }
    map_gen_setting.autoplace_controls = {
        ["gleba_plants"] = { frequency = 12, size = 2, richness = 1},
        ["gleba_enemy_base"] = { frequency = 20, size = 1, richness = 1},
        ["gleba_water"] = {frequency = 0.4, size = 0.5, richness = 0.5},
        ["gleba_cliff"] = {},
        ["gleba_stone"] = {frequency = 15, size = 10, richness = 100},
        ["trees"] = { frequency = 4.5, size = 2, richness = 1 },
        ["enemy-base"] = { frequency = 12, size = 1.2, richness = 1},
        ["lithium_brine"] = {},
        ["fluorine_vent"] = {},
        ["aquilo_crude_oil"] = {}
    }

    map_gen_setting.autoplace_settings["tile"] =
    {
        settings =
        {
          ["snow-flat"] = {},
          ["snow-crests"] = {},
          ["snow-lumpy"] = {},
          ["snow-patchy"] = {},
          ["ice-rough"] = {},
          ["ice-smooth"] = {},
          ["brash-ice"] = {},
          ["ammoniacal-ocean"] = {},
          ["ammoniacal-ocean-2"] = {},

          ["natural-yumako-soil"] = {},
          ["natural-jellynut-soil"] = {},
          ["wetland-yumako"] = {frequency = 4, size = 1.2, richness = 1},
          ["wetland-jellynut"] = {frequency = 4, size = 1.2, richness = 1},
          ["wetland-blue-slime"] = {},
          ["wetland-light-green-slime"] = {},
          ["wetland-green-slime"] = {},
          ["wetland-light-dead-skin"] = {},
          ["wetland-dead-skin"] = {},
          ["wetland-pink-tentacle"] = {},
          ["wetland-red-tentacle"] = {},
          ["gleba-deep-lake"] = {},
          ["lowland-brown-blubber"] = {},
          ["lowland-olive-blubber"] = {},
          ["lowland-olive-blubber-2"] = {},
          ["lowland-olive-blubber-3"] = {},
          ["lowland-pale-green"] = {},
          ["lowland-cream-cauliflower"] = {},
          ["lowland-cream-cauliflower-2"] = {},
          ["lowland-dead-skin"] = {},
          ["lowland-dead-skin-2"] = {},
          ["lowland-cream-red"] = {},
          ["lowland-red-vein"] = {},
          ["lowland-red-vein-2"] = {},
          ["lowland-red-vein-3"] = {},
          ["lowland-red-vein-4"] = {},
          ["lowland-red-vein-dead"] = {},
          ["lowland-red-infection"] = {},
          ["midland-turquoise-bark"] = {},
          ["midland-turquoise-bark-2"] = {},
          ["midland-cracked-lichen"] = {},
          ["midland-cracked-lichen-dull"] = {},
          ["midland-cracked-lichen-dark"] = {},
          ["pit-rock"] = {}
        }
    }

    map_gen_setting.autoplace_settings["decorative"] =
    {
        settings =
        {
          ["lithium-iceberg-medium"] = {},
          ["lithium-iceberg-small"] = {},
          ["lithium-iceberg-tiny"] = {},
          ["floating-iceberg-large"] = {},
          ["floating-iceberg-small"] = {},
          ["aqulio-ice-decal-blue"] = {},
          ["aqulio-snowy-decal"] = {},
          ["snow-drift-decal"] = {},

          ["green-asterisk"] = {},
          ["fulgoran-ruin-tiny"] = {},
          ["fulgoran-gravewort"] = {},
          ["urchin-cactus"] = {},
          ["medium-fulgora-rock"] = {},
          ["small-fulgora-rock"] = {},
          ["tiny-fulgora-rock"] = {},
          ["yellow-lettuce-lichen-1x1"] = {},
          ["yellow-lettuce-lichen-3x3"] = {},
          ["yellow-lettuce-lichen-6x6"] = {},
          ["yellow-lettuce-lichen-cups-1x1"] = {},
          ["yellow-lettuce-lichen-cups-3x3"] = {},
          ["yellow-lettuce-lichen-cups-6x6"] = {},
          ["green-lettuce-lichen-1x1"] = {},
          ["green-lettuce-lichen-3x3"] = {},
          ["green-lettuce-lichen-6x6"] = {},
          ["green-lettuce-lichen-water-1x1"] = {},
          ["green-lettuce-lichen-water-3x3"] = {},
          ["green-lettuce-lichen-water-6x6"] = {},
          ["honeycomb-fungus"] = {},
          ["honeycomb-fungus-1x1"] = {},
          ["honeycomb-fungus-decayed"] = {},
          ["split-gill-1x1"] = {},
          ["split-gill-2x2"] = {},
          ["split-gill-dying-1x1"] = {},
          ["split-gill-dying-2x2"] = {},
          ["split-gill-red-1x1"] = {},
          ["split-gill-red-2x2"] = {},
          ["veins"] = {},
          ["veins-small"] = {},
          ["mycelium"] = {},
          ["coral-water"] = {},
          ["coral-land"] = {},
          ["black-sceptre"] = {},
          ["pink-phalanges"] = {},
          ["pink-lichen-decal"] = {},
          ["red-lichen-decal"] = {},
          ["green-cup"] = {},
          ["brown-cup"] = {},
          ["blood-grape"] = {},
          ["blood-grape-vibrant"] = {},
          ["brambles"] = {},
          ["polycephalum-slime"] = {},
          ["polycephalum-balloon"] = {},
          ["fuchsia-pita"] = {},
          ["wispy-lichen"] = {},
          ["grey-cracked-mud-decal"] = {},
          ["barnacles-decal"] = {},
          ["coral-stunted"] = {},
          ["coral-stunted-grey"] = {},
          ["nerve-roots-veins-dense"] = {},
          ["nerve-roots-veins-sparse"] = {},
          ["yellow-coral"] = {},
          ["solo-barnacle"] = {},
          ["curly-roots-orange"] = {},
          ["knobbly-roots"] = {},
          ["knobbly-roots-orange"] = {},
          ["matches-small"] = {},
          ["pale-lettuce-lichen-cups-1x1"] = {},
          ["pale-lettuce-lichen-cups-3x3"] = {},
          ["pale-lettuce-lichen-cups-6x6"] = {},
          ["pale-lettuce-lichen-1x1"] = {},
          ["pale-lettuce-lichen-3x3"] = {},
          ["pale-lettuce-lichen-6x6"] = {},
          ["pale-lettuce-lichen-water-1x1"] = {},
          ["pale-lettuce-lichen-water-3x3"] = {},
          ["pale-lettuce-lichen-water-6x6"] = {},
          ["white-carpet-grass"] = {},
          ["green-carpet-grass"] = {},
          ["green-hairy-grass"] = {},

          --shared
          ["light-mud-decal"] = {},
          ["dark-mud-decal"] = {},
          ["cracked-mud-decal"] = {},
          ["red-desert-bush"] = {},
          ["white-desert-bush"] = {},
          ["red-pita"] = {},
          ["green-bush-mini"] = {},
          ["green-croton"] = {},
          ["green-pita"] = {},
          ["green-pita-mini"] = {},
          ["lichen-decal"] = {},
          ["shroom-decal"] = {}
        }
    }

    map_gen_setting.autoplace_settings["entity"] =  { 
        settings =
        {
          ["crude-oil"] = {},
          ["lithium-brine"] = {},
          ["fluorine-vent"] = {},
          ["lithium-iceberg-huge"] = {},
          ["lithium-iceberg-big"] = {},
          ["stone"] = {},
          ["iron-stromatolite"] = {},
          ["copper-stromatolite"] = {}
        }
    }
     

    return map_gen_setting
end
-- increse stone patch size in start area
-- data.raw["resource"]["stone"]["autoplace"]["starting_area_size"] = 5500 * (0.005 / 3)

--END MAP GEN

local nauvis = data.raw["planet"]["nauvis"]
local planet_lib = require("__PlanetsLib__.lib.planet")

local start_astroid_spawn_rate =
{
  probability_on_range_chunk =
  {
    {position = 0.1, probability = asteroid_util.nauvis_chunks, angle_when_stopped = asteroid_util.chunk_angle},
    {position = 0.9, probability = asteroid_util.nauvis_chunks, angle_when_stopped = asteroid_util.chunk_angle}
  },
  type_ratios =
  {
    {position = 0.1, ratios = asteroid_util.nauvis_ratio},
    {position = 0.9, ratios = asteroid_util.nauvis_ratio},
  }
}
local start_astroid_spawn = asteroid_util.spawn_definitions(start_astroid_spawn_rate, 0.1)


local tapatrion = 
{
    type = "planet",
    name = "tapatrion", 
    solar_power_in_space = 200,
    icon = "__planet-tapatrion__/graphics/planet-tapatrion.png",
    icon_size = 512,
    label_orientation = 0.15,
    starmap_icon = "__planet-tapatrion__/graphics/planet-tapatrion.png",
    starmap_icon_size = 512,
    magnitude = nauvis.magnitude,
    surface_properties = {
        ["solar-power"] = 1,
        ["pressure"] = 2000,
        ["magnetic-field"] = 99,
        ["gravity"] = 20,
        ["day-night-cycle"] = nauvis.surface_properties["day-night-cycle"],
    },
    procession_graphic_catalogue = planet_catalogue_gleba,
    map_gen_settings = MapGen_Tapatrion(),
    asteroid_spawn_influence = 1,
    asteroid_spawn_definitions = start_astroid_spawn,
    entities_require_heating = true,
    persistent_ambient_sounds =
    {
      base_ambience =
      {
        {sound = {filename = "__space-age__/sound/wind/base-wind-gleba-night.ogg", volume = 0.8, advanced_volume_control = {darkness_threshold = 0.85}}},
        {sound = {filename = "__space-age__/sound/wind/base-wind-gleba-day.ogg", volume = 0.8, advanced_volume_control = {darkness_threshold = -0.7}}}
      },
      wind = {filename = "__space-age__/sound/wind/wind-gleba.ogg", volume = 0.8},
      crossfade =
      {
        order = {"wind", "base_ambience"},
        curve_type = "cosine",
        from = {control = 0.35, volume_percentage = 0.2},
        to = {control = 2, volume_percentage = 100.0}
      },
      semi_persistent =
      {
        {
          sound = {variations = sound_variations("__space-age__/sound/world/semi-persistent/wind-gust", 6, 0.4)},
          delay_mean_seconds = 10,
          delay_variance_seconds = 5
        },
        {
          sound =
            {
              filename = "__space-age__/sound/world/weather/rain.ogg", volume = 0.25,
              advanced_volume_control = {fades = {fade_in = {curve_type = "cosine", from = {control = 0.2, volume_percentage = 0.6}, to = {1.2, 100.0 }}}}
            }
        },
        {
          sound =
            {
              variations = sound_variations("__space-age__/sound/world/semi-persistent/night-birds", 14, 0.4),
              advanced_volume_control =
              {
                fades = {fade_in = {curve_type = "cosine", from = {control = 0.5, volume_percentage = 0.0}, to = {1.5, 100.0}}},
                darkness_threshold = 0.85
              }
            },
            delay_mean_seconds = 10,
            delay_variance_seconds = 5
        }
      }
    },
    player_effects =
    { -- TODO: replace with shader & find a way to have rain appear and disappear with weather system.
      type = "cluster",
      cluster_count = 10,
      distance = 8,
      distance_deviation = 8,
      action_delivery =
      {
        type = "instant",
        source_effects =
        {
          type = "create-trivial-smoke",
          smoke_name = "gleba-raindrops",
          speed = {-0.05, 0.5},
          initial_height = 1,
          speed_multiplier = 2,
          speed_multiplier_deviation = 0.05,
          starting_frame = 2,
          starting_frame_deviation = 2,
          offset_deviation = {{-96, -56}, {96, 40}},
          speed_from_center = 0.01,
          speed_from_center_deviation = 0.02
        }
      }
    },
    pollutant_type = "spores",
    ticks_between_player_effects = 1,
    surface_render_parameters =
    {
        fog =
        {
            fog_type = "gleba",
            shape_noise_texture =
            {
            filename = "__core__/graphics/clouds-noise.png",
            size = 2048
            },
            detail_noise_texture =
            {
            filename = "__core__/graphics/clouds-detail-noise.png",
            size = 2048
            },
            color1 = {255, 217, 139, 1.0},
            color2 = {183, 255, 169, 1.0},
            tick_factor = 0.000001,
        },
        clouds = effects.default_clouds_effect_properties(),

        -- Should be based on the default day/night times, ie
        -- sun starts to set at 0.25
        -- sun fully set at 0.45
        -- sun starts to rise at 0.55
        -- sun fully risen at 0.75
        day_night_cycle_color_lookup =
        {
            {0.00, "__space-age__/graphics/lut/gleba-1-noon.png"},
            {0.15, "__space-age__/graphics/lut/gleba-2-afternoon.png"},
            {0.25, "__space-age__/graphics/lut/gleba-3-late-afternoon.png"},
            {0.35, "__space-age__/graphics/lut/gleba-4-sunset.png"},
            {0.45, "__space-age__/graphics/lut/gleba-5-after-sunset.png"},
            {0.55, "__space-age__/graphics/lut/gleba-6-before-dawn.png"},
            {0.65, "__space-age__/graphics/lut/gleba-7-dawn.png"},
            {0.75, "__space-age__/graphics/lut/gleba-8-morning.png"},
        },

        terrain_tint_effect =
        {
            noise_texture =
            {
            filename = "__space-age__/graphics/terrain/vulcanus/tint-noise.png",
            size = 4096
            },

            offset = { 0.2, 0, 0.4, 0.8 },
            intensity = { 0.2, 0.4, 0.3, 0.15 },
            scale_u = { 1.85, 1.85, 1.85, 1.85 },
            scale_v = { 1, 1, 1, 1 },

            global_intensity = 0.5,
            global_scale = 0.4,
            zoom_factor = 3.8,
            zoom_intensity = 0.75
        }
    }
}

tapatrion.orbit = {
    parent = {
        type = "space-location",
        name = "star",
    },
    distance = 35,
    orientation = 0.225,
}


PlanetsLib:extend({tapatrion})
PlanetsLib.borrow_music(data.raw["planet"]["aquilo"], tapatrion)

data:extend {{
    type = "technology",
    name = "planet-discovery-tapatrion",
    icons = util.technology_icon_constant_planet("__planet-tapatrion__/graphics/planet-tapatrion.png"),
    icon_size = 512,
    essential = true,
    localised_description = {"space-location-description.tapatrion"},
    effects = {
        {
            type = "unlock-space-location",
            space_location = "tapatrion",
            use_icon_overlay_constant = true
        },
        {
          type = "unlock-recipe",
          recipe = "decomposition",
        }
    },
    prerequisites = {
        "space-science-pack",
    },
    unit = {
        count = 200,
        ingredients = {
            {"automation-science-pack",      1},
            {"logistic-science-pack",        1},
            {"chemical-science-pack",        1},
            {"space-science-pack",           1}
        },
        time = 60,
    },
    order = "ea[tapatrion]",
}}

data:extend({{
  type = "recipe",
  name = "decomposition",
  category = "chemistry-or-cryogenics",
  enabled = false,
  energy_required = 12,
  ingredients =
  {
    {type = "fluid", name="water", amount = 20},
    {type = "item", name = "spoilage", amount = 1},
  },
  results =
  {
    {type = "item", name = "ice", amount = 1},
    {type = "fluid", name = "ammonia", amount = 25},
  },
  allow_productivity = true,
  main_product = "",
  icon = "__space-age__/graphics/icons/fluid/ammoniacal-solution.png",
  subgroup = "fluid-recipes",
  order = "b[fluid-chemistry]-a[ammonia]",
  crafting_machine_tint = {
    primary = {r = 0.596, g = 0.764, b = 0.780, a = 1.000},
    secondary = {r = 0.551, g = 0.762, b = 0.844, a = 1.000},
    tertiary = {r = 0.596, g = 0.773, b = 0.895, a = 1.000},
    quaternary = {r = 0.290, g = 0.734, b = 1, a = 1.000},
  }
}})


for _,recipe in pairs (data.raw.recipe) do 
  if recipe.surface_conditions then
    for i, condition in pairs( recipe.surface_conditions ) do
      if condition.property == "pressure" and condition.min == 100 then 
        condition.min = 2000
        condition.max = 2000
      end
    end
  end 
end 

-- Use ice on marsh
for _,recipe in pairs (data.raw.item) do 
  if recipe.name == "ice-platform" then
    recipe.place_as_tile.tile_condition = {
      "ammoniacal-ocean", "ammoniacal-ocean-2", "brash-ice",
      "water", "deepwater", "water-green", "deepwater-green", -- all water
      "water-mud", "water-shallow", -- all shallows
      "gleba-deep-lake",
      "wetland-light-green-slime", "wetland-green-slime", "wetland-light-dead-skin", "wetland-dead-skin", "wetland-pink-tentacle", "wetland-red-tentacle", "wetland-yumako", "wetland-jellynut",
    }
  end
end



APS.add_planet{name = "tapatrion", filename = "__planet-tapatrion__/tapatrion.lua", technology = "planet-discovery-tapatrion"}