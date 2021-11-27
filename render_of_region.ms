-- Рендер только выделенной области
buttonText:"Render of region"
category:"# Scripts"

(

rollout reg_render "Render of region" width:190 height:98
(
	local vs=getViewSize()
	local ms=mouse.screenpos
	local mvp=mouse.pos
	local dp=(ms-mvp)
	local rectpos
	local bm
	local bmresize
	local rend
	local alphacol
	button btn1 "RENDER" pos:[104,8] width:78 height:46
	spinner spn1 "Prepass:" width:50 pos:[132,58] type:#integer range:[1,10,4]
	checkbox chk1 "Alpha" pos:[8,57] width:72 height:16
	button btn2 "Задать рамку" pos:[8,8] width:94 height:22
	button btn3 "Регион" pos:[8,32] width:94 height:22

	on btn1 pressed do (
	bm=undefined
	try(destroyDialog rend) catch()
	if chk1.checked==true then (backgroundColor=getVPortBGColor()) else backgroundColor=(color 0 0 0)

	rectpos=(viewport.getRegionRect viewport.activeViewport)
	ms=mouse.screenpos
	mvp=mouse.pos
	dp=(ms-mvp)
	vs=getViewSize()
		rollout rend ""
			(
			bitmap bmp1 pos:[-7,-6]
			on rend lbuttondown point2 do (destroydialog rend)
			)
		createDialog rend (rectpos.w-3) (rectpos.h-2) (dp.x+rectpos.x+2) (dp.y+rectpos.y+1) style:#()
	try(destroydialog test) catch()
	rend.bmp1.width=(rectpos.w+8)
	rend.bmp1.height=(rectpos.h+8)
	if chk1.checked==true then (alphacol=getVPortBGColor()) else alphacol=(color 0 0 0)
	rend.bmp1.bitmap=bitmap (rectpos.w+8) (rectpos.h+8) color:alphacol
	for i=spn1.value to 1 by -1 do (
		bm=render outputwidth:(vs.x/(2^i)*2) outputheight:(vs.y/(2^i)*2) vfb:off rendertype:#regioncrop quiet:true
		if keyboard.escpressed==true then exit()
		bmresize=bitmap (rectpos.w) (rectpos.h)
		copy bm bmresize
		rend.bmp1.bitmap=bmresize)
	)
		-- НИЖЕ НЕ РАБОТАЕТ ДЛЯ НОВЫХ ВЕРСИЙ МАКСА!! :
	on btn2 pressed do (
	vs=getViewSize()
	renderwidth=vs.x
	renderheight=vs.y
		)

	on btn3 pressed do (
		setRenderType #view
		EditRenderRegion.EditRegion()
		)
)
CreateDialog reg_render
cui.RegisterDialogBar reg_render
)