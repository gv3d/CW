<span style="color: rgb(153, 0, 0);">-- Когда наш роллаут открылся</span>
     on ExportRollout open do
     (
                   <span style="color: rgb(153, 0, 0);">-- пробуем</span>
                     try (
                   <span style="color: rgb(153, 0, 0);">-- выбрать объект с именем "SceneBox"</span>
                     scb = select $SceneBox
                         )
                   <span style="color: rgb(153, 0, 0);">-- если не получилось</span>
                         catch (
                  <span style="color: rgb(153, 0, 0);">-- создаём бокс</span>
                             ScBox = Box()
                   <span style="color: rgb(153, 0, 0);">-- даём ему имя</span>
                             ScBox.name = "SceneBox"
                  <span style="color: rgb(153, 0, 0);">-- и поместим его подальше, чтоб не мешал</span>
                             ScBox.pos.z = -5000
                   <span style="color: rgb(153, 0, 0);">-- после чего записываем все необходимые параметры.</span>
                              setUserProp ScBox "SHADOWT" shadowTec.selection
                             setUserProp ScBox "SHADOWS" shadowSyze.selection
                             setUserProp ScBox "SHADOW_R" shadowColor.color.r
                             setUserProp ScBox "SHADOW_G" shadowColor.color.g
                             setUserProp ScBox "SHADOW_B" shadowColor.color.b
                             setUserProp ScBox "AMBIENT_R" amColor.color.r
                             setUserProp ScBox "AMBIENT_G" amColor.color.g
                             setUserProp ScBox "AMBIENT_B" amColor.color.b
                                                 setUserProp ScBox "BCKGRND_R" bcColor.color.r
                                                 setUserProp ScBox "BCKGRND_G" bcColor.color.g
                             setUserProp ScBox "BCKGRND_B" bcColor.color.b
                             setUserProp ScBox "SCNAME" "defscene"
                             setUserProp ScBox "SAVEP" "C:\\"
                             setUserProp ScBox "XMLPATH" "C:\\"
                             setUserProp ScBox "CONVERT" true
                             setUserProp ScBox "ONLYXML" false
                                )
           <span style="color: rgb(153, 0, 0);">-- а тут мы читаем все параметры, и устанавливаем их соответствующим элементам.</span>
                           SC = getUserProp $SceneBox "SCNAME"
                  scName.text = (SC as String)
                   amColor.color.r = getUserProp $SceneBox "AMBIENT_R"
                  amColor.color.g = getUserProp $SceneBox "AMBIENT_G"
                  amColor.color.b = getUserProp $SceneBox "AMBIENT_B"
                  bcColor.color.r = getUserProp $SceneBox "BCKGRND_R"
                  bcColor.color.g = getUserProp $SceneBox "BCKGRND_G"
                  bcColor.color.b = getUserProp $SceneBox "BCKGRND_B"
                  shadowTec.selection = getUserProp $SceneBox "SHADOWT"
                  shadowSyze.selection = getUserProp $SceneBox "SHADOWS"
                  shadowColor.color.r = getUserProp $SceneBox "SHADOW_R"
                  shadowColor.color.g = getUserProp $SceneBox "SHADOW_G"
                  shadowColor.color.b = getUserProp $SceneBox "SHADOW_B"
                  saveText.text = getUserProp $SceneBox "SAVEP"
                  XMLText.text = getUserProp $SceneBox "XMLPATH"
                  convert.checked = getUserProp $SceneBox "CONVERT"
                  XMLText.enabled = convert.checked
                  butXML.enabled = convert.checked
                  onlyxml.checked = getUserProp $SceneBox "ONLYXML"
     )
 Теперь наш скрипт может читать сохранённые данные, но нам надо чтоб наш роллаут реагировал на нажатия кнопок,
выбор цвета и т.д. , и сохранял их. Реализовывать мы это будем по описанному выше принципу.
   <span style="color: rgb(153, 0, 0);">-- Когда в "Scene Name" введён текст, то</span>
     on scName entered text do
 (
  <span style="color: rgb(153, 0, 0);">-- записываем изменённый параметр.</span>
     setUserProp $SceneBox "SCNAME" scName.text
     )
  <span style="color: rgb(153, 0, 0);">-- когда изменился амбиент цвет</span>
     on amColor changed col do
 (
  <span style="color: rgb(153, 0, 0);">-- тоже записываем изменения</span>
     setUserProp $SceneBox "AMBIENT_R" amColor.color.r
     setUserProp $SceneBox "AMBIENT_G" amColor.color.g
     setUserProp $SceneBox "AMBIENT_B" amColor.color.b
     )
  <span style="color: rgb(153, 0, 0);">-- аналогично</span>
     on bcColor changed col do
 (
     setUserProp $SceneBox "BCKGRND_R" bcColor.color.r
     setUserProp $SceneBox "BCKGRND_G" bcColor.color.g
    setUserProp $SceneBox "BCKGRND_B" bcColor.color.b
     )
  <span style="color: rgb(153, 0, 0);">-- если произошел выбор техники теней</span>
     on shadowTec selected sel do
 (
     setUserProp $SceneBox "SHADOWT" shadowTec.selection
     )
  <span style="color: rgb(153, 0, 0);">-- если мы изменили размер теней</span>
     on shadowSyze selected sel do
 (
     setUserProp $SceneBox "SHADOWS" shadowSyze.selection
     )
  <span style="color: rgb(153, 0, 0);">-- а если поменяли цвет теней</span>
     on shadowColor changed col do
 (
     setUserProp $SceneBox "SHADOW_R" shadowColor.color.r
     setUserProp $SceneBox "SHADOW_G" shadowColor.color.g
     setUserProp $SceneBox "SHADOW_B" shadowColor.color.b
     )
  <span style="color: rgb(153, 0, 0);">-- если мы вписали путь сохранения сцены вручную то</span>
     on saveText entered text do
 (
     setUserProp $SceneBox "SAVEP" saveText.text
     )
  <span style="color: rgb(153, 0, 0);">-- а если нажали кнопку "Browse"</span>
     on butSave pressed  do
 (
  <span style="color: rgb(153, 0, 0);">-- получаем выбраный путь сохранения</span>
     pa=getSavePath()
  <span style="color: rgb(153, 0, 0);">-- проверяем его на корректность</span>
     if (pa!=undefined) then (
  <span style="color: rgb(153, 0, 0);">-- дописываем два обратных слеша в конец пути</span>
     pa=pa+"\\"
  <span style="color: rgb(153, 0, 0);">-- выводим полученный путь в поле "save to:"</span>
     saveText.text=pa
  <span style="color: rgb(153, 0, 0);">-- и записываем изменения</span>
     setUserProp $SceneBox "SAVEP" pa
                              )
     )
  <span style="color: rgb(153, 0, 0);">-- если мы поставили или сняли галочку</span>
     on convert changed state do
 (
  <span style="color: rgb(153, 0, 0);">-- записываем изменения</span>
     setUserProp $SceneBox "CONVERT" convert.checked
  <span style="color: rgb(153, 0, 0);">-- и устанавливаем зависимость активности "XMLText" и "butXML" от нашего выбора</span>
     XMLText.enabled = convert.checked
     butXML.enabled = convert.checked
     )
  <span style="color: rgb(153, 0, 0);">--если путь к XML конвертеру введён вручную</span>
     on XMLText entered text do
 (
  <span style="color: rgb(153, 0, 0);">-- записываем изменения</span>
     setUserProp $SceneBox "XMLPATH" XMLText.text
     )
  <span style="color: rgb(153, 0, 0);">-- если нажата кнопка "Browse" действуем аналогично выбора пути сохранения</span>
     on butXML pressed  do
 (
     pa=getSavePath()
     if (pa!=undefined) then (
     pa=pa+"\\"
     XMLText.text=pa
     setUserProp $SceneBox "XMLPATH" pa
     )
     )
  <span style="color: rgb(153, 0, 0);">-- если изменился статус "Export XML Scene Only"</span>
     on onlyxml changed state do
 (
  <span style="color: rgb(153, 0, 0);">-- тоже записываем изменения</span>
     setUserProp $SceneBox "ONLYXML" onlyxml.checked
     )
 <span style="color: rgb(153, 0, 0);">-- А тут мы будем вызывать саму функцию экспорта, если была нажата кнопка "Export"</span>
     on expBut pressed  do
 (
          )