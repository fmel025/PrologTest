lugar(casa).
lugar(trabajo).
lugar(parque).
lugar(salon).
lugar(peluqueria).

esta_cerca(casa, trabajo).
esta_cerca(trabajo, parque).
esta_cerca(parque, salon).
esta_cerca(salon, peluqueria).
esta_cerca(peluqueria, casa).

ruta(Origen, Destino, Ruta) :-
    ruta_aux(Origen, Destino, [Origen], Ruta).

% Caso base llegamos al destino
ruta_aux(Origen, Destino, Visitados, Ruta) :-
    esta_cerca(Origen, Destino),
    reverse([Destino | Visitados], Ruta), % Esto es porque cada nuevo lugar que se agregaba se hacia al inicio de la lista
    % Por lo que era necesario darle vuelta para tenerlo de origen a destino
    !.

% Caso recursivo, se revisan los lugares cercanos
ruta_aux(Origen, Destino, Visitados, Ruta) :-
    esta_cerca(Origen, Intermedio),
    \+ member(Intermedio, Visitados),
    ruta_aux(Intermedio, Destino, [Intermedio | Visitados], Ruta).