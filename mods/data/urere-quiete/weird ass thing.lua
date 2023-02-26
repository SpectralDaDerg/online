
function onCreate()
    annoyingAss = 1
    --setProperty('camGame.alpha',0)
    setProperty('iconP1.alpha',0)
    setProperty('iconP2.alpha',0)
    setHealthBarColors('000000', 'ffffff')
    setProperty('healthBar.angle',90)
    setGraphicSize('healthBar',710,50)
    screenCenter('healthBar','y')

    makeLuaSprite('camGameOverlay','1',0,0)
    addLuaSprite('camGameOverlay',true)
    makeGraphic('camGameOverlay',1280*2,720*2,'000000')
    screenCenter('camGameOverlay','xy')

    makeLuaSprite('a','1',0,0)
    addLuaSprite('a',false)
    makeGraphic('a',720,60,'000000')
    setObjectCamera('a','camHUD')
    setProperty('a.angle',90)

    makeLuaSprite('diamond','1',0,0)
    addLuaSprite('diamond',false)
    makeGraphic('diamond',200,200,'ffffff')
    screenCenter('diamond','xy')
    setObjectCamera('diamond','camHUD')
    setProperty('diamond.angle',45)
    setBlendMode('diamond','LIGHTEN')
end

function onCreatePost()
    setProperty('healthBar.x',getPropertyFromGroup('playerStrums', 3, 'x')-(700/2)+getPropertyFromGroup('playerStrums', 3, 'width')+30)
    setObjectOrder('healthBar',3)
    setProperty('healthBarBG.visible',false)
    screenCenter('a',"y")
    setProperty('a.x',getProperty('healthBar.x')-(5))
    setObjectOrder('a',2)
    setObjectOrder('diamond',1)
end

function goodNoteHit(id, direction)
    annoyingAss=annoyingAss+1
    if direction == 0 then
        makeThing('aa00ff',annoyingAss)
    elseif direction == 1 then
        makeThing('00eeff',annoyingAss)
    elseif direction == 2 then
        makeThing('09ff00',annoyingAss)
    elseif direction == 3 then
        makeThing('ff0000',annoyingAss)
    end
end

function onUpdate()
    screenCenter('diamond','xy')
    --debugPrint(imageArray)
    --screenCenter('camGame','xy')
    triggerEvent('Camera Follow Pos',1280/2,720/2)
end

function noteMiss()
    annoyingAss=annoyingAss+1
    makeThing('ffffff',annoyingAss)
end

function makeThing(aaa,aids)

    setProperty('diamond.color', getColorFromHex(aaa))
    setHealthBarColors('000000', aaa)

    scaleObject('diamond',1.2,1.2)
    doTweenX('diamondDownX','diamond.scale',1,0.2,'sineInOut')
    doTweenY('diamondDownY','diamond.scale',1,0.2,'sineInOut')




    makeLuaSprite('dick'..aids,'1',0,0)
    addLuaSprite('dick'..aids,true)
    makeGraphic('dick'..aids,200,200,aaa)
    --scaleObject('dick'..aids,0.9,0.9)
    screenCenter('dick'..aids,'xy')
    --setObjectCamera('dick'..aids,'camHUD')
    setProperty('dick'..aids..'.angle',45)
    doTweenX('dickDownX'..aids,'dick'..aids..'.scale',15,5,'sineInOut')
    doTweenY('dickDownY'..aids,'dick'..aids..'.scale',15,5,'sineInOut')
    doTweenAlpha('dickDownAlpha'..aids,'dick'..aids,0,5,'sineInOut')
    setObjectOrder('dick'..aids,getObjectOrder('camGameOverlay')+aids)
    setBlendMode('dick'..aids,'LIGHTEN')
end