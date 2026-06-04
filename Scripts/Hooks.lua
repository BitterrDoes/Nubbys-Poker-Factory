local Original = Card.calculate_joker
function Card:calculate_joker(self, context)
    for k, v in pairs(context) do
        if v then print(k, v) end
    end
    return Original(self, context)
end

local oldsmodsgetcardareas = SMODS.get_card_areas
function SMODS.get_card_areas(_type, _context)
    local g = oldsmodsgetcardareas(_type, _context)
    if _type == 'jokers' then
        table.insert(g, G.perks)
    end
    return g
end