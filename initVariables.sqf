gpsSetting = paramsArray select 0;
startingTime = paramsArray select 1;
detectionRadius =  paramsArray select 2;
detectionRadiusVehicle =  paramsArray select 3;
requiredObjectives = paramsArray select 4;
availableObjectives = paramsArray select 5;
objectiveRadius = paramsArray select 6;
nameTags = paramsArray select 7;
requiredIntel = paramsArray select 8;
//startingWeather = paramsArray select 9;
debugMode = paramsArray select 10;
disallowTeamswitch = paramsArray select 11;
acceleratedTime = paramsArray select 12;
dynamicObjectives = 0;
maxUavs = 1;

if(!isMultiplayer) then { debugMode = 1; };