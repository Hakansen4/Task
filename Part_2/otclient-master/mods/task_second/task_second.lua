--Window and Tab Button
taskSecondWindow = nil
taskSecondButton = nil

function init()
  --Configurations
  taskSecondWindow = g_ui.displayUI('task_second')
  taskSecondWindow:setVisible(false)

  taskSecondButton = modules.client_topmenu.addRightToggleButton('taskSecondButton', tr('Second Task'), '/task_second/task_second/task_second', closing)
  taskSecondButton:setOn(false)
  
  --get help values
  allTabs = taskSecondWindow:recursiveGetChildById('allTabs')
  allTabs:setContentWidget(taskSecondWindow:getChildById('optionsTabContent'))
  
end


function terminate()
  --On terminate closing everything
  taskSecondButton:destroy()
  taskSecondWindow:destroy()
end

function closing()
  --checking is button on and if it is restart movement because this button called when button clicked (check .otui file)
  if taskSecondButton:isOn() then
    taskSecondWindow:setVisible(false)
    taskSecondButton:setOn(false)
	canMove = false
  else
    taskSecondWindow:setVisible(true)
    taskSecondButton:setOn(true)
  end
end
function startAnimation()
--first getting game protocol for the ExtendedOpcodes
local protocolGame = g_game.getProtocolGame()
--checking for click
  if taskSecondButton:isOn() then
  if protocolGame then
	  --client sending this values to the server because we are going to manage animations in server.
      protocolGame:sendExtendedOpcode(15, 1)
    end
  else
    taskSecondWindow:setVisible(true)
    taskSecondButton:setOn(true)
  end
end

function onMiniWindowClose()
  taskSecondButton:setOn(false)
end