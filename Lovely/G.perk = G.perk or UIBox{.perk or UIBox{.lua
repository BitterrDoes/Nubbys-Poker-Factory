local function def()
    return {n=G.UIT.R, config={align = "cm", colour = lighten(G.C.JOKER_GREY, 0.5), r = 0.1}, nodes={
      {n=G.UIT.R, config={align = "cm", minw = 1.5, minh = 0.4, r = 0.1, padding = 0.05, colour = G.C.WHITE}, nodes={{n=G.UIT.R, config={align = "cm", padding = 0.03}}}}
    }}
end

if G.box then
    G.box:remove()
    G.box = nil
end

G.box = UIBox{
    definition = def(),
    config = {align='cm', w = 9, h = 4, offset = {x=0,y=0}, major = G, bond = 'Weak'}
}
return not not G.box

local function def2(desc_nodes, name)
  local name_nodes
  if not desc_nodes.name_styled then
    name_nodes = {{n=G.UIT.T, config={text = name, scale = 0.32, colour = G.C.UI.TEXT_LIGHT}}}
  else
    name_nodes = {desc_nodes.name_styled}
  end
  local t = {}
  for k, v in ipairs(desc_nodes) do
    t[#t+1] = {n=G.UIT.R, config={align = "cm"}, nodes=v}
  end
  return {n=G.UIT.R, config={align = "cm", colour = lighten(G.C.GREY, 0.15), r = 0.1}, nodes={
    {n=G.UIT.R, config={align = "tm", minh = 0.36, padding = 0.03}, nodes=name_nodes},
    {n=G.UIT.R, config={align = "cm", minw = 1.5, minh = 0.4, r = 0.1, padding = 0.05, colour = desc_nodes.background_colour or G.C.WHITE}, nodes={{n=G.UIT.R, config={align = "cm", padding = 0.03}, nodes=t}}}
  }}
end

local function def()
    return  {n=G.UIT.R, config={align = "cm"}, nodes={
              {n=G.UIT.R, config={align = "cm", colour = lighten(G.C.JOKER_GREY, 0.5), r = 0.1, padding = 0.05, emboss = 0.05}, nodes={
                def2(G.jokers.cards[1].ability_UIBox_table.info, G.jokers.cards[1].label)
              }}
            }}
end

if G.box then
    G.box:remove()
    G.box = nil
end

G.box = UIBox{
    definition = def(),
    config = {align='cm', w = 9, h = 4, offset = {x=0,y=0}, major = G, bond = 'Weak'}
}
return not not G.box



local card = G.jokers.cards[1]
card.ability_UIBox_table = card:generate_UIBox_ability_table()

-- dont change
local function name_from_rows(name_nodes, background_colour)
  if not name_nodes or (type(name_nodes) ~= 'table') or not next(name_nodes) then return end
  return {n=G.UIT.R, config={align = "cl", padding = 0.05, r = 0.1, colour = background_colour, emboss = background_colour and 0.05 or nil}, nodes=name_nodes}
end

-- Change
local   function desc_from_rows(desc_nodes, empty, maxw)
    local t = {}
    for k, v in ipairs(desc_nodes) do
      for _, subv in pairs(v) do
        if subv.config then
          local col = subv.config.colour
          if math.floor(col[1] * 1000) == 309 and math.floor(col[2] * 1000) == 388 and math.floor(col[3] * 1000) == 403 then
            print(subv)
            col[1] = 1
            col[2] = 1
            col[3] = 1
          end
        end
      end
      t[#t+1] = {n=G.UIT.R, config={align = "cl", maxw = maxw}, nodes=v}
    end
    return {n=G.UIT.R, config={align = "cl", colour = G.C.CLEAR, r = 0.1, padding = 0.04, minw = 2, minh = 0.8, emboss = not empty and 0.05 or nil, filler = true, main_box_flag = desc_nodes.main_box_flag and true or nil}, nodes={
      {n=G.UIT.R, config={align = "cl", padding = 0.03}, nodes=t}
    }}
  end

-- change this, but only the parts i changed (G.UIDEF.card_h_popup)
local function idek()
    local AUT = card.ability_UIBox_table
    local debuffed = card.debuff
    local card_type_colour = get_type_colour(card.config.center or card.config, card)
    local card_type_text_colour = SMODS.get_card_type_text_colour(AUT.card_type, card.config.center or card.config, card)
    local card_type_background = 
        (AUT.card_type == 'Locked' and G.C.BLACK) or 
        ((AUT.card_type == 'Undiscovered') and darken(G.C.JOKER_GREY, 0.3)) or 
        (AUT.card_type == 'Enhanced' or AUT.card_type == 'Default') and darken(G.C.BLACK, 0.1) or
        (debuffed and darken(G.C.BLACK, 0.1)) or 
        (card_type_colour and darken(G.C.BLACK, 0.1)) or
        G.C.SET[AUT.card_type] or
        {0, 1, 1, 1}

    local outer_padding = 0.05
    local card_type = localize('k_'..string.lower(AUT.card_type))
    if AUT.card_type == 'Joker' or (AUT.badges and AUT.badges.force_rarity) then card_type = SMODS.Rarity:get_rarity_badge(card.config.center.rarity) end
    local is_playing_card = AUT.card_type == 'Enhanced' or AUT.card_type == 'Default'

    local badges = {}
    local obj = card.config.center
    if AUT.badges and (AUT.badges.card_type or AUT.badges.force_rarity) then
        if obj and (obj.set_card_type_badge or obj.type and obj.type.set_card_type_badge) then
            if obj.type and type(obj.type.set_card_type_badge) == 'function' then
                obj.type:set_card_type_badge(obj, card, badges)
            end
            if type(obj.set_card_type_badge) == 'function' then
                obj:set_card_type_badge(card, badges)
            end
        else
            badges[#badges + 1] = create_badge(card_type, card_type_colour, card_type_text_colour, 1.2)
        end
    end
    if obj and obj.set_badges and type(obj.set_badges) == 'function' then
        obj:set_badges(card, badges)
    end

    AUT.main.background_colour = AUT.main.background_colour or AUT.box_colours and AUT.box_colours[1] or nil

    return {n=G.UIT.ROOT, config={align='cm', colour=G.C.CLEAR}, nodes={
        {n=G.UIT.C, config={align='cm'}, nodes={
            {n=G.UIT.R, config={padding=outer_padding, r=0.12, colour=G.C.BORDERPURPLE, emboss=0.07}, nodes={
                {n=G.UIT.R, config={align='cm', padding=0.07, r=0.1, colour=G.C.BGPURPLE}, nodes={
                    name_from_rows(AUT.name, is_playing_card and G.C.CLEAR),
                    desc_from_rows(AUT.main),
                    badges[1] and {n=G.UIT.R, config={align='cm', padding=0.03}, nodes=badges} or nil,
                }}
            }}
        }}
    }}
end

if G.box then G.box:remove()  G.box = nil end
G.box = UIBox({
    definition = idek(),
    config = {
        align = 'cm',
        bond = 'Weak',
        object = card,
        offset = {x = 0, y = 0},
    }
})

return not not G.box

eval for _, v in pairs(G.jokers.cards[1]:generate_UIBox_ability_table().main) do
  for _, k in pairs(v) do
    print(tprint(k.config))
  end
end

