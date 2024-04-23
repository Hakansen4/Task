professionsWindow = nil
professionsButton = nil
skillButton = nil

function init()
  connect(LocalPlayer, {})
  connect(g_game, {
    onGameStart = refresh,
    onGameEnd = offline
  })

  professionsButton = modules.client_topmenu.addRightGameToggleButton('professionsButton', tr('Professions') .. ' (Ctrl+R)', '/images/topbuttons/professions', toggle)
  professionsButton:setOn(true)
  
  professionsWindow = g_ui.loadUI('professions', modules.game_interface.getRightPanel())	
  g_keyboard.bindKeyDown('Ctrl+R', toggle)


  professionsWindow:setup()
end

function terminate()
  disconnect(LocalPlayer, {})
  disconnect(g_game, {
    onGameStart = refresh,
    onGameEnd = offline
  })

  g_keyboard.unbindKeyDown('Ctrl+R')
  professionsWindow:destroy()
  professionsButton:destroy()
end

function toggle()
  if professionsButton:isOn() then
    professionsWindow:close()
    professionsButton:setOn(false)
  else
    professionsWindow:open()
    professionsButton:setOn(true)
  end
end



function onMiniWindowClose()
  professionsButton:setOn(false)
end