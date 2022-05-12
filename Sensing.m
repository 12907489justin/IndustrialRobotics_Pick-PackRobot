%% Presets
clear all
close all
clc
startup_rvc
set(0,'DefaultFigureWindowStyle','docked')
hold on

%% Variables 
Cap1 = transl (0,0,0);
Cap2 = transl (0,0,0);
Cap3 = transl (0,0,0);
GreenContainer = transl (0,0,0);
BlueContainer = transl (0,0,0);
RedContainer = transl (0,0,0);
Sensor = transl (0,0,0) * trotz(pi/2);
Frequency1 = 1000; %Red
Frequency2 = 500;  %Blue    
Frequency3 = 150;  %Green

Cap1F = Frequency1;
Cap2F = Frequency2;
Cap3F = Frequency3;

Option = 0;


%% Set environment 



%% Senserange
if Cap1 || Cap2 || Cap3 == transl(0,1,0)
    display ("Cap Located")
    senserange == true;
else 
    senserange == false;
end

%% Sensor
if senserange == true
    if Frequency <= 250
        display('Green Cap')
        Option = 1
    end
    if Frequency <= 750 
        display('Blue Cap')
        Option = 2
    end 
    if Frequency > 750 
        display('Red Cap')
    end
end


%% Operate
x = robot.getpos;
q1 = x;
steps = 25;

robot.fkine(BlueContainer)

if Option == 1
    q2 = robot.ikcon(GreenContainer, qguess);  
end
if Option == 2
    q2 = robot.ikcon(BlueContainer, qguess);
end
if Option == 3
    q2 = robot.ikcon(RedContainer, qguess);    
end

qMatrix = jtraj(q1,q2,steps);

for i =  1:steps                                %Animates the both robot movements simultanously from steps 1 to N
   robot.animate(qMatrix(i,:))                  
end

robot.fkine(robot.getpos)
