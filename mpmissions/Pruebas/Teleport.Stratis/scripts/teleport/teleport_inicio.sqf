/*******************************************************************************
                          Realizado por |ArgA|Vultur|Sgt
*******************************************************************************/

// [
//     [
//         [Activador de origen, Marcador de destino],
//         [Activador de origen 2, Marcador de destino 2],
//         ...
//     ],
//     objeto al que se agrega el addAction
// ];

private _teleport_data = [
    [
        [startTrigger,"Alfa"],
        [startTrigger_2,"Bravo"]
    ],
    callObject
];

_teleport_data execVM "scripts\teleport\teleport.sqf";

/*******************************************************************************
                          Realizado por |ArgA|Vultur|Sgt
*******************************************************************************/