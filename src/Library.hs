-- HASKELICIA EN EL PAIS DE LAS FUNCIONES

module Library where
import PdePreludat

-- ========================
-- 1. El té eterno
-- ========================

cantTazasLiebre :: Number
cantTazasLiebre = 5

tazasDeTeDelSombrerero :: Number -> Number
tazasDeTeDelSombrerero dias = 2 * cantTazasLiebre * dias

-- Al definir `cantTazasLiebre` como una constante, hacemos que el código sea más expresivo y fácil de mantener.
-- Así, no solo se entiende de inmediato que la cantidad está asociada a la Liebre, 
-- sino que si mañana empieza a tomar 15 tazas, el cambio se hace en un solo lugar.


-- ========================
-- 2. Código que da miedo
-- ========================

-- Versión original del Conejo Blanco (poco clara y repetitiva):
{-
nummag :: Number -> Bool
nummag n =
  if n == 5 then True
  else
    if mod n 2 == 0 then
      if mod n 3 == 0 then True else True
    else
      if mod n 3 == 0 then True else False
-}

-- ¿Qué problemas tiene esta función?
-- - Es difícil de lee e innecesariamente larga.
-- - Usa estructuras condicionales innecesarias, cuando las expresiones ya son booleanas.
-- - Usa el valor 5 directamente, sin dar contexto (un "número mágico”, o cómo diría cualquier profe de física: “¿Cinco qué? ¿Manzanas? ¿Peras?”).
-- - Su nombre es poco expresivo.

-- Versión mejorada:

esNumeroMagico :: Number -> Bool
esNumeroMagico n = n == cantTazasLiebre || esMultiploDe 2 n || esMultiploDe 3 n

esMultiploDe :: Number -> Number -> Bool
esMultiploDe divisor numero = mod numero divisor == 0

-- Esta versión es clara y concisa. 
-- Expresa directamente la lógica sin repeticiones ni condicionales innecesarios.
-- Además, reutiliza `cantTazasLiebre`, lo que da mayor sentido al uso del número 5.

-- Es común pisar el palito y escribir una versión con guardas:
{-
esNumeroMagico n
  | mod n 2 == 0 || mod n 3 == 0 || n == 5 = True
  | otherwise = False
-}
-- Pero esta variante agrega complejidad innecesaria. 
-- Como la condición “mod n 2 == 0 || mod n 3 == 0 || n == 5” ya es booleana, no necesita evaluarse dentro de guardas.


-- ========================
-- 3. La Seta del Tamaño
-- ========================

nombreSeta :: Number -> String 
nombreSeta altura
  | altura < 50    = "seta roja"
  | altura <= 100  = "seta violeta"
  | otherwise      = "seta amarilla"

-- Aunque este ejercicio es simple, es un gran ejemplo del uso apropiado de guardas. 

-- ========================
-- 4. Árboles del Bosque de los Sueños
-- ========================

-- Cada árbol tiene un peso en función de su altura:
-- - Los primeros 3 metros (300 cm) pesan 3 kg por centímetro.
-- - Los centímetros restantes (si los hay) pesan 2 kg por centímetro.
-- - El peso total es útil si está entre 400 y 1000 kg.

-- Importante: hay varias formas de resolver el ejercicio, esta es una posible resolución.

alturaBase :: Number
alturaBase = 300

pesoPino :: Number -> Number
pesoPino altura = pesoTramoBase (aCm altura) + pesoTramoExtra (aCm altura)

pesoTramoExtra :: Number -> Number
pesoTramoExtra alturaCm = max 0 (alturaCm - alturaBase) * 2

pesoTramoBase :: Number -> Number
pesoTramoBase alturaCm = min alturaBase alturaCm * 3

aCm :: Number -> Number
aCm metros = metros * 100

-- Lo que destacamos de este ejercicio es el uso de funciones auxiliares 
-- para mantener la expresividad y declaratividad en el código. 
-- En este ejercicio vimos como resolver problemas de forma top down.

esPesoUtil :: Number -> Bool
esPesoUtil peso = peso >= 400 && peso <= 1000

sirvePino :: Number -> Bool
sirvePino altura = esPesoUtil (pesoPino altura)

-- ========================
-- BONUS: Descripción de función
-- ========================

-- Función: sirvePino

-- Qué hace:
-- Recibe la altura de un pino y determina si su peso es útil para la Reina Roja.

-- Cómo lo hace:
-- 1. Convierte la altura de metros a centímetros.
-- 2. Calcula el peso de los primeros 300 cm (3 kg por cm).
-- 3. Calcula el peso del resto (2 kg por cm).
-- 4. Suma ambos resultados.
-- 5. Evalúa si el peso total está dentro del rango deseado.

