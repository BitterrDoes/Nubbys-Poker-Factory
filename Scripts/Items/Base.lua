SMODS.Joker { -- Flame Skull
    key = "flamskull",

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

    pools = {
        ["Nubby"] = true
    },
    config = {extra = {
        scoredChips = 0,
        scoredXChips = 0,
        scoredMult = 0,
        scoredXMult = 0,
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

        elseif context.final_scoring_step then
            -- Get card.ability.extra, return all the stuff, along with the function that'll be trigger after and reset all abilty.extra stuff
        end
    end,
}

    SMODS.Joker {  -- Monstrosity +
        key = "monstrosityPLUS",

        pools = {
            ["Nubby"] = true
        },
        config = {extra = {
            scoredChips = 0,
            scoredXChips = 0,
            scoredMult = 0,
            scoredXMult = 0,
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

            elseif context.final_scoring_step then
                -- Get card.ability.extra, return all the stuff, along with the function that'll be trigger after and reset all abilty.extra stuff
            end
        end,
    }