private["_unit", "_canRespawn"];
_unit = _this select 0;
_canRespawn = (count _this > 1) && (_this select 1);


_unit addEventHandler ["GetIn", {
    private ["_vehicle", "_crew", "_engineOn"];
    _vehicle = _this select 0;
    _crew = _this select 2;
    _engineOn = isEngineOn _vehicle;
    if(side _crew != west) then
    {
        _crew action ["GetOut", _vehicle];
        if(!_engineOn) then
        {
            _vehicle engineOn false;
        };
    };

}];

if(_unit isKindOf "Ship") then
{
    _unit removeWeaponTurret ["GMG_40mm", [0]]; 
    _unit removeMagazinesTurret ["200Rnd_40mm_G_belt", [0]];
    _unit disableTIEquipment true;
};

if(_unit isKindOf "Helicopter") then
{
	_unit disableTIEquipment true;
};



if(isServer) then
{
    clearWeaponCargoGlobal _unit;
    clearItemCargoGlobal _unit;
    clearMagazineCargoGlobal _unit;
    clearBackpackCargoGlobal _unit;

    if(_canRespawn) then
    {
        [_unit, west] call compile preprocessFileLineNumbers "initSpawnVehicle.sqf";
    };
};

if(hasInterface) then
{
    _unit addAction [ "Repair", Mh_fnc_repair, [], 1.5, true, true, "", 
    "if(side group player != west || vehicle player != player) exitWith { false; };
        private _result = false;
        {
            if(_x > 0.15) exitWith { _result = true; };

        } forEach ((getAllHitPointsDamage _target) select 2);
        _result;
    ",
    5];
};