SMODS.Joker { -- Flame Skull
    key = "flamskull",
    blueprint_compat = true,

    pools = {
        ["Nubby"] = true
    },
    config = {extra = {
        Chance1 = 40,
        Chance2 = 10,
        xmult = 3,
    }},

    add_to_deck = function(self, card, from_debuff)
        if from_debuff then return end
        -- local Joker = nil
        for _, deckJoker in pairs(G.jokers.cards) do
            if deckJoker.config.center_key == "j_nub_flamskull" then
                deckJoker:remove()
                G.jokers:emplace(SMODS.create_card({
                        key = "j_nub_flamskullPLUS"
                }))
                card:remove()
                return
            end
        end
    end,

    loc_vars = function(self, info_queue, card)
        return {vars ={
            card.ability.extra.Chance1,
            card.ability.extra.Chance2,
            card.ability.extra.xmult
        }}
    end,

    calculate = function(self, card, context)
        if context.joker_main then
            local ret = {}
            if SMODS.pseudorandom_probability(card, 'flam_hands', card.ability.extra.Chance1, 100) then
                ret["message"] = "-Hands!"
                ret["colour"] = G.C.RED
                ret["func"] = function()
                    G.E_MANAGER:add_event(Event({
                        trigger = "ease",
                        ref_table = G.GAME.current_round,
                        ref_value = "hands_left",
                        ease_to = G.GAME.current_round.hands_left > 1 and 1 or 0,
                    }))
                end
            end
            if SMODS.pseudorandom_probability(card, 'flam_xmult', card.ability.extra.Chance2, 100) then
                ret["xmult"] = card.ability.extra.xmult
            end
            return ret
        end
    end,
}
    SMODS.Joker { -- Flame Skull +
        key = "flamskullPLUS",
        blueprint_compat = true,

        pools = {
            ["Nubby"] = true,
            ["Upgrade"] = true,
            ["Joker"] = false
        },
        config = {extra = {
            Chance1 = 65,
            Chance2 = 20,
            xmult = 5,
        }},


        loc_vars = function(self, info_queue, card)
            return {vars ={
                card.ability.extra.Chance1,
                card.ability.extra.Chance2,
                card.ability.extra.xmult
            }}
        end,

        calculate = function(self, card, context)
            if context.joker_main then
                local ret = {}
                if SMODS.pseudorandom_probability(card, 'flam_hands', card.ability.extra.Chance1, 100) then
                    ret["message"] = "-Hands!"
                    ret["colour"] = G.C.RED
                    ret["func"] = function()
                        G.E_MANAGER:add_event(Event({
                            trigger = "ease",
                            ref_table = G.GAME.current_round,
                            ref_value = "hands_left",
                            ease_to = G.GAME.current_round.hands_left > 1 and 1 or 0,
                        }))
                    end
                end
                if SMODS.pseudorandom_probability(card, 'flam_xmult', card.ability.extra.Chance2, 100) then
                    ret["xmult"] = card.ability.extra.xmult
                end
                return ret
            end
        end,
    }

SMODS.Joker {  -- Monstrosity
    key = "monstrosity",
        blueprint_compat = true,

    pools = {
        ["Nubby"] = true
    },
    config = {extra = {
        scoredChips = 0,
        scoredXChips = 0,
        scoredMult = 0,
        scoredXMult = 0,

        MeatOrbs = {}
    }},

    add_to_deck = function(self, card, from_debuff)
        if from_debuff then return end
        -- local Joker = nil
        for _, deckJoker in pairs(G.jokers.cards) do
            if deckJoker.config.center_key == "j_nub_monstrosity" then
                deckJoker:remove()
                G.jokers:emplace(SMODS.create_card({
                        key = "j_nub_monstrosityPLUS"
                }))
                card:remove()
                return
            end
        end
    end,

    loc_vars = function(self, info_queue, card)
        return {vars ={
            card.ability.extra.Chance1,
            card.ability.extra.Chance2,
            card.ability.extra.xmult
        }}
    end,

    calculate = function(self, card, context)
        if context.before then
            -- Spawn ball, make sure to like have speed depending on G.SETTINGS.GAMESPEED, count the stuff
            for i, _ in pairs(G.play) do
                -- Create new MeatOrb
                local Orb = card.ability.extra[i]
                Orb = 
                G.GAME
            end
        elseif context.final_scoring_step then
            -- Get card.ability.extra, return all the stuff, along with the function that'll be trigger after and reset all abilty.extra stuff
            return {
                func = function()
                    G.E_MANAGER:add_event({
                        func = function()
                            local extra = card.ability.extra
                            extra.scoredChips = 0
                            extra.scoredXChips = 0
                            extra.scoredMult = 0
                            extra.scoredXMult = 0

                            MeatOrb = {} -- Later i'll go through each one getting rid of them
                        end
                    })
                end
            }
        end
    end,
}

    SMODS.Joker {  -- Monstrosity +
        key = "monstrosityPLUS",
        blueprint_compat = true,

        pools = {
            ["Nubby"] = true,
            ["Upgrade"] = true,
            ["Joker"] = false
        },
        config = {extra = {
            scoredChips = 0,
            scoredXChips = 0,
            scoredMult = 0,
            scoredXMult = 0,
        }},

        loc_vars = function(self, info_queue, card)
            return {vars ={
                card.ability.extra.Chance1,
                card.ability.extra.Chance2,
                card.ability.extra.xmult
            }}
        end,

        calculate = function(self, card, context)
            if context.before then
                -- Spawn ball, make sure to like have speed depending on G.SETTINGS.GAMESPEED, count the stuff

            elseif context.final_scoring_step then
                -- Get card.ability.extra, return all the stuff, along with the function that'll be trigger after and reset all abilty.extra stuff
            end
        end,
    }


SMODS.Joker {
    key = "squid",
    name = "Squid",
    pronouns = "any_all",

	cost = 6,
    rarity = 4,
    blueprint_compat = true,

	config = { extra = {frame = 1, spriteFrame = 0, target = nil, storage = {atlas = "Bitters_SquidAtAss", scale = {x=96, y=96}}} },

    update = function(self, card, dt)
        local config = card.ability.extra
        config.frame = config.frame + 1 * dt

        if config.frame >= 1.02 then
            config.frame = 1

            local other_joker = nil
            if G.jokers and G.jokers.cards then
                for i = 1, #G.jokers.cards do
                    if G.jokers.cards[i] == card then 
                        other_joker = G.jokers.cards[i - 1] 
                    end
                end
            end
            
            card.ability.extra.target = other_joker
            -- Update sprite
            if G.GAME.playing and other_joker then
                local center = other_joker.children.center

                card.children.center.atlas = G.ASSET_ATLAS[center.atlas.name]
                card.children.center:set_sprite_pos({ x=center.sprite_pos.x, y= center.sprite_pos.y })
                card.children.center.scale = {x=center.scale.x, y=center.scale.y}
            else
                -- reset
                card.children.center.atlas = G.ASSET_ATLAS.Joker
                card.children.center.scale = {x=G.ASSET_ATLAS.Joker.px, y=G.ASSET_ATLAS.Joker.py}
                card.children.center:set_sprite_pos({ x=0, y=0 })
            end
        end
    end,

    calculate = function(self, card, context)
        return SMODS.blueprint_effect(card, card.ability.extra.target, context)
    end,
}

SMODS.Joker {
    key = "squidPLUS",
    pronouns = "any_all",

    rarity = 3,
    blueprint_compat = true,
    pools = {
        ["Nubby"] = true,
        ["Upgrade"] = true,
        ["Joker"] = false
    },

	config = { extra = {frame=0, target = nil} },
    
    calculate = function(self, card, context) -- Entirely made by somethingcom515 the goat himself
        print(card.ability.extra.target)
        if context.before then
            local other_joker = nil
            if G.jokers and G.jokers.cards then
                for i = 1, #G.jokers.cards do
                    if G.jokers.cards[i] == card then 
                        other_joker = G.jokers.cards[i - 1] 
                    end
                end
            end
            
            other_joker = other_joker and other_joker.key and G.P_CENTERS[other_joker.key.. "PLUS"] or other_joker
            card.ability.extra.target = other_joker

            local center = card.ability.extra.target.children.center

            card.children.center.atlas = G.ASSET_ATLAS[center.atlas.name]
            card.children.center:set_sprite_pos({ x=center.sprite_pos.x, y= center.sprite_pos.y })
            card.children.center.scale = {x=center.scale.x, y=center.scale.y}
        end
        if card.ability.extra.target and card.ability.extra.target.key then
            local key = card.ability.extra.target.key
            G.nub_savedjokercards = G.nub_savedjokercards or {}
            G.nub_savedjokercards[card.sort_id] = G.nub_savedjokercards[card.sort_id] or {}
            if not G.nub_savedjokercards[card.sort_id][key] then
                local old_ability = copy_table(card.ability)
                local old_center = card.config.center
                local old_center_key = card.config.center_key

                card:set_ability(key, nil, 'quantum')
                card:update(0.016)
                G.nub_savedjokercards[card.sort_id][key] = SMODS.shallow_copy(card)
                G.nub_savedjokercards[card.sort_id][key].ability = copy_table(G.nub_savedjokercards[card.sort_id][key].ability)
                for k, v in pairs({'T', 'VT', 'CT'}) do
                    G.nub_savedjokercards[card.sort_id][key][v] = copy_table(G.nub_savedjokercards[card.sort_id][key][v])
                end
                G.nub_savedjokercards[card.sort_id][key].config = SMODS.shallow_copy(G.nub_savedjokercards[card.sort_id][key].config)
                card.ability = old_ability
                card.config.center = old_center
                card.config.center_key = old_center_key
                for k, v in pairs({'juice_up', 'start_dissolve', 'remove', 'flip'}) do
                    G.nub_savedjokercards[card.sort_id][key][v] = function(_, ...)
                        return card[v](card, ...)
                    end
                end
            end
            return G.nub_savedjokercards[card.sort_id][key]:calculate_joker(context)
        elseif context.after then
            -- reset
            card.children.center.atlas = G.ASSET_ATLAS.Joker
            card.children.center.scale = {x=G.ASSET_ATLAS.Joker.px, y=G.ASSET_ATLAS.Joker.py}
            card.children.center:set_sprite_pos({ x=0, y=0 })
        end
    end,
}

SMODS.Joker { -- Cheese House
    key = "cheesehouse",
    pools = {
        ["Nubby"] = true,
    },

    config = {extra = {
        Points1 = 300,
        Points2 = 3000,
    }},
    loc_vars = function(self, info_queue, card)
        return {vars ={
            card.ability.extra.Points1,
            card.ability.extra.Points2,
        }}
    end,

    calculate = function(self, card, context)
        if context.final_scoring_step then
            return {
                chips = G.GAME.round_resets.ante < 4 and card.ability.extra.Points1 or card.ability.extra.Points2,
            }
        end
    end
}

    SMODS.Joker { -- Cheese House +
        key = "cheesehousePLUS",
        pools = {
            ["Nubby"] = true,
            ["Upgrade"] = true,
            ["Joker"] = false
        },


        config = {extra = {
            Points1 = 750,
            Points2 = 7500,
        }},
        loc_vars = function(self, info_queue, card)
            return {vars ={
                card.ability.extra.Points1,
                card.ability.extra.Points2,
            }}
        end,

        calculate = function(self, card, context)
            if context.final_scoring_step then
                return {
                    chips = G.GAME.round_resets.ante < 4 and card.ability.extra.Points1 or card.ability.extra.Points2,
                }
            end
        end
    }



--[[
local function GetRarity(num)
    local ret = .3
    if num == 2 then ret = 0.8 end
    if num == 3 then ret = 1 end
    return ret
end

SMODS.Joker { -- jokkerr
    key = "jokerjoker",

    loc_txt = {
        name = "Joker Joker",
    },

    config = {extra = {
        jokerRarities = {}
    }},

    calculate = function(self, card, context)
        if context.open_booster and context.booster.group_key == "k_buffoon_pack" and G.pack_cards then
            card.ability.extra.jokerRarities = {}
            for i, v in pairs(G.pack_cards.cards) do
                card.ability.extra.jokerRarities[i] = v.config.center.rarity
            end
        elseif context.skipping_booster and context.booster.group_key == "k_buffoon_pack" then
            print(G.pack_cards.cards)
            if G.pack_cards.cards then -- idk if u can do this here, but whatever
                card.ability.extra.jokerRarities = {}
                for i, v in pairs(G.pack_cards.cards) do
                    card.ability.extra.jokerRarities[i] = v.config.center.rarity
                end
            end

            table.sort(card.ability.extra.jokerRarities, function (a, b)
                return (type(a) == "number" and a or 0) > (type(b) == "number" and b or 0)
            end)
            print("Largest is ", card.ability.extra.jokerRarities[1])
            if #G.jokers.cards + G.GAME.joker_buffer < G.GAME.max_jokers then
                -- make a new random joker of the highest rarity
                local newJoker = SMODS.create_card({
                    set = 'Joker',
                    rarity = GetRarity(card.ability.extra.jokerRarities[1]),
                })
                if card.ability.extra.jokerRarities[1] == 1 then
                    -- make it special or sum
                    newJoker:set_edition(poll_edition("edition_generic", 0, false, true), true)
                end

                G.jokers:emplace(newJoker)
            end
        elseif context.ending_booster and context.booster.group_key == "k_buffoon_pack" then
            card.ability.extra.jokerRarities = {}
        end
    end
}

]]