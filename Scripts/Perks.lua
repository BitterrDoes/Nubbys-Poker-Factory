G.P_PERK_RARITY_POOLS = {
    {},{}
}

Nuboker.Perk = SMODS.Center:extend {
    rarity = 1,
    unlocked = true,
    discovered = false,
    pos = { x = 0, y = 0 },
    display_size = { w = 47, h = 47 },
    cost = 3,
    no_shadow = true,
    config = {},
    set = 'Perk',
    area = G.perks,
    atlas = 'nub_Perks',
    class_prefix = 'prk',
    required_params = {
        'key',
    },
    inject = function(self)
        -- call the parent function to ensure all pools are set
        SMODS.Center.inject(self)
        local vanilla_rarities = { ["Common"] = 1, ["Rare"] = 2}
        self.rarity = vanilla_rarities[self.rarity] or self.rarity
        local original_rarity = vanilla_rarities[self.rarity_original] or self.rarity_original
        if self.taken_ownership and original_rarity and original_rarity ~= self.rarity then
            SMODS.remove_pool(G.P_PERK_RARITY_POOLS[original_rarity] or {}, self.key)
            SMODS.insert_pool(G.P_PERK_RARITY_POOLS[self.rarity], self, false)
        else
            SMODS.insert_pool(G.P_PERK_RARITY_POOLS[self.rarity], self)
        end
    end
}


SMODS.ObjectType {
    key = "Perk"
}

local function getCardWorth(card)
    local chips = card.base.value + (card.base.bonus or 0) * (card.base.x_chips or 1)
    local mult = (card.ability.mult or 0) + (card:get_edition().mult_mod or 0) * (card:get_edition().Xmult_mod or 1) * 
                 (card.ability.xmult or 1) * (card.ability.perma_x_mult or 1)
    return (chips * mult) or 0
end

Nuboker.Perk {
    key = "buckshot",
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                "#1",
                "#2"
            }
        }
    end,

    calculate = function(self, card, context)
        if context.cardarea == G.play and context.main_scoring then
            print("Hi")
            local sorted_Hand = {}

            for k, v in ipairs(context.full_hand) do
                sorted_Hand[k] = v
            end
            table.sort(sorted_Hand, function (a, b)
                return getCardWorth(a) > getCardWorth(b)
            end)

            if context.scoring_hand == sorted_Hand[1] then
                
                -- Force-Trigger G.Joker.cards[1] and G.Joker.cards[2]
                print("Best card is ", context.scoring_hand)

            end
        end
    end
}



