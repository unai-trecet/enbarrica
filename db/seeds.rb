# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Vino.delete_all
Vino.create(nombre: 'Finca la Estacada', id_bodega: 1, precio: 375, añada: 2007, id_envejecimiento: 0, meses_envejecimiento: 9, valoracion: 8, img_botella_small: 'img/finca_la_estacada_small.jpg', img_botella_big: 'img/finca_la_estacada_big.jpg', id_tipo_uva1: 1, id_tipo_uva_2: 2, id_tipo_uva_3: nil, id_tipo_uva_4: nil, id_tipo_uva1_5: nil)
Vino.create(nombre: 'Navajas', id_bodega: 1, precio: 450, añada: 2010, id_envejecimiento: 1, meses_envejecimiento: 0, valoracion: 8, img_botella_small: 'img/Navajas_Crianza_2010_small.jpg', img_botella_big: 'img/Navajas_Crianza_2010_big.jpg', id_tipo_uva1: 3, id_tipo_uva_2: nil, id_tipo_uva_3: nil, id_tipo_uva_4: nil, id_tipo_uva1_5: nil)