-- Удаляет потеряные текстуры

texturas_perdidas = for t in (getClassInstances BitmapTexture) where not (doesFileExist t.filename) collect t
if queryBox ("Очистить " +texturas_perdidas.count as string + " потерянные текстуры?" ) beep:false then texturas_perdidas.filename = ""

