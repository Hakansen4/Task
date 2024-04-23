--Buttons and window
task1Button = nil
task1Window = nil
movingButton = nil

--values
moveStep = 2
moveInterval = 100
needDistance = 55
startingValue = 0
randomY = 0

function init()

  --Configurations
  task1Button = modules.client_topmenu.addRightToggleButton('task1Button', tr('First Task'), '/task_first/task_first/task_first', closing)
  task1Button:setOn(false)

  task1Window = g_ui.displayUI('task_first')
  task1Window:setVisible(false)
  
  --get help values
  allTabs = task1Window:recursiveGetChildById('allTabs')
  allTabs:setContentWidget(task1Window:getChildById('optionsTabContent'))
  
  --getting button
  movingButton = task1Window:getChildById('moveButton')
  --reseting button's position
  restartMovement()
  --starting button's movement with loop
  scheduleEvent(MoveButton, moveInterval)
end

function MoveButton()
	--first getting button's position
	local posX = movingButton:getPosition().x
	--moving position to the right
    posX = posX - moveStep
	--checking button's position for is it pass the panel's border
    if posX <= task1Window:getPosition().x then
	--if it is then move the button to the beginning position and give random y
        posX = startingValue
	--getting randomly between panels height borders
		randomY = math.random(task1Window:getPosition().y + 20,task1Window:getPosition().y + task1Window:getHeight() - 60)
    end
    --applying values to the button
    movingButton:setPosition({ x = posX, y = randomY })
	--continue loop
    scheduleEvent(MoveButton, moveInterval)
end

function restartMovement()
  --getting randomly between panels height borders
  randomY = math.random(task1Window:getPosition().y + 20 , task1Window:getPosition().y + task1Window:getHeight() - 60)
  --getting starter x position with panel's values (need distance because panel's edges)
  startingValue = task1Window:getPosition().x + task1Window:getWidth() - needDistance
  --applying values to the button
  movingButton:setPosition({x = startingValue, y = randomY})
end

function terminate()
  --On terminate closing everything
  task1Button:destroy()
  task1Window:destroy()
end

function closing()
  --first checking is button on? Then making false window's and button's visibles
  if task1Button:isOn() then
    task1Window:setVisible(false)
    task1Button:setOn(false)
  else
    task1Window:setVisible(true)
    task1Button:setOn(true)
  end
end
function moveButton()
  --checking is button on and if it is restart movement because this button called when button clicked (check .otui file)
  if task1Button:isOn() then
	restartMovement()
  else
    task1Window:setVisible(true)
    task1Button:setOn(true)
  end
end

function onMiniWindowClose()
  task1Button:setOn(false)
end