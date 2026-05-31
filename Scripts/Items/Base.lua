SMODS.Joker {
    key = "flamskull",
    rarity = 1,

    pools = {
        ["Nubby"] = true
    },
    config = {extra = {
        Chance1 = 40,
        Chance2 = 10,
        xmult = 3,
    }}

    calculate = function(self, card, context)
        if context.joker_main then
            if math.random(1, 100) <= card.ability.extra.Chance2 then
                G.E_MANAGER:add_event(Event({
                    func = function()
                        
                    end
                }))
            end
            if math.random(1, 100) <= card.ability.extra.Chance1 then

            end
        end
    end,
}